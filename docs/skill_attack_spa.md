# SkillAttack SPA (AoTv3)

SPA 193 (`SpellEffect::SkillAttack`) triggers a melee, archery, or throwing attack
against the spell target using the caster's equipped gear and skill. The damage
scales with the caster's weapon or armor stats rather than being a flat value.

---

## How it works

When a spell with `effectid = 193` fires, `zone/spell_effects.cpp` reads three
fields from the spell row and dispatches to the appropriate attack function:

```
spells[spell_id].skill        → which attack function to call
spells[spell_id].base_value   → dps_pct  (damage, see below)
spells[spell_id].limit_value  → chance_mod (hit chance bonus, additive %)
```

The reuse lockout passed to the attack function is:

```
ReuseTime = spells[spell_id].recast_time + spells[spell_id].recovery_time
```

---

## Dispatch by skill

| `skill` field | Constant | Attack function called |
|---|---|---|
| `7` | `SkillArchery` | `DoArcheryAttackDmg` |
| `17` | `SkillThrowing` | `DoThrowingAttackDmg` |
| anything else | (e.g. `SkillKick=30`, `Skill1HSlashing=1`) | `DoMeleeSkillAttackDmg` |

---

## DPS normalization (`dps_pct`)

`base_value` is a **percentage of the caster's base DPS per second**, not a flat
damage number. This keeps skill attacks relevant across gear tiers without manual
rebalancing — a higher-damage weapon automatically yields higher skill attack hits.

### Formula

**Weapon-based skills** (1H/2H slashing, piercing, blunt, H2H, archery, dual wield):

```
weapon_damage = dmg_stat * 10 * dps_pct / delay / 100
```

Where `dmg_stat` is the weapon's damage stat and `delay` is the weapon delay.
Bare fist falls back to `GetHandToHandDamage()` / `GetHandToHandDelay()`.

**Armor-based skills** (bash, dragon punch, eagle strike, tiger claw, kick variants):

```
weapon_damage = item_AC * dps_pct / 100
```

The specific gear slot checked per skill:

| Skill | Gear slot consulted |
|---|---|
| `SkillBash` | Secondary (shield AC); fallback: shoulders AC; fallback: 1 |
| `SkillDragonPunch`, `SkillEagleStrike`, `SkillTigerClaw` | Hands (glove AC) |
| `SkillKick`, `SkillRoundKick`, `SkillFlyingKick` | Feet (boot AC) |
| `SkillDualWield` | Secondary weapon damage stat |

**NPC formula** (no equipment slots):

```
weapon_damage = BaseDamage * 10 * dps_pct / AttackDelay / 100
```

### Practical values

| `dps_pct` | Effective damage relative to 1 second of auto-attack DPS |
|---|---|
| `100` | Exactly 1 hit worth of DPS |
| `300` | 3× DPS hit |
| `600` | 6× DPS hit (strong discipline-tier) |
| `900` | 9× DPS hit (finisher / long cooldown) |

---

## Hit chance bonus (`limit_value`)

`limit_value` is passed as `chance_mod` to the attack function — an additive bonus
to the chance-to-hit roll. Normal attacks use 0. Setting this to `50` roughly
doubles hit reliability (the exact calculation is inside the attack path's
avoidance checks).

---

## Focus modifier

If `RuleB(Spells, AllowFocusOnSkillDamageSpells)` is true, the damage is
additionally modified by the caster's melee damage focus for the used skill:

```cpp
focus = caster->GetMeleeDamageMod_SE(spells[spell_id].skill);
// applied as: weapon_damage += weapon_damage * focus / 100;
```

---

## Level 1 examples

From `deploy_scripts/migrations_example/0002_aot_spells_level1.sql`:

| Spell | ID | `skill` | `base_value` | `limit_value` | `EndurCost` | Recast | Notes |
|---|---|---|---|---|---|---|---|
| Kick | 60030 | 30 (SkillKick) | 100 | 0 | 5 | 10 s | + SPA 21 (500 ms stun) |
| Strike | 60031 | 1 (Skill1HSlash) | 600 | 0 | 12 | 3 s | — |
| Snipe | 60032 | 7 (SkillArchery) | 900 | 50 | 10 | 7.5 s | +50 hit chance |

Kick boots damage from boot AC. Strike and Snipe scale from primary weapon /
equipped bow stats.

---

## Common skill ID reference

These are the values you put in the `skill` column of `spells_new`:

| ID | Constant | Notes |
|---|---|---|
| 0 | `Skill1HBlunt` | |
| 1 | `Skill1HSlashing` | Strike |
| 2 | `Skill2HBlunt` | |
| 3 | `Skill2HSlashing` | |
| 4 | `SkillAbjuration` | (spell school, not combat) |
| 7 | `SkillArchery` | Snipe — routes to DoArcheryAttackDmg |
| 17 | `SkillThrowing` | Throw Stone — routes to DoThrowingAttackDmg |
| 25 | `Skill2HPiercing` | |
| 28 | `SkillBash` | Shield/shoulder AC |
| 30 | `SkillKick` | Boot AC — Kick |
| 33 | `SkillRoundKick` | Boot AC |
| 38 | `SkillFlyingKick` | Boot AC |
| 52 | `SkillDragonPunch` | Glove AC (also SkillTailRake) |
| 53 | `SkillEagleStrike` | Glove AC |
| 54 | `SkillTigerClaw` | Glove AC |
| 74 | `SkillDualWield` | Secondary weapon |

---

## Throw Stone

Throw Stone (ID 60035) is implemented as a flat SPA 0 (CurrentHP -5) spell with
physical resist rather than SPA 193. A STR/25 damage formula would require a new
custom SPA; the flat 5-damage approach is intentional for tier 1 and revisable later.
See `deploy_scripts/migrations_example/0004_aot_passive_self_buffs.sql`.

---

## Code locations

| File | What it contains |
|---|---|
| `zone/spell_effects.cpp` | SPA 193 dispatch case — skill-based routing and focus lookup |
| `zone/special_attacks.cpp` | `DoMeleeSkillAttackDmg()` — dps_pct → weapon_damage formula, per-skill gear slot logic |
| `deploy_scripts/migrations_example/0002_aot_spells_level1.sql` | Kick, Strike, Snipe spell INSERTs |
