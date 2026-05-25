# Passive Buff System (AoTv3)

Passive buffs are spells that the server automatically applies and maintains while
the caster has them memorized. The caster pays a mana and/or endurance cost on a
configurable interval; when they can no longer afford the cost, or when positional
conditions fail, the buff fades immediately.

---

## How the server identifies a passive spell

`buffdurationformula = 52` in `spells_new` is the passive aura sentinel.

- Values 0–15, 50–51 are used by vanilla EQEmu for normal duration formulas.  
- 52 is unused by the engine, so it is safe as a custom flag.  
- The client never sees this field; it affects only server-side logic.

---

## Database fields

The following `spells_new` columns take on new meanings for passive spells.
They are **not** used through the normal casting path (passive spells are never
cast by the player), so repurposing them is safe.

| Column | Normal meaning | Passive meaning |
|---|---|---|
| `buffdurationformula` | Duration formula (0–15) | `52` = passive sentinel |
| `buffduration` | Duration cap | Set to `0` (unused) |
| `recast_time` | Recast lockout (ms) | **Cost payment interval (ms)**. `0` = free passive, no drain ever. |
| `mana` | Cast mana cost | **Mana drained from caster per interval** |
| `EndurCost` | Cast endurance cost | **Endurance drained from caster per interval** |
| `targettype` | Spell target type | Controls who receives the buff (see below) |
| `range` | Spell cast range | For group buffs: maximum distance caster→member |

### Target types

| `targettype` | Constant | Who gets the buff |
|---|---|---|
| `6` | `ST_Self` | Caster only. No group or range check. |
| `41` | `ST_Group` | All group members within `range` units of the caster. When solo, applies to the caster only. |

### Cost examples

```sql
-- Free passive — no drain ever
recast_time = 0, mana = 0, EndurCost = 0

-- 5 mana every 30 seconds
recast_time = 30000, mana = 5, EndurCost = 0

-- 10 endurance every 6 seconds (every tick)
recast_time = 6000, mana = 0, EndurCost = 10

-- 8 mana + 4 endurance every minute
recast_time = 60000, mana = 8, EndurCost = 4
```

---

## How the buff behaves on the client

Passive buffs are applied with `duration_override = PERMANENT_BUFF_DURATION` (`-1000`).
`AddBuff` stores this directly as `ticsremaining`. `BuffProcess` skips the
decrement/expiry check when `ticsremaining == PERMANENT_BUFF_DURATION`, so the buff
never expires on its own. This means:

- **No countdown timer is shown** in the buff window.
- The buff icon appears and persists until the server explicitly fades it.
- The buff is never decremented by `BuffProcess`; only explicit server-side fades remove it.

> **Why not -1?** `PERMANENT_BUFF_DURATION = -1000` is the engine's sentinel for
> truly permanent buffs. Using `-1` instead would cause `BuffProcess` to decrement
> to `-2` each tick and immediately expire the buff, producing a fade-and-reapply
> cycle every 6 seconds.

---

## When buffs apply and when they fade

The system runs in `EntityList::ProcessPassiveAuras()`, called once every 6 seconds
from a `Timer(6000)` in `zone/main.cpp`. Each run has three sequential phases.

### Phase 0 — Cost / active-set

For each client, for each `formula=52` spell on their spellbar:

1. If `recast_time = 0`: spell is free, immediately marked **active**.
2. If payment is not yet due (next-due timestamp is in the future): marked **active** with no charge.
3. If payment **is** due:
   - Check `GetMana() >= mana` and `GetEndurance() >= endurance_cost`.
   - If **affordable**: deduct both costs, record `next_due = now + recast_time`, mark **active**.
   - If **unaffordable**: spell is **not** marked active. Its buff(s) will be faded in phase 2.

The per-spell payment schedule (`m_passive_upkeep_times`) lives on `EntityList` and
resets when a player zones or disconnects, so the first tick in any zone always triggers
an immediate payment attempt.

### Phase 1 — Apply

For each active spell, apply the buff to eligible targets if it is not already present:

- `ST_Self`: apply to caster only.
- `ST_Group`: apply to each living group member within `range` of the caster.

Buffs already present (any caster) are skipped — no SPA effects are re-triggered.

### Phase 2 — Fade

For every `formula=52` buff on every client, check whether it should be removed:

| Condition | Applies to |
|---|---|
| Caster's spell is not in the active set (OOM / unmemorized) | All target types |
| Caster is dead or no longer in zone | All target types |
| Target left the caster's group | `ST_Group` only |
| Target is out of range | `ST_Group` only |
| Caster went solo and target is not the caster | `ST_Group` only |

Fades happen via `BuffFadeBySpellIDAndCaster`, which correctly removes the buff and
recalculates bonuses on the target.

---

## How to add a new passive spell

### 1. Insert the spell row

Use the standard `spells_new` INSERT with `buffdurationformula = 52`, `buffduration = 0`,
and the chosen cost fields:

```sql
INSERT INTO spells_new
  (id, name, cast_time, recovery_time, recast_time,
   buffdurationformula, buffduration, mana, EndurCost,
   effectid1, effect_base_value1,
   resisttype, ResistDiff, targettype, goodEffect, IsDiscipline, `range`,
   you_cast, cast_on_you, cast_on_other, spell_fades)
VALUES
  (60033, 'Example Passive', 0, 0, 30000,   -- recast_time = cost interval
   52, 0,                                    -- formula=52, duration unused
   5, 0,                                     -- 5 mana per interval, no endur cost
   4, 10,                                    -- SPA 4 (STR) +10
   0, 0, 41, 1, 0, 200,                      -- ST_Group, range 200
   '', 'You feel stronger.', '', 'The strength fades.');
```

### 2. Write a numbered migration

Create `deploy_scripts/migrations/<next_number>_<description>.sql` and include the
INSERT (and any UPDATE for cost/formula fields).

### 3. No server code changes needed

The passive system reads `buff_duration_formula`, `recast_time`, `mana`,
`endurance_cost`, `target_type`, and `range` directly from the loaded spell data.
Adding a new passive is purely a database operation.

---

## Spell IDs reserved for AoT custom content

| Range | Purpose |
|---|---|
| 60000–60032 | Level 1 spell roster (see `0002_aot_spells_level1.sql`) |
| 60033 | Breeze |
| 60034 | Life Ebb |
| 60035 | Throw Stone |
| 60036 | Passive Protection |
| 60037 | Sturdy Footing |
| 60038+ | Future content |

---

## Code locations

| File | What it contains |
|---|---|
| `zone/entity.h` | `ProcessPassiveAuras()` and `ApplyPassiveBuffIfMissing()` declarations; `m_passive_upkeep_times` member |
| `zone/entity.cpp` | Full implementation of both functions |
| `zone/main.cpp` | `PassiveAuraTimer(6000)` — the zone-level 6 s tick that drives the system |
| `common/spdat.h` | SPA 527 (`EnduranceToMana`) and 528 (`HPToMana`) constants |
| `deploy_scripts/migrations_example/0002_aot_spells_level1.sql` | Initial spell INSERTs (group auras 60024–60029 inserted with `formula=7` placeholder) |
| `deploy_scripts/migrations_example/0003_aot_passive_buff_flag.sql` | Sets `formula=52`, `recast_time`, and cost fields on the group auras |
| `deploy_scripts/migrations_example/0004_aot_passive_self_buffs.sql` | Breeze (60033), Life Ebb (60034), Throw Stone (60035) |
