-- Gem Cutting Station — container item + world object + vendor NPC
--
-- Container item ID: 147985
-- World object placed near Epic_Quest NPC (302097) in Dranik's Scar
--   Epic_Quest NPC is at (-372, 1624, -245) — table placed ~22 units east
--
-- Visual: IT11544_ACTORDEF (Tinkering Table) — precision workbench with tools,
--   closest available to a gem cutting/faceting surface
-- Type=17: isolates recipes to item_id=147985 only (no bleed from other crafts)
--
-- Gem Cutting recipes reference item_id=147985 with iscontainer=1
-- Gem Cutting augment items use augtype=512 (bit_AugTypeCraftedCommon, slot type 10)
--
-- Vendor NPC: 760143 (Gem_Cutter), merchant list 1000029
--   Sells gem cutting molds, catalysts, and supplies when system is built
--   Use #spawn 760143 to place in-game, then give coordinates for permanent spawn

-- Container item
INSERT INTO items
  (id, Name, idfile, icon, itemtype, bagslots, bagsize, bagwr,
   nodrop, norent, stackable, sellrate, weight, size, maxcharges,
   reqlevel, reclevel)
VALUES
  (147985, 'Gem Cutting Station', 'IT128', 527, 11, 10, 4, 0,
   1, 0, 0, 1.0, 0, 4, 0,
   0, 0);

-- World object (~22 units east of Epic_Quest NPC)
INSERT INTO object
  (zoneid, version, xpos, ypos, zpos, heading, itemid, objectname, type, icon,
   size_percentage, display_name)
VALUES
  (302, 0, -350.0, 1624.0, -245.14, 384, 147985, 'IT11544_ACTORDEF', 17, 0,
   100, 'Gem Cutting Station');

-- Gem Cutter vendor NPC
-- Sells gem cutting supplies (merchant list 1000029 — populated when system is built)
-- Modeled after existing Dranik's Scar service NPCs (760136-760142):
--   race=413 (Dragorn), class=41 (Merchant), size=9, 100k HP, level 48
INSERT INTO npc_types
  (id, name, lastname, race, class, bodytype, gender, texture, helmtexture, size,
   hp, mana, level, ac, mindmg, maxdmg,
   MR, CR, DR, FR, PR,
   runspeed, npc_faction_id, loottable_id, merchant_id)
VALUES
  (760143, 'Gem_Cutter', 'Gem Cutting Supplies', 413, 41, 1, 2, 0, 1, 9,
   100000, 0, 48, 233, 30, 144,
   25, 25, 25, 25, 25,
   80, 0, 0, 1000029);
