-- Riftseekers Sanctum - Respawn Normalization
-- Date: May 16, 2026
-- Scope: Normalize spawn2 respawntime values for classic leveling zone
-- Tables Modified: spawn2
-- Backup: spawn2_backup_riftseekers_respawn_20260516

CREATE TABLE IF NOT EXISTS spawn2_backup_riftseekers_respawn_20260516 AS
SELECT * FROM spawn2
WHERE zone = 'riftseekers' AND version = 0;

-- Set trash spawns to 1200 seconds
UPDATE spawn2 s2
SET respawntime = 1200
WHERE zone = 'riftseekers' 
  AND version = 0
  AND spawngroupid IN (
    SELECT sg.id FROM spawngroup sg
    JOIN spawnentry se ON sg.id = se.spawngroupid
    JOIN npc_types nt ON se.npcid = nt.id
    WHERE nt.id IN (334000, 334001, 334003, 334004, 334005, 334006, 334008, 334009, 334010, 334011, 334012, 334013, 334015, 334016, 334017, 334018, 334019, 334021, 334022, 334023, 334024, 334025, 334026, 334027, 334028, 334029, 334030, 334031, 334032, 334033, 334050, 334051, 334052, 334054, 334055, 334056, 334057, 334058, 334059, 334060, 334061, 334062, 334063, 334064, 334065, 334068, 334071, 334072, 334074, 334075, 334077, 334078, 334079, 334080, 334081, 334082, 334084)
  );

-- Set named spawns to 1800 seconds (or preserve if within 1800-2400)
UPDATE spawn2 s2
SET respawntime = 1800
WHERE zone = 'riftseekers' 
  AND version = 0
  AND spawngroupid IN (
    SELECT sg.id FROM spawngroup sg
    JOIN spawnentry se ON sg.id = se.spawngroupid
    JOIN npc_types nt ON se.npcid = nt.id
    WHERE nt.id IN (334002, 334007, 334020, 334066, 334067, 334069, 334070, 334073, 334076, 334083, 334088, 334089, 334090, 334091, 334093, 334096, 334103, 334104, 334105, 334106, 334108, 334121)
      AND respawntime < 1800
  );

-- Cap named spawns at 2400 seconds
UPDATE spawn2 s2
SET respawntime = 2400
WHERE zone = 'riftseekers' 
  AND version = 0
  AND spawngroupid IN (
    SELECT sg.id FROM spawngroup sg
    JOIN spawnentry se ON sg.id = se.spawngroupid
    JOIN npc_types nt ON se.npcid = nt.id
    WHERE nt.id IN (334002, 334007, 334020, 334066, 334067, 334069, 334070, 334073, 334076, 334083, 334088, 334089, 334090, 334091, 334093, 334096, 334103, 334104, 334105, 334106, 334108, 334121)
      AND respawntime > 2400
  );
