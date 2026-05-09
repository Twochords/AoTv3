-- Purpose: Phase 04 read-only preview checks for approval gate.
-- Execution order: after 03.

USE peq;

SELECT review_status, COUNT(*)
FROM _tmp_nc_preview
GROUP BY review_status
ORDER BY review_status;

SELECT npc_id, npc_name, npc_level, source_level_used, review_status
FROM _tmp_nc_preview
ORDER BY npc_level, npc_name
LIMIT 200;
