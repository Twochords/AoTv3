-- Weapon Smith's Forge — world object placement in Dranik's Scar
--
-- Object type 38 = HumanForgeOne (valid EQ forge type, zero existing recipe entries)
-- This means the recipe query "WHERE item_id = 38" returns ONLY weapon smithing recipes.
-- Armor smithing uses item_id=17 (Blacksmithing type) — no overlap.
-- Pottery uses item_id=21/22 — no overlap.
--
-- Visual: IT66_ACTORDEF (New Tanaan Forge model, same as existing Dranik forge)
-- Placed ~15 units south of the existing armor forge at (-290, 1610, -251)
-- Adjust xpos/ypos/heading in-game with #object move if needed.

INSERT INTO object
  (zoneid, version, xpos, ypos, zpos, heading, itemid, objectname, type, icon,
   size_percentage, display_name)
VALUES
  (302, 0, -290.1, 1625.0, -251.11, 95.1, 17760, 'IT66_ACTORDEF', 38, 0,
   100, 'Weapon Smith''s Forge');
