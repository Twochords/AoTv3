# Dranik's Scar — Reverse-Progression Rebalance

**Date:** 2026-05-09  
**Branch:** `feature/draniksscar-reverse-progression`  
**Server:** AoTv3 (EQEmu 23.10.3)

---

## Overview

Full reverse-progression normalization pass on Dranik's Scar zone NPCs. 65 NPC entries were corrected to era-appropriate level caps matching Omens of War / Gates of Discord reverse-progression tier. An Emberwatch Guard (NPC 998038) received explicit Lua-based guard-assist behavior to compensate for social-assist limitations.

---

## Changes

### NPC Level Normalization

| Stat | Value |
|------|-------|
| NPCs normalized | 65 |
| NPC ID range | 302000 – 302064 |
| Zone | Dranik's Scar (`draniksscar`) |
| Verification result | `exact_level_matches=65`, `level_mismatches=0` |

### Spell Lists Cleared

24 NPCs had `npc_spells_id` values referencing spell lists incompatible with reverse-progression tier caps. All 24 were reset to `npc_spells_id = 0`.

### Special Abilities Cleared

19 NPCs carried `special_abilities` strings (e.g., `10,1^14,1`) overriding reverse-progression combat behavior. All 19 were reset to `special_abilities = ''`.

### Guard Assist — NPC 998038 (An Emberwatch Guard)

**DB field changes:**

| Field | Before | After |
|-------|--------|-------|
| `aggroradius` | 55 | 60 |
| `assistradius` | 55 | 80 |
| `special_abilities` | `'10,1^14,1'` | `''` |
| `npcspecialattks` | `''` | `''` |
| `npc_spells_id` | 0 | 0 |

**Lua guard-assist script:** `quests/draniksscar/998038.lua`

Behavior:
- 2-second timer scan (`guard_assist`, 2000 ms interval)
- Assist range: 80 units
- Scans NPC entity list for any NPC attacking a player client
- Skips: friendly faction 5059, vendor/merchant/banker/placeholder/controller NPCs, corpses
- On detection: says "To arms! I will defend you!", calls `AddToHateList(npc, 1000)` and `eq.attack(npc_name)`
- Re-arms timer on combat exit

---

## Rollback

Backup table preserved in the live database:

```
npc_types_backup_draniksscar_20260509
```

Full rollback SQL: [`sql/reverse-progression/draniksscar_rollback.sql`](../sql/reverse-progression/draniksscar_rollback.sql)

To rollback the guard-assist Lua: remove `quests/draniksscar/998038.lua` from the server and run `#reloadquest` in the zone.

---

## Files

| Path | Purpose |
|------|---------|
| `quests/draniksscar/998038.lua` | Guard-assist timer scan Lua script |
| `sql/reverse-progression/draniksscar_npc_normalization.sql` | Full normalization SQL with comments |
| `sql/reverse-progression/draniksscar_rollback.sql` | Rollback to pre-normalization state |
| `sql/reverse-progression/draniksscar_verify.sql` | Verification queries |
| `docs/draniksscar-reverse-progression.md` | This document |
