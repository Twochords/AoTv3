-- Fix 3 issues with Tradeskill Merchant patterns:
-- 1. sellrate=0 makes all patterns free → set to 1.0
-- 2. T1 had one universal pattern → split into 4 type-specific patterns
-- 3. Rebuild merchant list with all 16 patterns

-- ============================================================
-- 1. FIX SELLRATE ON ALL EXISTING PATTERNS
-- ============================================================
UPDATE items SET sellrate = 1.0
WHERE id IN (147505,147555,147556,147557,147558,
             147599,147600,147601,147602,
             147643,147644,147645,147646);

-- ============================================================
-- 2. RENAME 147505 AND CREATE 3 NEW T1 PATTERNS VIA TEMP CLONE
-- ============================================================
UPDATE items SET name = 'Weathered Cloth Pattern' WHERE id = 147505;

-- Clone 147505 into 147507 (Weathered Leather Pattern)
CREATE TEMPORARY TABLE tmp_pattern AS SELECT * FROM items WHERE id = 147505;
UPDATE tmp_pattern SET id = 147507, Name = 'Weathered Leather Pattern';
DELETE FROM items WHERE id = 147507;
INSERT INTO items SELECT * FROM tmp_pattern;
DROP TEMPORARY TABLE tmp_pattern;

-- Clone 147505 into 147508 (Weathered Mail Pattern)
CREATE TEMPORARY TABLE tmp_pattern AS SELECT * FROM items WHERE id = 147505;
UPDATE tmp_pattern SET id = 147508, Name = 'Weathered Mail Pattern';
DELETE FROM items WHERE id = 147508;
INSERT INTO items SELECT * FROM tmp_pattern;
DROP TEMPORARY TABLE tmp_pattern;

-- Clone 147505 into 147519 (Weathered Plate Pattern)
CREATE TEMPORARY TABLE tmp_pattern AS SELECT * FROM items WHERE id = 147505;
UPDATE tmp_pattern SET id = 147519, Name = 'Weathered Plate Pattern';
DELETE FROM items WHERE id = 147519;
INSERT INTO items SELECT * FROM tmp_pattern;
DROP TEMPORARY TABLE tmp_pattern;

-- ============================================================
-- 3. UPDATE T1 RECIPES TO USE TYPE-SPECIFIC PATTERNS
--    31177-31182 = Cloth  → 147505 (Weathered Cloth Pattern, no change)
--    31183-31188 = Leather → 147507 (Weathered Leather Pattern)
--    31189-31194 = Mail    → 147508 (Weathered Mail Pattern)
--    31195-31200 = Plate   → 147519 (Weathered Plate Pattern)
-- ============================================================
UPDATE tradeskill_recipe_entries
SET item_id = 147507
WHERE recipe_id BETWEEN 31183 AND 31188 AND item_id = 147505;

UPDATE tradeskill_recipe_entries
SET item_id = 147508
WHERE recipe_id BETWEEN 31189 AND 31194 AND item_id = 147505;

UPDATE tradeskill_recipe_entries
SET item_id = 147519
WHERE recipe_id BETWEEN 31195 AND 31200 AND item_id = 147505;

-- ============================================================
-- 4. REBUILD MERCHANT LIST 1000023 WITH ALL 16 PATTERNS
-- ============================================================
DELETE FROM merchantlist WHERE merchantid = 1000023;

INSERT INTO merchantlist (merchantid, slot, item) VALUES
(1000023, 0,  147505), -- Weathered Cloth Pattern   (T1 - 5pp)
(1000023, 1,  147507), -- Weathered Leather Pattern (T1 - 5pp)
(1000023, 2,  147508), -- Weathered Mail Pattern    (T1 - 5pp)
(1000023, 3,  147519), -- Weathered Plate Pattern   (T1 - 5pp)
(1000023, 4,  147555), -- Reinforced Cloth Pattern  (T2 - 25pp)
(1000023, 5,  147556), -- Reinforced Leather Pattern(T2 - 25pp)
(1000023, 6,  147557), -- Reinforced Mail Pattern   (T2 - 25pp)
(1000023, 7,  147558), -- Reinforced Plate Pattern  (T2 - 25pp)
(1000023, 8,  147599), -- Tempered Cloth Pattern    (T3 - 100pp)
(1000023, 9,  147600), -- Tempered Leather Pattern  (T3 - 100pp)
(1000023, 10, 147601), -- Tempered Mail Pattern     (T3 - 100pp)
(1000023, 11, 147602), -- Tempered Plate Pattern    (T3 - 100pp)
(1000023, 12, 147643), -- Ascendant Cloth Pattern   (T4 - 500pp)
(1000023, 13, 147644), -- Ascendant Leather Pattern (T4 - 500pp)
(1000023, 14, 147645), -- Ascendant Mail Pattern    (T4 - 500pp)
(1000023, 15, 147646); -- Ascendant Plate Pattern   (T4 - 500pp)
