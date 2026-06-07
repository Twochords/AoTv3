-- Tradeskill loot table implementation
-- Tier assignment:
--   T1: draniksscar, causeway
--   T2: bloodfields, dranik (RCoD), draniksewersa/b/c
--   T3: dranikcatacombsa/b/c, dranikhollowsa/b/c, harbingers
--   T4: wallofslaughter, riftseekers, provinggrounds, chambersa-f
--
-- Only raw mats and catalysts on mobs. Patterns are vendor-sold.
-- Named mobs (not starting with a_ / an_) are untouched.

-- ============================================================
-- 1. FIX T1 LOOTDROPS (existing entries point to nonexistent items)
-- ============================================================
DELETE FROM lootdrop_entries WHERE lootdrop_id BETWEEN 992001 AND 992007;

INSERT INTO lootdrop_entries (lootdrop_id, item_id, item_charges, equip_item, chance, multiplier) VALUES
(992001, 147500, 1, 0, 15, 1), -- Torn Fiber Scrap
(992002, 147501, 1, 0, 15, 1), -- Raw Hide Scrap
(992003, 147502, 1, 0, 15, 1), -- Rusted Metal Bit
(992004, 147503, 1, 0, 15, 1), -- Cracked Ore Chunk
(992005, 147504, 1, 0, 10, 1), -- Weak Binding Thread
(992006, 147509, 1, 0, 10, 1), -- Basic Tanning Solution (repurpose old pattern slot)
(992007, 147506, 1, 0, 10, 1); -- Minor Tempering Flux

-- Update lootdrop names to match
UPDATE lootdrop SET name = 'ts_tier1_basic_tanning_solution' WHERE id = 992006;

-- Remove old loottable entries for T1 (111001/111002 referenced broken data)
DELETE FROM loottable_entries WHERE loottable_id IN (111001, 111002);

-- ============================================================
-- 2. T2 LOOTDROPS (992009-992015)
-- ============================================================
INSERT INTO lootdrop (id, name) VALUES
(992009, 'ts_tier2_coarse_fiber_bundle'),
(992010, 'ts_tier2_thick_animal_pelt'),
(992011, 'ts_tier2_iron_laced_ore_fragment'),
(992012, 'ts_tier2_dense_iron_ore'),
(992013, 'ts_tier2_coarse_linen_thread'),
(992014, 'ts_tier2_moderate_tanning_solution'),
(992015, 'ts_tier2_standard_tempering_flux');

INSERT INTO lootdrop_entries (lootdrop_id, item_id, item_charges, equip_item, chance, multiplier) VALUES
(992009, 147548, 1, 0, 15, 1), -- Coarse Fiber Bundle
(992010, 147549, 1, 0, 15, 1), -- Thick Animal Pelt
(992011, 147550, 1, 0, 15, 1), -- Iron-Laced Ore Fragment
(992012, 147551, 1, 0, 15, 1), -- Dense Iron Ore
(992013, 147552, 1, 0, 10, 1), -- Coarse Linen Thread
(992014, 147553, 1, 0, 10, 1), -- Moderate Tanning Solution
(992015, 147554, 1, 0, 10, 1); -- Standard Tempering Flux

-- ============================================================
-- 3. T3 LOOTDROPS (992016-992022)
-- ============================================================
INSERT INTO lootdrop (id, name) VALUES
(992016, 'ts_tier3_fine_silk_fibers'),
(992017, 'ts_tier3_supple_drake_hide'),
(992018, 'ts_tier3_steel_veined_ore_shard'),
(992019, 'ts_tier3_high_grade_ore_block'),
(992020, 'ts_tier3_strong_silk_thread'),
(992021, 'ts_tier3_superior_tanning_solution'),
(992022, 'ts_tier3_high_grade_tempering_flux');

INSERT INTO lootdrop_entries (lootdrop_id, item_id, item_charges, equip_item, chance, multiplier) VALUES
(992016, 147592, 1, 0, 15, 1), -- Fine Silk Fibers
(992017, 147593, 1, 0, 15, 1), -- Supple Drake Hide
(992018, 147594, 1, 0, 15, 1), -- Steel-Veined Ore Shard
(992019, 147595, 1, 0, 15, 1), -- High-Grade Ore Block
(992020, 147596, 1, 0, 10, 1), -- Strong Silk Thread
(992021, 147597, 1, 0, 10, 1), -- Superior Tanning Solution
(992022, 147598, 1, 0, 10, 1); -- High-Grade Tempering Flux

-- ============================================================
-- 4. T4 LOOTDROPS (992023-992029)
-- ============================================================
INSERT INTO lootdrop (id, name) VALUES
(992023, 'ts_tier4_enchanted_fiber_bundle'),
(992024, 'ts_tier4_pristine_drake_hide'),
(992025, 'ts_tier4_mithril_ore_shard'),
(992026, 'ts_tier4_adamantite_ore_block'),
(992027, 'ts_tier4_enchanted_binding_thread'),
(992028, 'ts_tier4_mystic_tanning_solution'),
(992029, 'ts_tier4_prime_celestial_flux');

INSERT INTO lootdrop_entries (lootdrop_id, item_id, item_charges, equip_item, chance, multiplier) VALUES
(992023, 147636, 1, 0, 15, 1), -- Enchanted Fiber Bundle
(992024, 147637, 1, 0, 15, 1), -- Pristine Drake Hide
(992025, 147638, 1, 0, 15, 1), -- Mithril Ore Shard
(992026, 147639, 1, 0, 15, 1), -- Adamantite Ore Block
(992027, 147640, 1, 0, 10, 1), -- Enchanted Binding Thread
(992028, 147641, 1, 0, 10, 1), -- Mystic Tanning Solution
(992029, 147642, 1, 0, 10, 1); -- Prime Celestial Flux

