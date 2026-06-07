-- Tradeskill Merchant (NPC 760140) pattern vendor setup
-- Merchant list ID: 1000023
-- Pricing: T1=5pp, T2=25pp, T3=100pp, T4=500pp (stored in copper: 1pp=1000cp)

-- Set item prices on all patterns
UPDATE items SET price = 5000   WHERE id = 147505; -- T1: Weathered Armor Pattern (5pp)
UPDATE items SET price = 25000  WHERE id = 147555; -- T2: Reinforced Cloth Pattern (25pp)
UPDATE items SET price = 25000  WHERE id = 147556; -- T2: Reinforced Leather Pattern (25pp)
UPDATE items SET price = 25000  WHERE id = 147557; -- T2: Reinforced Mail Pattern (25pp)
UPDATE items SET price = 25000  WHERE id = 147558; -- T2: Reinforced Plate Pattern (25pp)
UPDATE items SET price = 100000 WHERE id = 147599; -- T3: Tempered Cloth Pattern (100pp)
UPDATE items SET price = 100000 WHERE id = 147600; -- T3: Tempered Leather Pattern (100pp)
UPDATE items SET price = 100000 WHERE id = 147601; -- T3: Tempered Mail Pattern (100pp)
UPDATE items SET price = 100000 WHERE id = 147602; -- T3: Tempered Plate Pattern (100pp)
UPDATE items SET price = 500000 WHERE id = 147643; -- T4: Ascendant Cloth Pattern (500pp)
UPDATE items SET price = 500000 WHERE id = 147644; -- T4: Ascendant Leather Pattern (500pp)
UPDATE items SET price = 500000 WHERE id = 147645; -- T4: Ascendant Mail Pattern (500pp)
UPDATE items SET price = 500000 WHERE id = 147646; -- T4: Ascendant Plate Pattern (500pp)

-- Create merchant list 1000023 for the Tradeskill Merchant
INSERT INTO merchantlist (merchantid, slot, item) VALUES
(1000023, 0,  147505), -- Weathered Armor Pattern (T1)
(1000023, 1,  147555), -- Reinforced Cloth Pattern (T2)
(1000023, 2,  147556), -- Reinforced Leather Pattern (T2)
(1000023, 3,  147557), -- Reinforced Mail Pattern (T2)
(1000023, 4,  147558), -- Reinforced Plate Pattern (T2)
(1000023, 5,  147599), -- Tempered Cloth Pattern (T3)
(1000023, 6,  147600), -- Tempered Leather Pattern (T3)
(1000023, 7,  147601), -- Tempered Mail Pattern (T3)
(1000023, 8,  147602), -- Tempered Plate Pattern (T3)
(1000023, 9,  147643), -- Ascendant Cloth Pattern (T4)
(1000023, 10, 147644), -- Ascendant Leather Pattern (T4)
(1000023, 11, 147645), -- Ascendant Mail Pattern (T4)
(1000023, 12, 147646); -- Ascendant Plate Pattern (T4)

-- Wire merchant list to NPC 760140
UPDATE npc_types SET merchant_id = 1000023 WHERE id = 760140;
