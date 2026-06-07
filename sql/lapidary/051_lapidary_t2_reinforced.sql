-- Lapidary: Tier 2 — Reinforced
-- Tradeskill: 61 (Jewelry Making)
-- Container: Lapidary's Workbench (item 147872)
-- Shared catalysts: Standard Tempering Flux (147554) for metal refining
--
-- Two gem types introduced at T2:
--   Sapphire → Ring, Earring, Necklace
--   Ruby     → Mask, Cloak
--   Belt     → silver metal only (no gem)
--
-- Item IDs:
--   Drop items   : 147898–147903
--   Molds (T2)   : 147904–147909
--   Setting (T2) : 147910
--   Intermediates: 147911–147920
--   Accessories  : 147921–147926
-- Recipe IDs     : 31392–31407
-- Lootdrop IDs   : 992054–992059 (appended to loottable 111004)
-- Merchant list  : 1000028 (Gem Merchant), slots 8–15

-- ============================================================
-- DROP ITEMS (T2)
-- ============================================================
INSERT IGNORE INTO items
  (id, Name, lore, nodrop, norent, stackable, stacksize,
   weight, size, itemtype, icon, idfile, material,
   price, sellrate, tradeskills, classes, races, slots, reqlevel, reclevel)
VALUES
  (147898, 'Clouded Sapphire Chip',
   'A rough sapphire shard salvaged from fallen creatures in the Bloodfields.',
   0,0,1,20, 1,1,17, 963,'',0, 0,0,1, 65535,65535,0, 0,0),

  (147899, 'Pale Ruby Shard',
   'A dull red stone salvaged from creatures in the Ruined City and Sewers.',
   0,0,1,20, 1,1,17, 964,'',0, 0,0,1, 65535,65535,0, 0,0),

  (147900, 'Rough Silver Nugget',
   'A rough nugget of silver suitable for refining into jewelry wire.',
   0,0,1,20, 1,1,17, 1031,'',0, 0,0,1, 65535,65535,0, 0,0),

  (147901, 'Standard Gem Polish',
   'A polishing compound of moderate quality for refining cut gems.',
   0,0,1,20, 1,1,17, 706,'',0, 25000,1.0,1, 65535,65535,0, 0,0),

  (147902, 'Iron Chain Clasp',
   'A sturdy iron clasp used to fasten a reinforced belt.',
   0,0,1,20, 1,1,17, 752,'',0, 0,0,1, 65535,65535,0, 0,0),

  (147903, 'Silver Gem Clasp',
   'A silver clasp with a gem socket used to secure a reinforced cloak.',
   0,0,1,20, 1,1,17, 618,'',0, 0,0,1, 65535,65535,0, 0,0);

-- ============================================================
-- MOLDS (T2) — vendor sold, salvage on fail, 25pp each
-- ============================================================
INSERT IGNORE INTO items
  (id, Name, lore, nodrop, norent, stackable, stacksize,
   weight, size, itemtype, icon, idfile, material,
   price, sellrate, tradeskills, classes, races, slots, reqlevel, reclevel)
VALUES
  (147904, 'Reinforced Ring Mold',
   'A sturdy mold used to shape a reinforced ring.',
   0,0,0,1, 1,1,17, 1151,'',0, 25000,1.0,1, 65535,65535,0, 0,0),

  (147905, 'Reinforced Earring Mold',
   'A sturdy mold used to shape a reinforced earring.',
   0,0,0,1, 1,1,17, 1151,'',0, 25000,1.0,1, 65535,65535,0, 0,0),

  (147906, 'Reinforced Necklace Mold',
   'A sturdy mold used to shape a reinforced necklace.',
   0,0,0,1, 1,1,17, 1151,'',0, 25000,1.0,1, 65535,65535,0, 0,0),

  (147907, 'Reinforced Face Mold',
   'A sturdy mold used to shape a reinforced face piece.',
   0,0,0,1, 1,1,17, 1151,'',0, 25000,1.0,1, 65535,65535,0, 0,0),

  (147908, 'Reinforced Belt Mold',
   'A sturdy mold used to shape a reinforced belt clasp.',
   0,0,0,1, 1,1,17, 1151,'',0, 25000,1.0,1, 65535,65535,0, 0,0),

  (147909, 'Reinforced Cloak Mold',
   'A sturdy mold used to shape a reinforced cloak clasp.',
   0,0,0,1, 1,1,17, 1151,'',0, 25000,1.0,1, 65535,65535,0, 0,0);

