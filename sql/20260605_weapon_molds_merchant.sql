-- Weapon Molds Merchant (NPC 760141)
-- Modeled after existing Dranik's Scar service NPCs (760136-760140)
-- race=413 (Dragorn), class=41 (Merchant), size=9, 100k HP, level 48
-- Merchant list ID: 1000027 — populated by weapon smithing migration SQL
-- Placed adjacent to the Weapon Smith's Forge in Dranik's Scar

-- 1. NPC record
INSERT INTO npc_types
  (id, name, lastname, race, class, bodytype, gender, texture, helmtexture, size,
   hp, mana, level, ac, mindmg, maxdmg,
   MR, CR, DR, FR, PR,
   runspeed, npc_faction_id, loottable_id, merchant_id)
VALUES
  (760141, 'Weapon_Molds_Merchant', 'Weapon Molds', 413, 41, 1, 2, 0, 1, 9,
   100000, 0, 48, 233, 30, 144,
   25, 25, 25, 25, 25,
   80, 0, 0, 1000027);

-- 2. Spawn group
INSERT INTO spawngroup (name, spawn_limit, min_x, max_x, min_y, max_y)
VALUES ('draniksscar_Weapon_Molds_Merchant000_87100001', 0, 0, 0, 0, 0);

SET @sg_id = LAST_INSERT_ID();

-- 3. Spawn entry
INSERT INTO spawnentry (spawngroupID, npcID, chance)
VALUES (@sg_id, 760141, 100);

-- 4. Spawn point — adjacent to the Weapon Smith's Forge (-290, 1625, -251.11)
-- Heading 418.25 matches the other service NPCs in this cluster
-- Adjust xpos/ypos/z in-game with #npc appearance size or reposition via SQL if needed
INSERT INTO spawn2 (spawngroupID, zone, version, x, y, z, heading, respawntime, variance, pathgrid)
VALUES (@sg_id, 'draniksscar', 0, -278.0, 1618.0, -247.21, 418.25, 1200, 0, 0);
