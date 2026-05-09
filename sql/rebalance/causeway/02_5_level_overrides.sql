-- Purpose: Phase 02.5 level override workflow for approved base names.
-- Execution order: after 02 and before 03.

USE peq;

DROP TABLE IF EXISTS _tmp_nc_level_overrides;
CREATE TABLE _tmp_nc_level_overrides (
  base_name VARCHAR(128) PRIMARY KEY,
  new_level TINYINT NOT NULL
);

-- Populate approved overrides before run.
UPDATE npc_types n
JOIN _tmp_nc_level_overrides o ON o.base_name = n.name
SET n.level = o.new_level;

DROP TABLE IF EXISTS _tmp_nc_targets;
CREATE TABLE _tmp_nc_targets AS
SELECT DISTINCT nt.id AS npc_id, nt.name AS npc_name, nt.level AS npc_level
FROM npc_types nt
JOIN spawnentry se ON se.npcID = nt.id
JOIN spawngroup sg ON sg.id = se.spawngroupID
JOIN spawn2 s2 ON s2.spawngroupID = sg.id
WHERE s2.zone = causeway;