-- ============================================================
-- SETTING (T2) — vendor sold, salvages on Set Gem fail, 25pp
-- ============================================================
INSERT IGNORE INTO items
  (id, Name, lore, nodrop, norent, stackable, stacksize,
   weight, size, itemtype, icon, idfile, material,
   price, sellrate, tradeskills, classes, races, slots, reqlevel, reclevel)
VALUES
  (147910, 'Silver Filigree Setting',
   'A delicate silver filigree setting for securing a cut gemstone.',
   0,0,0,1, 1,1,17, 618,'',0, 25000,1.0,1, 65535,65535,0, 0,0);

-- ============================================================
-- INTERMEDIATES (T2)
-- Sapphire chain: Cut → Polished → Sapphire Setting
-- Ruby chain:     Cut → Polished → Ruby Setting
-- Metal chain:    Nugget → Silver Wire → Band/Frame/Chain
-- ============================================================
INSERT IGNORE INTO items
  (id, Name, lore, nodrop, norent, stackable, stacksize,
   weight, size, itemtype, icon, idfile, material,
   price, sellrate, tradeskills, classes, races, slots, reqlevel, reclevel)
VALUES
  (147911, 'Cut Sapphire',
   'A roughly cut sapphire beginning to show its blue clarity.',
   0,0,1,20, 1,1,17, 963,'',0, 0,0,0, 65535,65535,0, 0,0),

  (147912, 'Polished Sapphire',
   'A polished sapphire with a clear blue gleam.',
   0,0,1,20, 1,1,17, 963,'',0, 0,0,0, 65535,65535,0, 0,0),

  (147913, 'Sapphire Setting',
   'A polished sapphire secured in silver filigree, ready for assembly.',
   0,0,1,20, 1,1,17, 618,'',0, 0,0,0, 65535,65535,0, 0,0),

  (147914, 'Cut Ruby',
   'A roughly cut ruby beginning to show its red depth.',
   0,0,1,20, 1,1,17, 964,'',0, 0,0,0, 65535,65535,0, 0,0),

  (147915, 'Polished Ruby',
   'A polished ruby with a rich red gleam.',
   0,0,1,20, 1,1,17, 964,'',0, 0,0,0, 65535,65535,0, 0,0),

  (147916, 'Ruby Setting',
   'A polished ruby secured in silver filigree, ready for assembly.',
   0,0,1,20, 1,1,17, 618,'',0, 0,0,0, 65535,65535,0, 0,0),

  (147917, 'Drawn Silver Wire',
   'A length of drawn silver wire for jewelry construction.',
   0,0,1,20, 1,1,17, 1140,'',0, 0,0,0, 65535,65535,0, 0,0),

  (147918, 'Silver Band',
   'A smooth silver band shaped for a ring.',
   0,0,1,20, 1,1,17, 1140,'',0, 0,0,0, 65535,65535,0, 0,0),

  (147919, 'Silver Frame',
   'A delicate silver frame for earrings and face pieces.',
   0,0,1,20, 1,1,17, 1140,'',0, 0,0,0, 65535,65535,0, 0,0),

  (147920, 'Silver Link Chain',
   'A fine silver chain for necklace assembly.',
   0,0,1,20, 1,1,17, 1140,'',0, 0,0,0, 65535,65535,0, 0,0);

-- ============================================================
-- FINISHED ACCESSORIES (T2) — resists only
-- ============================================================
INSERT IGNORE INTO items
  (id, Name, lore, nodrop, norent, stackable,
   weight, size, itemtype, magic,
   MR, FR, CR, PR, DR,
   icon, idfile, material, sellrate, tradeskills,
   classes, races, slots, loregroup, reqlevel, reclevel)
