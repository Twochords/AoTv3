-- Lapidary Merchant (NPC 760142)
-- Sells Lapidary molds, settings, and gem polish (merchant list 1000028)
-- Merchant list populated when Accessory Crafting items are created.
-- Modeled after existing Dranik's Scar service NPCs (760136-760141):
--   race=413 (Dragorn), class=41 (Merchant), size=9, 100k HP, level 48

INSERT INTO npc_types
  (id, name, lastname, race, class, bodytype, gender, texture, helmtexture, size,
   hp, mana, level, ac, mindmg, maxdmg,
   MR, CR, DR, FR, PR,
   runspeed, npc_faction_id, loottable_id, merchant_id)
VALUES
  (760142, 'Gem_Merchant', 'Gem Supplies', 413, 41, 1, 2, 0, 1, 9,
   100000, 0, 48, 233, 30, 144,
   25, 25, 25, 25, 25,
   80, 0, 0, 1000028);
