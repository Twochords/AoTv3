-- WALLOFSLAUGHTER RESPAWN NORMALIZATION (PREVIEW-ONLY PACKAGE)
-- Do NOT execute until explicit approval
-- Scope: spawn2.respawntime only

CREATE TABLE IF NOT EXISTS spawn2_backup_wallofslaughter_respawn_20260516 AS
SELECT DISTINCT s.*
FROM spawn2 s
JOIN spawngroup sg ON sg.id = s.spawngroupID
JOIN spawnentry se ON se.spawngroupID = sg.id
JOIN npc_types nt ON nt.id = se.npcID
WHERE s.zone = 'wallofslaughter'
AND s.version = 0
AND nt.level > 1
AND nt.merchant_id = 0
AND nt.bodytype NOT IN (11,33,66)
AND LOWER(nt.name) NOT LIKE '%death_touch%'
AND LOWER(nt.name) NOT LIKE '%_trap%'
AND LOWER(nt.name) NOT LIKE '% trap%'
AND LOWER(nt.name) NOT LIKE '%spawner%'
AND LOWER(nt.name) NOT LIKE '%portal%'
AND LOWER(nt.name) NOT LIKE '%controller%'
AND LOWER(nt.name) NOT LIKE '%trigger%'
AND LOWER(nt.name) NOT LIKE '%invisible%'
AND LOWER(nt.name) NOT LIKE '%soulbinder%'
AND LOWER(nt.name) NOT LIKE '%banker%'
AND LOWER(nt.name) NOT LIKE '%merchant%'
AND LOWER(nt.name) NOT LIKE '% pet%'
AND LOWER(nt.name) NOT LIKE '%dormant_egg%';

UPDATE spawn2 s
JOIN (
  SELECT DISTINCT s2.id AS spawn2_id,
         MAX(CASE
           WHEN nt2.name LIKE '#%' THEN 1
           WHEN s2.respawntime >= 3600 THEN 1
           WHEN LOWER(nt2.name) NOT LIKE 'a_%' AND LOWER(nt2.name) NOT LIKE 'an_%' THEN 1
           ELSE 0
         END) AS is_named
  FROM spawn2 s2
  JOIN spawngroup sg2 ON sg2.id = s2.spawngroupID
  JOIN spawnentry se2 ON se2.spawngroupID = sg2.id
  JOIN npc_types nt2 ON nt2.id = se2.npcID
  WHERE s2.zone = 'wallofslaughter'
AND s2.version = 0
AND nt2.level > 1
AND nt2.merchant_id = 0
AND nt2.bodytype NOT IN (11,33,66)
AND LOWER(nt2.name) NOT LIKE '%death_touch%'
AND LOWER(nt2.name) NOT LIKE '%_trap%'
AND LOWER(nt2.name) NOT LIKE '% trap%'
AND LOWER(nt2.name) NOT LIKE '%spawner%'
AND LOWER(nt2.name) NOT LIKE '%portal%'
AND LOWER(nt2.name) NOT LIKE '%controller%'
AND LOWER(nt2.name) NOT LIKE '%trigger%'
AND LOWER(nt2.name) NOT LIKE '%invisible%'
AND LOWER(nt2.name) NOT LIKE '%soulbinder%'
AND LOWER(nt2.name) NOT LIKE '%banker%'
AND LOWER(nt2.name) NOT LIKE '%merchant%'
AND LOWER(nt2.name) NOT LIKE '% pet%'
AND LOWER(nt2.name) NOT LIKE '%dormant_egg%'
  GROUP BY s2.id
) x ON x.spawn2_id = s.id
SET s.respawntime = CASE
  WHEN x.is_named = 0 THEN 1200
  WHEN s.respawntime < 1800 THEN 1800
  WHEN s.respawntime > 2400 THEN 2400
  ELSE s.respawntime
END
WHERE s.zone = 'wallofslaughter' AND s.version = 0;
