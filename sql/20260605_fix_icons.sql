-- Fix icons on all custom blacksmithing items
-- Based on matching vanilla EQ tradeskill item icons

-- ============================================================
-- RAW MATERIALS
-- ============================================================

-- Cloth/Fiber: 782 = Spiderling Silk / Air Arachnid Silk (silk material look)
UPDATE items SET icon = 782 WHERE id IN (147500, 147548, 147592, 147636);

-- Hides: progression from low-quality → pristine
UPDATE items SET icon = 553 WHERE id = 147501; -- Raw Hide Scrap        (Low Quality Rockhopper Hide)
UPDATE items SET icon = 552 WHERE id = 147549; -- Thick Animal Pelt     (Mist Wolf Pelt)
UPDATE items SET icon = 680 WHERE id = 147593; -- Supple Drake Hide     (Ruined Feran Hide)
UPDATE items SET icon = 835 WHERE id = 147637; -- Pristine Drake Hide   (Arctic Wyvern Hide)

-- Mail ore fragments: 1031 = Metal Bits/Scraps, 1135 = Block of Ore
UPDATE items SET icon = 1031 WHERE id IN (147502, 147550); -- T1 Rusted Metal Bit, T2 Iron-Laced Ore Fragment
UPDATE items SET icon = 1135 WHERE id = 147594;            -- T3 Steel-Veined Ore Shard
UPDATE items SET icon = 1138 WHERE id = 147638;            -- T4 Mithril Ore Shard (Block of High Quality Ore)

-- Plate ore chunks/blocks: 1135 = Iron Ore/Block of Ore, 1138 = Block of High Quality Ore
UPDATE items SET icon = 1135 WHERE id IN (147503, 147551); -- T1 Cracked Ore Chunk, T2 Dense Iron Ore
UPDATE items SET icon = 1138 WHERE id IN (147595, 147639); -- T3 High-Grade Ore Block, T4 Adamantite Ore Block

-- ============================================================
-- CATALYSTS
-- ============================================================

-- Threads: 853 = Silk Thread, 1140 = Spool of Sacred Coldain Thread (T4)
UPDATE items SET icon = 853  WHERE id IN (147504, 147552, 147596); -- T1/T2/T3 threads
UPDATE items SET icon = 1140 WHERE id = 147640;                    -- T4 Enchanted Binding Thread

-- Tanning Solutions: 706 = Tanning Chemicals (T1-T3), 1159 = Nalasrine's Enforcing Tanning Solution (T4)
UPDATE items SET icon = 706  WHERE id IN (147509, 147553, 147597); -- T1/T2/T3 solutions
UPDATE items SET icon = 1159 WHERE id = 147641;                    -- T4 Mystic Tanning Solution

-- Flux: 1075 = Binding Powder / Chromium Powder (powder/dust look)
UPDATE items SET icon = 1075 WHERE id IN (147506, 147554, 147598, 147642);

-- ============================================================
-- PATTERNS (all 16): 504 = Ancient Pattern / Belt Pattern
-- ============================================================
UPDATE items SET icon = 504 WHERE id IN (
  147505, 147507, 147508, 147519,  -- T1
  147555, 147556, 147557, 147558,  -- T2
  147599, 147600, 147601, 147602,  -- T3
  147643, 147644, 147645, 147646   -- T4
);

-- ============================================================
-- INTERMEDIATES
-- ============================================================

-- Cloth bolts + padding: 823 = Silk Swatch (fabric/textile look)
UPDATE items SET icon = 823 WHERE id IN (
  147510, 147511,  -- T1: Bolt of Woven Cloth, Cloth Padding
  147559, 147560,  -- T2: Bolt of Coarse Linen, Reinforced Cloth Pad
  147603, 147604,  -- T3: Bolt of Fine Silk, Silk-Quilted Pad
  147647, 147648   -- T4: Bolt of Enchanted Silk, Arcane Cloth Padding
);

-- Leather sheets + panels: 554 = High Quality Bear Skin (flat hide/leather look)
UPDATE items SET icon = 554 WHERE id IN (
  147512, 147513,  -- T1: Cured Leather Sheet, Leather Panel
  147561, 147562,  -- T2: Hardened Leather Sheet, Reinforced Leather Panel
  147605, 147606,  -- T3: Tempered Leather Sheet, Tempered Leather Panel
  147649, 147650   -- T4: Ascendant Leather Sheet, Ascendant Leather Panel
);

-- Metal bars + sheets + plate sections: 1135 (T1/T2), 1138 (T3/T4)
UPDATE items SET icon = 1135 WHERE id IN (
  147514, 147517, 147518,  -- T1: Refined Metal Bar, Metal Sheet, Plate Section
  147563, 147566, 147567   -- T2: Tempered Iron Bar, Tempered Iron Sheet, Tempered Plate Section
);
UPDATE items SET icon = 1138 WHERE id IN (
  147607, 147610, 147611,  -- T3: Steel Alloy Bar, Steel Metal Sheet, Hardened Plate Section
  147651, 147654, 147655   -- T4: Ascendant Refined Bar, Mithril Sheet, Ascendant Plate Section
);

-- Rings: 1031 = Metal Bits (small circular metal pieces)
UPDATE items SET icon = 1031 WHERE id IN (
  147515, 147564, 147608, 147652  -- T1-T4 rings
);

-- Chain bundles: 572 = Air Arachnid Silk String (linked/bundled material look)
UPDATE items SET icon = 572 WHERE id IN (
  147516, 147565, 147609, 147653  -- T1-T4 chain bundles
);