-- ============================================================
-- 5. LOOTTABLES PER TIER (111003-111006)
-- ============================================================
INSERT INTO loottable (id, name) VALUES
(111003, 'ts_trash_tier1'),
(111004, 'ts_trash_tier2'),
(111005, 'ts_trash_tier3'),
(111006, 'ts_trash_tier4');

-- T1 loottable references all T1 lootdrops
INSERT INTO loottable_entries (loottable_id, lootdrop_id, multiplier, droplimit, mindrop, probability) VALUES
(111003, 992001, 1, 1, 0, 100),
(111003, 992002, 1, 1, 0, 100),
(111003, 992003, 1, 1, 0, 100),
(111003, 992004, 1, 1, 0, 100),
(111003, 992005, 1, 1, 0, 100),
(111003, 992006, 1, 1, 0, 100),
(111003, 992007, 1, 1, 0, 100);

-- T2 loottable
INSERT INTO loottable_entries (loottable_id, lootdrop_id, multiplier, droplimit, mindrop, probability) VALUES
(111004, 992009, 1, 1, 0, 100),
(111004, 992010, 1, 1, 0, 100),
(111004, 992011, 1, 1, 0, 100),
(111004, 992012, 1, 1, 0, 100),
(111004, 992013, 1, 1, 0, 100),
(111004, 992014, 1, 1, 0, 100),
(111004, 992015, 1, 1, 0, 100);

-- T3 loottable
INSERT INTO loottable_entries (loottable_id, lootdrop_id, multiplier, droplimit, mindrop, probability) VALUES
(111005, 992016, 1, 1, 0, 100),
(111005, 992017, 1, 1, 0, 100),
(111005, 992018, 1, 1, 0, 100),
(111005, 992019, 1, 1, 0, 100),
(111005, 992020, 1, 1, 0, 100),
(111005, 992021, 1, 1, 0, 100),
(111005, 992022, 1, 1, 0, 100);

-- T4 loottable
INSERT INTO loottable_entries (loottable_id, lootdrop_id, multiplier, droplimit, mindrop, probability) VALUES
(111006, 992023, 1, 1, 0, 100),
(111006, 992024, 1, 1, 0, 100),
(111006, 992025, 1, 1, 0, 100),
(111006, 992026, 1, 1, 0, 100),
(111006, 992027, 1, 1, 0, 100),
(111006, 992028, 1, 1, 0, 100),
(111006, 992029, 1, 1, 0, 100);

-- ============================================================
-- 6. ASSIGN LOOTTABLES TO NON-NAMED NPCS PER ZONE
--    Non-named = name starts with 'a_' or 'an_'
--    Named mobs are untouched.
-- ============================================================

-- T1: Dranik's Scar + Nobles' Causeway
UPDATE npc_types nt
JOIN spawnentry se ON se.npcID = nt.id
JOIN spawngroup sg ON sg.id = se.spawngroupID
JOIN spawn2 s2 ON s2.spawngroupID = sg.id
SET nt.loottable_id = 111003
WHERE s2.zone IN ('draniksscar', 'causeway')
  AND (nt.name LIKE 'a\_%' OR nt.name LIKE 'an\_%');

-- T2: Bloodfields + Ruined City of Dranik + Sewers A/B/C
UPDATE npc_types nt
JOIN spawnentry se ON se.npcID = nt.id
JOIN spawngroup sg ON sg.id = se.spawngroupID
JOIN spawn2 s2 ON s2.spawngroupID = sg.id
SET nt.loottable_id = 111004
WHERE s2.zone IN ('bloodfields', 'dranik', 'draniksewersa', 'draniksewersb', 'draniksewersc')
  AND (nt.name LIKE 'a\_%' OR nt.name LIKE 'an\_%');

-- T3: Catacombs A/B/C + Hollows A/B/C + Harbinger's Spire
UPDATE npc_types nt
JOIN spawnentry se ON se.npcID = nt.id
JOIN spawngroup sg ON sg.id = se.spawngroupID
JOIN spawn2 s2 ON s2.spawngroupID = sg.id
SET nt.loottable_id = 111005
WHERE s2.zone IN ('dranikcatacombsa', 'dranikcatacombsb', 'dranikcatacombsc',
                  'dranikhollowsa', 'dranikhollowsb', 'dranikhollowsc',
                  'harbingers')
  AND (nt.name LIKE 'a\_%' OR nt.name LIKE 'an\_%');

-- T4: Wall of Slaughter + Riftseekers' Sanctum + Muramite Proving Grounds (all variants)
UPDATE npc_types nt
JOIN spawnentry se ON se.npcID = nt.id
JOIN spawngroup sg ON sg.id = se.spawngroupID
JOIN spawn2 s2 ON s2.spawngroupID = sg.id
SET nt.loottable_id = 111006
WHERE s2.zone IN ('wallofslaughter', 'riftseekers',
                  'provinggrounds', 'chambersa', 'chambersb', 'chambersc',
                  'chambersd', 'chamberse', 'chambersf')
  AND (nt.name LIKE 'a\_%' OR nt.name LIKE 'an\_%');