VALUES
  (147921, 'Reinforced Sapphire Ring',
   'A sapphire set in silver, granting improved elemental resistance.',
   0,0,0, 0,0,10,1,
   2,2,2,2,2,
   512,'',0, 0,0, 65535,65535,98304, 0, 0,0),

  (147922, 'Reinforced Sapphire Earring',
   'A sapphire set in a silver frame, granting improved elemental resistance.',
   0,0,0, 0,0,10,1,
   2,2,2,2,2,
   715,'',0, 0,0, 65535,65535,18, 0, 0,0),

  (147923, 'Reinforced Sapphire Necklace',
   'A sapphire pendant on a fine silver chain.',
   0,0,0, 1,0,10,1,
   2,2,2,2,2,
   502,'',0, 0,0, 65535,65535,32, 0, 0,0),

  (147924, 'Reinforced Ruby Mask',
   'A ruby-set silver mask offering superior magical protection.',
   0,0,0, 2,1,10,1,
   4,2,2,2,2,
   528,'',0, 0,0, 65535,65535,8, 0, 0,0),

  (147925, 'Reinforced Silver Belt',
   'A reinforced silver belt offering improved cold and poison resistance.',
   0,0,0, 2,2,10,1,
   0,0,2,2,0,
   503,'',0, 0,0, 65535,65535,1048576, 0, 0,0),

  (147926, 'Reinforced Ruby Cloak',
   'A ruby-clasped silver cloak offering the best resist coverage at this tier.',
   0,0,0, 3,3,10,1,
   3,3,3,3,3,
   659,'',0, 0,0, 65535,65535,256, 0, 0,0);

-- ============================================================
-- RECIPES (T2)
-- tradeskill=61 (Jewelry Making), trivial range 75–145
-- ============================================================
INSERT IGNORE INTO tradeskill_recipe (id, name, tradeskill, skillneeded, trivial, nofail) VALUES
  (31392, 'Cut Sapphire',                 61, 0,  75, 0),
  (31393, 'Cut Ruby',                     61, 0,  75, 0),
  (31394, 'Drawn Silver Wire',            61, 0,  80, 0),
  (31395, 'Polished Sapphire',            61, 0,  90, 0),
  (31396, 'Polished Ruby',               61, 0,  90, 0),
  (31397, 'Silver Band',                  61, 0,  95, 0),
  (31398, 'Silver Frame',                 61, 0,  95, 0),
  (31399, 'Silver Link Chain',            61, 0, 100, 0),
  (31400, 'Sapphire Setting',             61, 0, 105, 0),
  (31401, 'Ruby Setting',                 61, 0, 105, 0),
  (31402, 'Reinforced Sapphire Earring',  61, 0, 115, 0),
  (31403, 'Reinforced Sapphire Ring',     61, 0, 115, 0),
  (31404, 'Reinforced Ruby Mask',         61, 0, 120, 0),
  (31405, 'Reinforced Sapphire Necklace', 61, 0, 125, 0),
  (31406, 'Reinforced Silver Belt',       61, 0, 130, 0),
  (31407, 'Reinforced Ruby Cloak',        61, 0, 145, 0);

-- ============================================================
-- RECIPE ENTRIES (T2)
-- ============================================================

-- 31392: Cut Sapphire
-- 2× Clouded Sapphire Chip + 1× Standard Gem Polish → Cut Sapphire
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31392,147872,0,0,0,0,1),
  (31392,147911,1,0,0,0,0),
  (31392,147898,0,0,2,0,0),
  (31392,147901,0,0,1,0,0);

-- 31393: Cut Ruby
-- 2× Pale Ruby Shard + 1× Standard Gem Polish → Cut Ruby
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31393,147872,0,0,0,0,1),
  (31393,147914,1,0,0,0,0),
  (31393,147899,0,0,2,0,0),
  (31393,147901,0,0,1,0,0);

