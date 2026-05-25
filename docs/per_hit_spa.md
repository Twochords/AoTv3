# Per-Hit Defensive SPAs (AoTv3)

These SPAs fire inside `Mob::ReduceDamage()` on every melee hit received by the
buff holder. They have no depletion cap — the effect is active on every single hit
as long as the buff is present and (where applicable) the holder can afford the
endurance cost.

---

## Hook location

`Mob::ReduceDamage(int64 damage)` in `zone/attack.cpp`.

Called once per melee hit on the defender, after NegateAttacks and
MitigateMeleeDamage (rune-based SPA 162) are evaluated, before the flat MeleeRune
(SPA 55) absorb. The function returns the modified damage value.

Execution order within `ReduceDamage`:

1. NegateAttacks (SPA 163) — block entire hit or up to a per-hit cap
2. MitigateMeleeDamage (SPA 162) — % reduction with depleting rune pool
3. **MeleeHitFlatAbsorb (SPA 529)** — flat reduction, no cap ← AoT
4. **MeleeHitPctAbsorb (SPA 530)** — % reduction, endurance-gated ← AoT
5. MeleeRune (SPA 55) — flat HP rune, depletes to 0

---

## SPA 529 — MeleeHitFlatAbsorb

Subtracts a flat amount from every melee hit received. Always fires; no cost,
no depletion.

| Field | Meaning |
|---|---|
| `base_value` | Flat damage absorbed per hit |
| `limit_value` | Unused |

Multiple sources accumulate additively in `spellbonuses.MeleeHitFlatAbsorb`.

Damage floor: 1 (hit still registers, damage is just reduced).

### Spell: Passive Protection (ID 60036)

```
effectid = 529, base_value = 1   → absorb 1 damage per hit
targettype = 41 (ST_Group), range = 200
```

---

## SPA 530 — MeleeHitPctAbsorb

Reduces incoming melee damage by a percentage each hit. When `limit_value > 0`,
the reduction is gated behind an endurance check — if the holder cannot afford the
cost, the protection is skipped entirely for that hit (and no endurance is drained).

| Field | Meaning |
|---|---|
| `base_value` | % of damage reduced per hit |
| `limit_value` | Endurance cost per hit (0 = always applies, no cost) |

`base_value` and `limit_value` accumulate additively across all SPA 530 sources
into `spellbonuses.MeleeHitPctAbsorb` and `spellbonuses.MeleeHitPctAbsorbEndurCost`.

Endurance check: `holder.endurance >= total_cost` → drain cost, apply reduction.
If insufficient: skip both. The passive buff stays on; it simply does nothing
that hit.

Damage floor: 1.

### Spell: Sturdy Footing (ID 60037)

```
effectid = 530, base_value = 12, limit_value = 1   → reduce 12% per hit, costs 1 endurance
targettype = 6 (ST_Self)
```

Because endurance is a depleting fight-battery (see endurance design philosophy),
Sturdy Footing's protection naturally degrades as the fight progresses. No
additional code is needed to enforce this — the cost check handles it.

---

## Adding future per-hit defensive SPAs

1. Add a `constexpr int` in `common/spdat.h` (531+).
2. Add field(s) to `StatBonuses` in `zone/common.h`.
3. Add accumulation case to `Mob::ApplySpellsBonuses` in `zone/bonuses.cpp`.
4. Add a block to `Mob::ReduceDamage` in `zone/attack.cpp`.
5. Add a no-op case in the main SpellEffect switch in `zone/spell_effects.cpp`.
6. SQL migration + spell INSERT.

---

## Code locations

| File | What it contains |
|---|---|
| `common/spdat.h` | SPA 529 and 530 constants |
| `zone/common.h` | `MeleeHitFlatAbsorb`, `MeleeHitPctAbsorb`, `MeleeHitPctAbsorbEndurCost` in `StatBonuses` |
| `zone/bonuses.cpp` | Accumulation cases in `ApplySpellsBonuses` |
| `zone/attack.cpp` | Hook blocks in `Mob::ReduceDamage` |
| `zone/spell_effects.cpp` | No-op cases in main SpellEffect switch |
| `deploy_scripts/migrations_example/0005_aot_per_hit_passives.sql` | Passive Protection (60036), Sturdy Footing (60037) |
