-- Purpose: Phase 06 create rollback backups for stat and exp phases.
-- Execution order: run before 07 and 09.

USE peq;

DROP TABLE IF EXISTS _backup_nc_npc_types_pre_statbal;
CREATE TABLE _backup_nc_npc_types_pre_statbal AS
SELECT n.*
FROM npc_types n
JOIN _tmp_nc_preview p ON p.npc_id = n.id
WHERE p.review_status IN (EXACT_MATCH,NEAR_MATCH);

DROP TABLE IF EXISTS _backup_nc_npc_types_pre_xp_sync;
CREATE TABLE _backup_nc_npc_types_pre_xp_sync AS
SELECT n.*
FROM npc_types n
JOIN _tmp_nc_preview p ON p.npc_id = n.id
WHERE p.review_status IN (EXACT_MATCH,NEAR_MATCH);
