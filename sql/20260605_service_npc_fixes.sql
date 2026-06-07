-- Fix all 5 Dranik's Scar service NPCs:
-- Labels via lastname, merchant lists, proper functionality
-- New merchant IDs: 1000024 (satchel), 1000025 (parcel), 1000026 (general)

-- ============================================================
-- LABELS (lastname shows as subtitle under NPC name in-game)
-- ============================================================
UPDATE npc_types SET lastname = 'Banker'                      WHERE id = 760136;
UPDATE npc_types SET lastname = 'Satchel Merchant'            WHERE id = 760137;
UPDATE npc_types SET lastname = 'Parcels and General Supplies' WHERE id = 760138;
UPDATE npc_types SET lastname = 'General Supplies'            WHERE id = 760139;
UPDATE npc_types SET lastname = 'Tradeskill Supplies'         WHERE id = 760140;

-- ============================================================
-- SATCHEL MERCHANT (760137) — bags and containers
-- ============================================================
INSERT INTO merchantlist (merchantid, slot, item) VALUES
(1000024, 0, 17001), -- Wrist Pouch
(1000024, 1, 17002), -- Belt Pouch
(1000024, 2, 17003), -- Small Bag
(1000024, 3, 17004), -- Large Bag
(1000024, 4, 17005), -- Backpack
(1000024, 5, 17008); -- Quiver

UPDATE npc_types SET merchant_id = 1000024 WHERE id = 760137;

-- ============================================================
-- PARCEL COURIER (760138) — general supplies + parcel interface
-- lastname 'Parcels and General Supplies' matches vanilla parcel NPCs
-- and enables the parcel-sending UI tab on class=41 merchants
-- ============================================================
INSERT INTO merchantlist (merchantid, slot, item) VALUES
(1000025, 0, 13005), -- Iron Ration
(1000025, 1, 13006), -- Water Flask
(1000025, 2, 13009); -- Bandages

UPDATE npc_types SET merchant_id = 1000025 WHERE id = 760138;

-- ============================================================
-- GENERAL MERCHANT (760139) — full general goods
-- ============================================================
INSERT INTO merchantlist (merchantid, slot, item) VALUES
(1000026, 0,  13005), -- Iron Ration
(1000026, 1,  13006), -- Water Flask
(1000026, 2,  13009), -- Bandages
(1000026, 3,  8005),  -- Arrow
(1000026, 4,  17001), -- Wrist Pouch
(1000026, 5,  17002), -- Belt Pouch
(1000026, 6,  17003), -- Small Bag
(1000026, 7,  17004), -- Large Bag
(1000026, 8,  17005), -- Backpack
(1000026, 9,  17008), -- Quiver
(1000026, 10, 17966); -- Deluxe Sewing Kit

UPDATE npc_types SET merchant_id = 1000026 WHERE id = 760139;