-- 31394: Drawn Silver Wire
-- 2× Rough Silver Nugget + 1× Standard Tempering Flux (147554) → Drawn Silver Wire
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31394,147872,0,0,0,0,1),
  (31394,147917,1,0,0,0,0),
  (31394,147900,0,0,2,0,0),
  (31394,147554,0,0,1,0,0);

-- 31395: Polished Sapphire
-- 2× Cut Sapphire + 1× Standard Gem Polish → Polished Sapphire
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31395,147872,0,0,0,0,1),
  (31395,147912,1,0,0,0,0),
  (31395,147911,0,0,2,0,0),
  (31395,147901,0,0,1,0,0);

-- 31396: Polished Ruby
-- 2× Cut Ruby + 1× Standard Gem Polish → Polished Ruby
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31396,147872,0,0,0,0,1),
  (31396,147915,1,0,0,0,0),
  (31396,147914,0,0,2,0,0),
  (31396,147901,0,0,1,0,0);

-- 31397: Silver Band
-- 1× Drawn Silver Wire → Silver Band
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31397,147872,0,0,0,0,1),
  (31397,147918,1,0,0,0,0),
  (31397,147917,0,0,1,0,0);

-- 31398: Silver Frame
-- 1× Drawn Silver Wire → Silver Frame
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31398,147872,0,0,0,0,1),
  (31398,147919,1,0,0,0,0),
  (31398,147917,0,0,1,0,0);

-- 31399: Silver Link Chain
-- 2× Drawn Silver Wire → Silver Link Chain
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31399,147872,0,0,0,0,1),
  (31399,147920,1,0,0,0,0),
  (31399,147917,0,0,2,0,0);

-- 31400: Sapphire Setting
-- 1× Polished Sapphire + 1× Silver Filigree Setting (salvages) → Sapphire Setting
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31400,147872,0,0,0,0,1),
  (31400,147913,1,0,0,0,0),
  (31400,147912,0,0,1,0,0),
  (31400,147910,0,0,1,1,0);

-- 31401: Ruby Setting
-- 1× Polished Ruby + 1× Silver Filigree Setting (salvages) → Ruby Setting
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31401,147872,0,0,0,0,1),
  (31401,147916,1,0,0,0,0),
  (31401,147915,0,0,1,0,0),
  (31401,147910,0,0,1,1,0);

-- 31402: Reinforced Sapphire Earring
-- 1× Sapphire Setting + 1× Silver Frame
-- + 1× Reinforced Earring Mold (salvages) + 1× Standard Gem Polish → Earring
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31402,147872,0,0,0,0,1),
  (31402,147922,1,0,0,0,0),
  (31402,147913,0,0,1,0,0),
  (31402,147919,0,0,1,0,0),
  (31402,147905,0,0,1,1,0),
  (31402,147901,0,0,1,0,0);

-- 31403: Reinforced Sapphire Ring
-- 1× Sapphire Setting + 1× Silver Band
-- + 1× Reinforced Ring Mold (salvages) + 1× Standard Gem Polish → Ring
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31403,147872,0,0,0,0,1),
  (31403,147921,1,0,0,0,0),
  (31403,147913,0,0,1,0,0),
  (31403,147918,0,0,1,0,0),
  (31403,147904,0,0,1,1,0),
  (31403,147901,0,0,1,0,0);

-- 31404: Reinforced Ruby Mask
-- 1× Ruby Setting + 1× Silver Frame
-- + 1× Reinforced Face Mold (salvages) + 1× Standard Gem Polish → Mask
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31404,147872,0,0,0,0,1),
  (31404,147924,1,0,0,0,0),
  (31404,147916,0,0,1,0,0),
  (31404,147919,0,0,1,0,0),
  (31404,147907,0,0,1,1,0),
  (31404,147901,0,0,1,0,0);

