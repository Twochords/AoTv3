# Muramite Chambers Classic Rebalance (Preview Only)

Date: 2026-05-16
Status: PREVIEW PACKAGE GENERATED ONLY
Execution: NO UPDATE statements executed

## Scope
Target zones only: chambersa/chambersb/chambersc/chambersd/chamberse/chambersf (304-309), versions 0/1/2
Excluded: provinggrounds (316)

## Required Preview Output

1. Candidate NPC count: 110
2. Spawn2 affected count: 123
3. Count per zone/version:
   - chambersa (304), version 1: 13 NPC templates
   - chambersa (304), version 2: 7 NPC templates
   - chambersb (305), version 1: 5 NPC templates
   - chambersb (305), version 2: 2 NPC templates
   - chambersc (306), version 1: 3 NPC templates
   - chambersc (306), version 2: 1 NPC templates
   - chambersd (307), version 1: 5 NPC templates
   - chambersd (307), version 2: 1 NPC templates
   - chamberse (308), version 0: 3 NPC templates
   - chamberse (308), version 1: 3 NPC templates
   - chamberse (308), version 2: 1 NPC templates
   - chambersf (309), version 0: 59 NPC templates
   - chambersf (309), version 1: 7 NPC templates
4. Current level min/max: 52-80
5. Proposed level min/max: 25-30
6. Current HP/damage min/max: HP 28-17000000, DMG 1-5300
7. Proposed HP/damage min/max: HP 900-1944, DMG 22-89
8. special_abilities/npcspecialattks count before: special_abilities=110, npcspecialattks=9
9. Proposed ability clearing count: 110
10. Exact backup table names: npc_types_backup_muramite_chambers_classic_20260516, spawn2_backup_muramite_chambers_respawn_20260516
11. Exact modified tables: npc_types, spawn2 (respawntime only)
12. Confirmation no UPDATE executed: CONFIRMED (preview package generation only)

## Current vs Proposed by Zone/Version
| Zone | ID | Version | NPC Count | Current Lvl | Proposed Lvl | Current HP | Proposed HP | Current DMG | Proposed DMG |
|---|---:|---:|---:|---|---|---|---|---|---|
| chambersa | 304 | 1 | 13 | 52-72 | 25-27 | 7600-500000 | 900-1458 | 190-1261 | 22-80 |
| chambersa | 304 | 2 | 7 | 75-75 | 27-28 | 800000-1500000 | 1458-1593 | 545-5300 | 27-82 |
| chambersb | 305 | 1 | 5 | 70-72 | 27-28 | 7904-720000 | 1458-1593 | 192-1600 | 27-82 |
| chambersb | 305 | 2 | 2 | 80-80 | 29-29 | 17000000-17000000 | 1755-1755 | 750-2650 | 29-86 |
| chambersc | 306 | 1 | 3 | 64-72 | 26-28 | 40000-200000 | 980-1593 | 143-2040 | 23-82 |
| chambersc | 306 | 2 | 1 | 75-75 | 29-29 | 28-28 | 1755-1755 | 1-6 | 29-86 |
| chambersd | 307 | 1 | 5 | 62-72 | 28-30 | 7904-130000 | 1180-1944 | 123-1500 | 25-89 |
| chambersd | 307 | 2 | 1 | 80-80 | 30-30 | 4300000-4300000 | 1944-1944 | 1275-4600 | 31-89 |
| chamberse | 308 | 0 | 3 | 65-70 | 28-28 | 35475-45820 | 1180-1180 | 390-3000 | 25-72 |
| chamberse | 308 | 1 | 3 | 65-72 | 29-30 | 15000-125000 | 1300-1944 | 235-2100 | 26-89 |
| chamberse | 308 | 2 | 1 | 75-75 | 30-30 | 3500000-3500000 | 1944-1944 | 1275-4600 | 31-89 |
| chambersf | 309 | 0 | 59 | 70-70 | 30-30 | 100000-150000 | 1944-1944 | 102-1912 | 31-89 |
| chambersf | 309 | 1 | 7 | 65-72 | 30-30 | 26606-100000 | 1440-1944 | 154-2100 | 27-89 |

## Candidate Filter (combat-only)
Included spawn scope: exact zones chambersa-f, versions 0/1/2
Excluded from NPC updates: merchants, death_touch/George utility actors, shell/chest/corpse entities, controller/trigger/invisible/soulbinder/banker/merchant/pet utility names, bodytypes 11/33
Preserved: spawn geometry, spawn groups, spawnentry, pathing, factions, loot tables, quests

## Respawn Cadence
Default normalized respawn is 1200 seconds (20 minutes)
Rows already above 1440 seconds are preserved (named/rare pacing retained)

## Files
- sql/reverse-progression/muramite_chambers_classic_rebalance.sql
- sql/reverse-progression/muramite_chambers_respawn_normalization.sql
- sql/reverse-progression/muramite_chambers_rollback.sql
- docs/muramite_chambers_classic_rebalance.md
