-- Lapidary's Workbench — container item + world object placement in Dranik's Scar
--
-- Item ID 147872: the tradeskill container item. All Accessory Crafting (Lapidary)
-- recipe entries reference item_id=147872, iscontainer=1.
--
-- Visual: IT11543_ACTORDEF (Jewelry Making Table) — purpose-built jeweler's workbench,
-- distinct from both forge visuals (IT10864 = armor forge, IT10804 = weapon forge).
--
-- Placement continues the crafting station line in Dranik's Scar:
--   Armor Smith's Forge   (-290.1, 1610.1, -251.11)
--   Weapon Smith's Forge  (-290.1, 1640.0, -251.11)
--   Lapidary's Workbench  (-290.1, 1670.0, -251.11)  ← this file
--
-- Adjust xpos/ypos/heading with #object move if needed after zoning in.

-- Container item
INSERT INTO items
  (id, Name, idfile, icon, itemtype, bagslots, bagsize, bagwr,
   nodrop, norent, stackable, sellrate, weight, size, maxcharges,
   reqlevel, reclevel)
VALUES
  (147872, 'Lapidary''s Workbench', 'IT128', 892, 11, 10, 4, 0,
   1, 0, 0, 1.0, 0, 4, 0,
   0, 0);

-- World object
INSERT INTO object
  (zoneid, version, xpos, ypos, zpos, heading, itemid, objectname, type, icon,
   size_percentage, display_name)
VALUES
  (302, 0, -341.73, 1555.96, -247.99, 384, 147872, 'IT11543_ACTORDEF', 17, 0,
   100, 'Lapidary''s Workbench')
ON DUPLICATE KEY UPDATE size=200, heading=384, size_percentage=100;

-- Note: size column (not size_percentage) controls object scale. size=200 is 2x default.
UPDATE object SET size=200 WHERE display_name='Lapidary''s Workbench' AND zoneid=302;
