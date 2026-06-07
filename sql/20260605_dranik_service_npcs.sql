-- Dranik's Scar service NPCs modeled after An_Emberwatch_Guard (998038)
-- race=413 (Dragorn), bodytype=1, gender=2, size=9, runspeed=80
-- IDs 760136–760140

INSERT INTO npc_types
  (id, name, race, class, bodytype, gender, texture, helmtexture, size,
   hp, mana, level, ac, mindmg, maxdmg,
   MR, CR, DR, FR, PR,
   runspeed, npc_faction_id, loottable_id, merchant_id)
VALUES
-- 760136: Banker
(760136, 'Dranik_Banker',          413, 40, 1, 2, 0, 1, 9,
 100000, 0, 48, 233, 30, 144,
 25, 25, 25, 25, 25,
 80, 0, 0, 0),

-- 760137: Satchel Vendor
(760137, 'Satchel_Merchant',       413, 41, 1, 2, 0, 1, 9,
 100000, 0, 48, 233, 30, 144,
 25, 25, 25, 25, 25,
 80, 0, 0, 0),

-- 760138: Parcels
(760138, 'Parcel_Courier',         413, 41, 1, 2, 0, 1, 9,
 100000, 0, 48, 233, 30, 144,
 25, 25, 25, 25, 25,
 80, 0, 0, 0),

-- 760139: General Vendor
(760139, 'General_Merchant',       413, 41, 1, 2, 0, 1, 9,
 100000, 0, 48, 233, 30, 144,
 25, 25, 25, 25, 25,
 80, 0, 0, 0),

-- 760140: Tradeskill Vendor
(760140, 'Tradeskill_Merchant',    413, 41, 1, 2, 0, 1, 9,
 100000, 0, 48, 233, 30, 144,
 25, 25, 25, 25, 25,
 80, 0, 0, 0);
