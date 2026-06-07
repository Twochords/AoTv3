-- Gem Cutting: New Gem Family Loot Tables — All Tiers
-- 12 gem families × 4 tiers = 48 lootdrop groups (IDs 992080–992127)
-- Drop rate: 10% per gem (lower than raw mats at 15% since 12 types exist vs 2)
--
-- Loottable assignments:
--   T1 (111003): Dranik's Scar, Nobles' Causeway
--   T2 (111004): Bloodfields, Ruined City, Sewers A/B/C
--   T3 (111005): Catacombs A/B/C, Hollows A/B/C, Harbinger's Spire
--   T4 (111006): Wall of Slaughter, Riftseekers, Proving Grounds
--
-- Gem order per tier (raw drop IDs):
--   T1: Ruby=148026, Jasper=148030, Topaz=148034, Peridot=148038,
--       Sapphire=148042, Amethyst=148046, Opal=148050,
--       Jade=148054, Citrine=148058, Moonstone=148062, Obsidian=148066, Amber=148070
--   T2: Ruby=148074, Jasper=148078, Topaz=148082, Peridot=148086,
--       Sapphire=148090, Amethyst=148094, Opal=148098,
--       Jade=148102, Citrine=148106, Moonstone=148110, Obsidian=148114, Amber=148118
--   T3: Ruby=148122, Jasper=148126, Topaz=148130, Peridot=148134,
--       Sapphire=148138, Amethyst=148142, Opal=148146,
--       Jade=148150, Citrine=148154, Moonstone=148158, Obsidian=148162, Amber=148166
--   T4: Ruby=148170, Jasper=148174, Topaz=148178, Peridot=148182,
--       Sapphire=148186, Amethyst=148190, Opal=148194,
--       Jade=148198, Citrine=148202, Moonstone=148206, Obsidian=148210, Amber=148214

-- ============================================================
-- LOOTDROP DEFINITIONS
-- ============================================================
INSERT IGNORE INTO lootdrop (id, name) VALUES
  -- T1
  (992080,'gc_t1_rough_ruby'),      (992081,'gc_t1_rough_jasper'),
  (992082,'gc_t1_rough_topaz'),     (992083,'gc_t1_rough_peridot'),
  (992084,'gc_t1_rough_sapphire'),  (992085,'gc_t1_rough_amethyst'),
  (992086,'gc_t1_rough_opal'),      (992087,'gc_t1_rough_jade'),
  (992088,'gc_t1_rough_citrine'),   (992089,'gc_t1_rough_moonstone'),
  (992090,'gc_t1_rough_obsidian'),  (992091,'gc_t1_rough_amber'),
  -- T2
  (992092,'gc_t2_pale_ruby_chip'),     (992093,'gc_t2_pale_jasper_chip'),
  (992094,'gc_t2_pale_topaz_chip'),    (992095,'gc_t2_pale_peridot_chip'),
  (992096,'gc_t2_pale_sapphire_chip'), (992097,'gc_t2_pale_amethyst_chip'),
  (992098,'gc_t2_pale_opal_chip'),     (992099,'gc_t2_pale_jade_chip'),
  (992100,'gc_t2_pale_citrine_chip'),  (992101,'gc_t2_pale_moonstone_chip'),
  (992102,'gc_t2_pale_obsidian_chip'), (992103,'gc_t2_pale_amber_chip'),
  -- T3
  (992104,'gc_t3_deep_ruby_crystal'),      (992105,'gc_t3_deep_jasper_crystal'),
  (992106,'gc_t3_deep_topaz_crystal'),     (992107,'gc_t3_deep_peridot_crystal'),
  (992108,'gc_t3_deep_sapphire_crystal'),  (992109,'gc_t3_deep_amethyst_crystal'),
  (992110,'gc_t3_deep_opal_crystal'),      (992111,'gc_t3_deep_jade_crystal'),
  (992112,'gc_t3_deep_citrine_crystal'),   (992113,'gc_t3_deep_moonstone_crystal'),
  (992114,'gc_t3_deep_obsidian_crystal'),  (992115,'gc_t3_deep_amber_crystal'),
  -- T4
  (992116,'gc_t4_brilliant_ruby_core'),      (992117,'gc_t4_brilliant_jasper_core'),
  (992118,'gc_t4_brilliant_topaz_core'),     (992119,'gc_t4_brilliant_peridot_core'),
  (992120,'gc_t4_brilliant_sapphire_core'),  (992121,'gc_t4_brilliant_amethyst_core'),
  (992122,'gc_t4_brilliant_opal_core'),      (992123,'gc_t4_brilliant_jade_core'),
  (992124,'gc_t4_brilliant_citrine_core'),   (992125,'gc_t4_brilliant_moonstone_core'),
  (992126,'gc_t4_brilliant_obsidian_core'),  (992127,'gc_t4_brilliant_amber_core');

