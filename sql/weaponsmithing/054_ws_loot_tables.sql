-- Weapon Smithing: Loot Table Integration
--
-- Adds weapon material lootdrop groups to existing armor smithing loottables.
-- Armor loottable IDs (from armor smithing migration):
--   111003 = T1 zones (Dranik's Scar, Nobles' Causeway)
--   111004 = T2 zones (Bloodfields, Ruined City, Sewers A/B/C)
--   111005 = T3 zones (Catacombs, Hollows, Harbinger's Spire)
--   111006 = T4 zones (Wall of Slaughter, Riftseekers', Proving Grounds, Chambers)
--
-- Each lootdrop group contains one item. Each is attached with:
--   multiplier=1, droplimit=1, mindrop=0, probability=100
-- The chance value inside lootdrop_entries controls actual drop rate.
--
-- Weapon lootdrop IDs: 992030-992048 (gaps between tiers for readability)

-- ============================================================
-- TIER 1 WEAPON LOOTDROPS
-- ============================================================
INSERT INTO lootdrop (id, name) VALUES
  (992030, 'ws_t1_weathered_metal_shard'),
  (992031, 'ws_t1_splintered_weapon_handle'),
  (992032, 'ws_t1_cracked_weapon_haft'),
  (992033, 'ws_t1_dim_focus_stone');

INSERT INTO lootdrop_entries (lootdrop_id, item_id, item_charges, equip_item, chance) VALUES
  (992030, 147681, 1, 0, 15),  -- Weathered Metal Shard 15%
  (992031, 147682, 1, 0, 10),  -- Splintered Weapon Handle 10%
  (992032, 147683, 1, 0, 10),  -- Cracked Weapon Haft 10%
  (992033, 147684, 1, 0,  5);  -- Dim Focus Stone 5%

INSERT INTO loottable_entries (loottable_id, lootdrop_id, multiplier, droplimit, mindrop, probability) VALUES
  (111003, 992030, 1, 1, 0, 100),
  (111003, 992031, 1, 1, 0, 100),
  (111003, 992032, 1, 1, 0, 100),
  (111003, 992033, 1, 1, 0, 100);

-- ============================================================
-- TIER 2 WEAPON LOOTDROPS
-- ============================================================
INSERT INTO lootdrop (id, name) VALUES
  (992035, 'ws_t2_iron_weapon_fragment'),
  (992036, 'ws_t2_rough_weapon_handle'),
  (992037, 'ws_t2_sturdy_weapon_haft'),
  (992038, 'ws_t2_glowing_focus_stone');

INSERT INTO lootdrop_entries (lootdrop_id, item_id, item_charges, equip_item, chance) VALUES
  (992035, 147685, 1, 0, 15),  -- Iron Weapon Fragment 15%
  (992036, 147686, 1, 0, 10),  -- Rough Weapon Handle 10%
  (992037, 147687, 1, 0, 10),  -- Sturdy Weapon Haft 10%
  (992038, 147688, 1, 0,  5);  -- Glowing Focus Stone 5%

INSERT INTO loottable_entries (loottable_id, lootdrop_id, multiplier, droplimit, mindrop, probability) VALUES
  (111004, 992035, 1, 1, 0, 100),
  (111004, 992036, 1, 1, 0, 100),
  (111004, 992037, 1, 1, 0, 100),
  (111004, 992038, 1, 1, 0, 100);

-- ============================================================
-- TIER 3 WEAPON LOOTDROPS
-- ============================================================
INSERT INTO lootdrop (id, name) VALUES
  (992040, 'ws_t3_steel_weapon_shard'),
  (992041, 'ws_t3_balanced_weapon_handle'),
  (992042, 'ws_t3_balanced_weapon_shaft'),
  (992043, 'ws_t3_brilliant_focus_stone');

INSERT INTO lootdrop_entries (lootdrop_id, item_id, item_charges, equip_item, chance) VALUES
  (992040, 147689, 1, 0, 15),  -- Steel Weapon Shard 15%
  (992041, 147690, 1, 0, 10),  -- Balanced Weapon Handle 10%
  (992042, 147691, 1, 0, 10),  -- Balanced Weapon Shaft 10%
  (992043, 147692, 1, 0,  5);  -- Brilliant Focus Stone 5%

INSERT INTO loottable_entries (loottable_id, lootdrop_id, multiplier, droplimit, mindrop, probability) VALUES
  (111005, 992040, 1, 1, 0, 100),
  (111005, 992041, 1, 1, 0, 100),
  (111005, 992042, 1, 1, 0, 100),
  (111005, 992043, 1, 1, 0, 100);

-- ============================================================
-- TIER 4 WEAPON LOOTDROPS
-- ============================================================
INSERT INTO lootdrop (id, name) VALUES
  (992045, 'ws_t4_ascendant_metal_shard'),
  (992046, 'ws_t4_runed_weapon_handle'),
  (992047, 'ws_t4_runed_weapon_shaft'),
  (992048, 'ws_t4_radiant_focus_stone');

INSERT INTO lootdrop_entries (lootdrop_id, item_id, item_charges, equip_item, chance) VALUES
  (992045, 147693, 1, 0, 15),  -- Ascendant Metal Shard 15%
  (992046, 147694, 1, 0, 10),  -- Runed Weapon Handle 10%
  (992047, 147695, 1, 0, 10),  -- Runed Weapon Shaft 10%
  (992048, 147696, 1, 0,  5);  -- Radiant Focus Stone 5%

INSERT INTO loottable_entries (loottable_id, lootdrop_id, multiplier, droplimit, mindrop, probability) VALUES
  (111006, 992045, 1, 1, 0, 100),
  (111006, 992046, 1, 1, 0, 100),
  (111006, 992047, 1, 1, 0, 100),
  (111006, 992048, 1, 1, 0, 100);
