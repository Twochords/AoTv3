-- Purpose: Phase 09 synchronize exp_mod from Crushbone authority by source_level_used.
-- Execution order: after 07 and backup/candidate validation.
-- Safety: EXACT/NEAR only; NO_SOURCE excluded.

USE peq;

SELECT COUNT(*) AS exp_mod_exists
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE()
  AND TABLE_NAME = npc_types
  AND COLUMN_NAME = exp_mod;

DROP TABLE IF EXISTS _tmp_nc_xp_preview;
CREATE TABLE _tmp_nc_xp_preview (
  npc_id INT,
  npc_name VARCHAR(128),
  npc_level INT,
  source_level_used INT,
  review_status VARCHAR(32),
  old_exp_mod FLOAT,
  new_exp_mod FLOAT,
  delta_exp_mod FLOAT
);

INSERT INTO _tmp_nc_xp_preview (
  npc_id, npc_name, npc_level, source_level_used, review_status,
  old_exp_mod, new_exp_mod, delta_exp_mod
)
SELECT
  p.npc_id,
  p.npc_name,
  p.npc_level,
  p.source_level_used,
  p.review_status,
  n.exp_mod,
  cb.avg_exp_mod,
  (cb.avg_exp_mod - n.exp_mod)
FROM _tmp_nc_preview p
JOIN npc_types n ON n.id = p.npc_id
LEFT JOIN (
  SELECT nt.level, AVG(nt.exp_mod) AS avg_exp_mod
  FROM npc_types nt
  JOIN spawnentry se ON se.npcID = nt.id
  JOIN spawngroup sg ON sg.id = se.spawngroupID
  JOIN spawn2 s2 ON s2.spawngroupID = sg.id
  WHERE s2.zone = crushbone
  GROUP BY nt.level
) cb ON cb.level = p.source_level_used;

UPDATE npc_types n
JOIN _tmp_nc_xp_preview x ON x.npc_id = n.id
SET n.exp_mod = x.new_exp_mod
WHERE x.review_status IN (EXACT_MATCH,NEAR_MATCH)
  AND x.new_exp_mod IS NOT NULL;
