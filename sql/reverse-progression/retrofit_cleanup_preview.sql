-- Retrofit cleanup (surgical): malformed npcspecialattks flags
-- Scope approved and executed: 17 npc_types rows, only column updated: npcspecialattks
-- Date: 2026-05-17

USE peq;

-- -----------------------------------------------------------------------------
-- 1) Backup (required)
-- -----------------------------------------------------------------------------
DROP TABLE IF EXISTS npc_types_backup_class45_attkflags_only_20260517;

CREATE TABLE npc_types_backup_class45_attkflags_only_20260517 AS
SELECT *
FROM npc_types
WHERE id IN (
  302024, 302035, 302036, 302066,
  303019, 303041, 303042, 303052,
  303029, 303039, 303040, 303043,
  303044, 303045, 303053, 303086,
  303070
);

SELECT 'backup_row_count' AS check_name, COUNT(*) AS row_count
FROM npc_types_backup_class45_attkflags_only_20260517;

-- -----------------------------------------------------------------------------
-- 2) Exact executed update statement
-- -----------------------------------------------------------------------------
UPDATE npc_types
SET npcspecialattks = ''
WHERE id IN (
  302024, 302035, 302036, 302066,
  303019, 303041, 303042, 303052,
  303029, 303039, 303040, 303043,
  303044, 303045, 303053, 303086,
  303070
)
AND npcspecialattks IN ('f', 'UMCNIDABH');

SELECT ROW_COUNT() AS updated_rows;

-- -----------------------------------------------------------------------------
-- 3) Verification queries
-- -----------------------------------------------------------------------------
-- A) all 17 target rows now empty
SELECT id, name, npcspecialattks
FROM npc_types
WHERE id IN (
  302024, 302035, 302036, 302066,
  303019, 303041, 303042, 303052,
  303029, 303039, 303040, 303043,
  303044, 303045, 303053, 303086,
  303070
)
ORDER BY id;

SELECT 'target_non_empty_count' AS check_name,
       COUNT(*) AS non_empty_rows
FROM npc_types
WHERE id IN (
  302024, 302035, 302036, 302066,
  303019, 303041, 303042, 303052,
  303029, 303039, 303040, 303043,
  303044, 303045, 303053, 303086,
  303070
)
AND COALESCE(npcspecialattks, '') <> '';

-- B) backup still present with 17 rows
SELECT 'backup_row_count' AS check_name,
       COUNT(*) AS row_count
FROM npc_types_backup_class45_attkflags_only_20260517;

-- C) underscore NPCs unchanged (excluded from cleanup)
SELECT id, name, npcspecialattks
FROM npc_types
WHERE id IN (303048, 303049, 303050, 303098, 303099)
ORDER BY id;

-- D) custom NPC untouched
SELECT id, name, level, hp, maxdmg, AC, npcspecialattks
FROM npc_types
WHERE id = 998038;

-- E) changed row proof (before vs after)
SELECT b.id,
       b.name,
       b.npcspecialattks AS before_npcspecialattks,
       n.npcspecialattks AS after_npcspecialattks
FROM npc_types_backup_class45_attkflags_only_20260517 b
JOIN npc_types n ON n.id = b.id
WHERE COALESCE(b.npcspecialattks, '') <> COALESCE(n.npcspecialattks, '')
ORDER BY b.id;