-- 31405: Reinforced Sapphire Necklace
-- 1× Sapphire Setting + 1× Silver Link Chain
-- + 1× Reinforced Necklace Mold (salvages) + 1× Standard Gem Polish → Necklace
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31405,147872,0,0,0,0,1),
  (31405,147923,1,0,0,0,0),
  (31405,147913,0,0,1,0,0),
  (31405,147920,0,0,1,0,0),
  (31405,147906,0,0,1,1,0),
  (31405,147901,0,0,1,0,0);

-- 31406: Reinforced Silver Belt
-- 3× Drawn Silver Wire + 1× Iron Chain Clasp
-- + 1× Reinforced Belt Mold (salvages) + 1× Standard Tempering Flux → Belt
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31406,147872,0,0,0,0,1),
  (31406,147925,1,0,0,0,0),
  (31406,147917,0,0,3,0,0),
  (31406,147902,0,0,1,0,0),
  (31406,147908,0,0,1,1,0),
  (31406,147554,0,0,1,0,0);

-- 31407: Reinforced Ruby Cloak
-- 1× Polished Ruby + 2× Drawn Silver Wire + 1× Silver Gem Clasp
-- + 1× Reinforced Cloak Mold (salvages) + 1× Standard Gem Polish → Cloak
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31407,147872,0,0,0,0,1),
  (31407,147926,1,0,0,0,0),
  (31407,147915,0,0,1,0,0),
  (31407,147917,0,0,2,0,0),
  (31407,147903,0,0,1,0,0),
  (31407,147909,0,0,1,1,0),
  (31407,147901,0,0,1,0,0);

-- ============================================================
-- MERCHANT LIST (T2) — Gem Merchant (list 1000028), slots 8–15
-- ============================================================
INSERT IGNORE INTO merchantlist (merchantid, slot, item) VALUES
  (1000028,  8, 147904),  -- Reinforced Ring Mold    25pp
  (1000028,  9, 147905),  -- Reinforced Earring Mold 25pp
  (1000028, 10, 147906),  -- Reinforced Necklace Mold 25pp
  (1000028, 11, 147907),  -- Reinforced Face Mold    25pp
  (1000028, 12, 147908),  -- Reinforced Belt Mold    25pp
  (1000028, 13, 147909),  -- Reinforced Cloak Mold   25pp
  (1000028, 14, 147910),  -- Silver Filigree Setting 25pp
  (1000028, 15, 147901);  -- Standard Gem Polish     25pp

-- ============================================================
-- LOOT TABLE INTEGRATION (T2)
-- Appended to loottable 111004
-- (Bloodfields, Ruined City of Dranik, Sewers A/B/C)
-- ============================================================
INSERT IGNORE INTO lootdrop (id, name) VALUES
  (992054, 'lap_t2_clouded_sapphire_chip'),
  (992055, 'lap_t2_pale_ruby_shard'),
  (992056, 'lap_t2_rough_silver_nugget'),
  (992057, 'lap_t2_standard_gem_polish'),
  (992058, 'lap_t2_iron_chain_clasp'),
  (992059, 'lap_t2_silver_gem_clasp');

INSERT IGNORE INTO lootdrop_entries (lootdrop_id, item_id, item_charges, equip_item, chance) VALUES
  (992054, 147898, 1, 0, 15),  -- Clouded Sapphire Chip  15%
  (992055, 147899, 1, 0, 10),  -- Pale Ruby Shard        10%
  (992056, 147900, 1, 0, 15),  -- Rough Silver Nugget    15%
  (992057, 147901, 1, 0, 10),  -- Standard Gem Polish    10%
  (992058, 147902, 1, 0,  5),  -- Iron Chain Clasp        5%
  (992059, 147903, 1, 0,  5);  -- Silver Gem Clasp        5%

INSERT IGNORE INTO loottable_entries (loottable_id, lootdrop_id, multiplier, droplimit, mindrop, probability) VALUES
  (111004, 992054, 1, 1, 0, 100),
  (111004, 992055, 1, 1, 0, 100),
  (111004, 992056, 1, 1, 0, 100),
  (111004, 992057, 1, 1, 0, 100),
  (111004, 992058, 1, 1, 0, 100),
  (111004, 992059, 1, 1, 0, 100);
