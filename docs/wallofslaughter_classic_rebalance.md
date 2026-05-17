# Wall of Slaughter Classic Rebalance (Preview Only)

Date: 2026-05-16
Status: PREVIEW PACKAGE GENERATED ONLY
Execution: No UPDATE executed

## Scope
Zone: wallofslaughter (version 0)
Target levels: 25-28
Tables intended to modify on approval: npc_types, spawn2(respawntime only)

## Required Preview Output
1. Candidate NPC count: 76
2. Spawn2 affected count: 397
3. Named NPC count: 49
4. Trash NPC count: 27
5. Current level min/max: 62-85
6. Proposed level min/max: 25-28
7. Current HP/damage min/max: HP 6744-2600000, DMG 10-3000
8. Proposed HP/damage min/max: HP 900-1914, DMG 21-83
9. special_abilities/npcspecialattks count before: special_abilities=76, npcspecialattks=3
10. Proposed ability clearing count: 76
11. Exact backup table names: npc_types_backup_wallofslaughter_classic_20260516, spawn2_backup_wallofslaughter_respawn_20260516
12. Exact modified tables: npc_types, spawn2 (respawntime only)
13. Confirmation no UPDATE executed: CONFIRMED

## Named Rules
Named classification uses EQEmu conventions: # prefix, non-trash naming pattern, or long respawn (>=3600).
Named are fixed to level 28 and tuned harder via HP/damage/AC only.

## Respawn Rules
Trash respawn: 1200 seconds
Named respawn: preserved if 1800-2400; raised to 1800 if lower; capped to 2400 if higher
No raid lockout-style timers retained for named

## Candidate Snapshot
| NPC ID | Name | Current Lvl | Proposed Lvl | Current HP | Proposed HP | Current DMG | Proposed DMG | Named | Respawn(min-max) |
|---:|---|---:|---:|---:|---:|---|---|---|---|
| 300000 | #Bazu_Bonesmasher | 68 | 28 | 50000 | 1914 | 235-900 | 27-83 | yes | 960-960 |
| 300001 | a_murkglider_preystalker | 65 | 26 | 36000 | 1020 | 154-629 | 22-62 | no | 960-960 |
| 300002 | an_infernal_chimera | 63 | 25 | 35000 | 900 | 133-532 | 21-60 | no | 300-960 |
| 300003 | a_bazu_thrasher | 64 | 25 | 36000 | 900 | 165-640 | 21-60 | no | 300-960 |
| 300004 | a_murkglider_deathglider | 65 | 26 | 36000 | 1020 | 154-629 | 22-62 | no | 960-960 |
| 300005 | a_girplan_stonecrafter | 66 | 26 | 37500 | 1020 | 164-658 | 22-62 | no | 960-960 |
| 300006 | a_savage_feran | 62 | 25 | 37500 | 900 | 123-484 | 21-60 | no | 300-960 |
| 300007 | a_girplan_geomancer | 66 | 26 | 37500 | 1020 | 164-658 | 22-62 | no | 960-960 |
| 300008 | a_ferocious_feran | 62 | 25 | 35000 | 900 | 123-484 | 21-60 | no | 300-960 |
| 300009 | a_dragorn_vassal | 64 | 25 | 35000 | 900 | 143-561 | 21-60 | no | 960-960 |
| 300010 | a_dragorn_darkwarrior | 67 | 26 | 40000 | 1020 | 204-793 | 22-62 | no | 960-960 |
| 300011 | #Dragorn_Blightkeeper | 68 | 28 | 41000 | 1914 | 235-900 | 27-83 | yes | 960-960 |
| 300012 | a_discordling_enchainer | 66 | 26 | 39000 | 1020 | 164-658 | 22-62 | no | 960-960 |
| 300013 | an_elite_ukun_boneretriever | 67 | 28 | 39000 | 1914 | 164-658 | 27-83 | yes | 960-7200 |
| 300014 | an_elite_ukun_deathfang | 67 | 28 | 39000 | 1914 | 164-658 | 27-83 | yes | 960-7200 |
| 300015 | a_discordling_taskfiend | 66 | 26 | 38000 | 1020 | 164-658 | 22-62 | no | 960-960 |
| 300016 | a_dragorn_toiler | 64 | 25 | 34000 | 900 | 143-561 | 21-60 | no | 960-960 |
| 300017 | a_dragorn_battlemaster | 65 | 26 | 36000 | 1020 | 154-629 | 22-62 | no | 960-1200 |
| 300018 | a_dragorn_serf | 64 | 25 | 34000 | 900 | 143-561 | 21-60 | no | 960-960 |
| 300019 | a_Dragorn_Mastermind | 70 | 27 | 50000 | 1160 | 204-793 | 22-64 | no | 960-960 |
| 300020 | #Velitorkin | 73 | 28 | 1050000 | 1914 | 550-2450 | 27-83 | yes | 108000-108000 |
| 300021 | a_dragorn_sentinel | 65 | 26 | 35000 | 1020 | 154-629 | 22-62 | no | 960-960 |
| 300022 | a_raging_chimera | 63 | 25 | 35000 | 900 | 133-532 | 21-60 | no | 300-960 |
| 300025 | an_elite_kyv_hunter | 67 | 28 | 39000 | 1914 | 158-633 | 27-83 | yes | 960-7200 |
| 300026 | an_elite_kyv_hunter | 67 | 28 | 39000 | 1914 | 158-633 | 27-83 | yes | 960-7200 |
| 300027 | an_elite_noc_sprayblood | 67 | 28 | 41000 | 1914 | 174-687 | 27-83 | yes | 960-7200 |
| 300028 | a_murkglider_licheglider | 65 | 26 | 36000 | 1020 | 154-629 | 22-62 | no | 960-960 |
| 300029 | a_murkglider_spiritsipper | 65 | 26 | 36000 | 1020 | 154-629 | 22-62 | no | 960-960 |
| 300030 | a_murkglider_soulstalker | 65 | 26 | 36000 | 1020 | 154-629 | 22-62 | no | 960-960 |
| 300031 | #Cipheron | 85 | 28 | 800000 | 1914 | 680-2200 | 27-83 | yes | 7200-7200 |
