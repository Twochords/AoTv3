# Retrofit Cleanup Audit (Malformed NPC Special Flags)

## Objective
Apply a surgical cleanup for malformed `npcspecialattks` values while avoiding broad stat rebalance risk.

## Executed Scope
- Table: `npc_types`
- Column changed: `npcspecialattks` only
- Rows changed: 17
- ID set:
  - 302024, 302035, 302036, 302066
  - 303019, 303041, 303042, 303052
  - 303029, 303039, 303040, 303043
  - 303044, 303045, 303053, 303086
  - 303070

## Transform Rules
- `f` -> `''`
- `UMCNIDABH` (303070) -> `''`

## Explicit Exclusions
- Underscore NPCs were not modified:
  - 303048, 303049, 303050, 303098, 303099
- Custom NPC excluded and unchanged:
  - 998038 (An Emberwatch Guard)

## Backup/Recovery
- Backup table: `npc_types_backup_class45_attkflags_only_20260517`
- Expected backup count: 17
- Rollback SQL artifact: `sql/reverse-progression/retrofit_cleanup_rollback.sql`

## Verification Checklist
- All 17 target rows have empty `npcspecialattks`.
- Backup table exists and has 17 rows.
- Excluded underscore rows remain unchanged.
- 998038 remains unchanged.

## Artifact Files
- `sql/reverse-progression/retrofit_cleanup_preview.sql`
- `sql/reverse-progression/retrofit_cleanup_rollback.sql`
- `docs/retrofit_cleanup_audit.md`