-- ============================================================
-- LOOTDROP ENTRIES (10% drop rate per gem)
-- ============================================================
INSERT IGNORE INTO lootdrop_entries (lootdrop_id, item_id, item_charges, equip_item, chance) VALUES
  -- T1
  (992080,148026,1,0,10),(992081,148030,1,0,10),(992082,148034,1,0,10),(992083,148038,1,0,10),
  (992084,148042,1,0,10),(992085,148046,1,0,10),(992086,148050,1,0,10),(992087,148054,1,0,10),
  (992088,148058,1,0,10),(992089,148062,1,0,10),(992090,148066,1,0,10),(992091,148070,1,0,10),
  -- T2
  (992092,148074,1,0,10),(992093,148078,1,0,10),(992094,148082,1,0,10),(992095,148086,1,0,10),
  (992096,148090,1,0,10),(992097,148094,1,0,10),(992098,148098,1,0,10),(992099,148102,1,0,10),
  (992100,148106,1,0,10),(992101,148110,1,0,10),(992102,148114,1,0,10),(992103,148118,1,0,10),
  -- T3
  (992104,148122,1,0,10),(992105,148126,1,0,10),(992106,148130,1,0,10),(992107,148134,1,0,10),
  (992108,148138,1,0,10),(992109,148142,1,0,10),(992110,148146,1,0,10),(992111,148150,1,0,10),
  (992112,148154,1,0,10),(992113,148158,1,0,10),(992114,148162,1,0,10),(992115,148166,1,0,10),
  -- T4
  (992116,148170,1,0,10),(992117,148174,1,0,10),(992118,148178,1,0,10),(992119,148182,1,0,10),
  (992120,148186,1,0,10),(992121,148190,1,0,10),(992122,148194,1,0,10),(992123,148198,1,0,10),
  (992124,148202,1,0,10),(992125,148206,1,0,10),(992126,148210,1,0,10),(992127,148214,1,0,10);

-- ============================================================
-- LOOTTABLE ENTRIES — append to existing tier loottables
-- ============================================================
INSERT IGNORE INTO loottable_entries (loottable_id, lootdrop_id, multiplier, droplimit, mindrop, probability) VALUES
  -- T1 → loottable 111003
  (111003,992080,1,1,0,100),(111003,992081,1,1,0,100),(111003,992082,1,1,0,100),(111003,992083,1,1,0,100),
  (111003,992084,1,1,0,100),(111003,992085,1,1,0,100),(111003,992086,1,1,0,100),(111003,992087,1,1,0,100),
  (111003,992088,1,1,0,100),(111003,992089,1,1,0,100),(111003,992090,1,1,0,100),(111003,992091,1,1,0,100),
  -- T2 → loottable 111004
  (111004,992092,1,1,0,100),(111004,992093,1,1,0,100),(111004,992094,1,1,0,100),(111004,992095,1,1,0,100),
  (111004,992096,1,1,0,100),(111004,992097,1,1,0,100),(111004,992098,1,1,0,100),(111004,992099,1,1,0,100),
  (111004,992100,1,1,0,100),(111004,992101,1,1,0,100),(111004,992102,1,1,0,100),(111004,992103,1,1,0,100),
  -- T3 → loottable 111005
  (111005,992104,1,1,0,100),(111005,992105,1,1,0,100),(111005,992106,1,1,0,100),(111005,992107,1,1,0,100),
  (111005,992108,1,1,0,100),(111005,992109,1,1,0,100),(111005,992110,1,1,0,100),(111005,992111,1,1,0,100),
  (111005,992112,1,1,0,100),(111005,992113,1,1,0,100),(111005,992114,1,1,0,100),(111005,992115,1,1,0,100),
  -- T4 → loottable 111006
  (111006,992116,1,1,0,100),(111006,992117,1,1,0,100),(111006,992118,1,1,0,100),(111006,992119,1,1,0,100),
  (111006,992120,1,1,0,100),(111006,992121,1,1,0,100),(111006,992122,1,1,0,100),(111006,992123,1,1,0,100),
  (111006,992124,1,1,0,100),(111006,992125,1,1,0,100),(111006,992126,1,1,0,100),(111006,992127,1,1,0,100);
