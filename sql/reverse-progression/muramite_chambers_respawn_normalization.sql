-- MURAMITE CHAMBERS RESPAWN NORMALIZATION (PREVIEW PACKAGE)
-- Preview-only: do not execute until approved
-- Scope: spawn2.respawntime only; chambersa-f versions 0/1/2
-- Backup table: spawn2_backup_muramite_chambers_respawn_20260516

CREATE TABLE IF NOT EXISTS spawn2_backup_muramite_chambers_respawn_20260516 AS
SELECT * FROM spawn2
WHERE zone IN ('chambersa','chambersb','chambersc','chambersd','chamberse','chambersf')
  AND version IN (0,1,2);

UPDATE spawn2
SET respawntime = CASE
  WHEN respawntime > 1440 THEN respawntime
  ELSE 1200
END
WHERE zone IN ('chambersa','chambersb','chambersc','chambersd','chamberse','chambersf')
  AND version IN (0,1,2);
