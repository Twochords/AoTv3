-- Purpose: Phase 02 build Causeway target NPC set.
-- Execution order: after 01.

USE peq;

DROP TABLE IF EXISTS _tmp_nc_targets;
CREATE TABLE _tmp_nc_targets AS
SELECT DISTINCT nt.id AS npc_id, nt.name AS npc_name, nt.level AS npc_level
FROM npc_types nt
JOIN spawnentry se ON se.npcID = nt.id
JOIN spawngroup sg ON sg.id = se.spawngroupID
JOIN spawn2 s2 ON s2.spawngroupID = sg.id
WHERE s2.zone = causeway;
