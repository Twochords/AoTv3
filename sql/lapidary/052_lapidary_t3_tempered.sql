-- Lapidary: Tier 3 — Tempered
-- Tradeskill: 61 (Jewelry Making)
-- Container: Lapidary's Workbench (item 147872)
-- Shared catalyst: High-Grade Tempering Flux (147598) for metal refining
--
-- Gem types:
--   Emerald → Ring, Earring, Necklace
--   Diamond → Mask, Cloak
--   Belt    → electrum metal only
--
-- Item IDs:
--   Drop items   : 147927–147932
--   Molds (T3)   : 147933–147938
--   Setting (T3) : 147939
--   Intermediates: 147940–147949
--   Accessories  : 147950–147955
-- Recipe IDs     : 31408–31423
-- Lootdrop IDs   : 992060–992065 (appended to loottable 111005)
-- Merchant list  : 1000028 (Gem Merchant), slots 16–23

-- ============================================================
-- DROP ITEMS (T3)
-- ============================================================
INSERT IGNORE INTO items
  (id, Name, lore, nodrop, norent, stackable, stacksize,
   weight, size, itemtype, icon, idfile, material,
   price, sellrate, tradeskills, classes, races, slots, reqlevel, reclevel)
VALUES
  (147927, 'Cracked Emerald',
   'A cracked emerald shard dropped in the deeper Dranik zones.',
   0,0,1,20, 1,1,17, 958,'',0, 0,0,1, 65535,65535,0, 0,0),

  (147928, 'Hazy Diamond Shard',
   'A clouded diamond fragment from the deeper Dranik zones.',
   0,0,1,20, 1,1,17, 966,'',0, 0,0,1, 65535,65535,0, 0,0),

  (147929, 'Electrum Grain',
   'A grain of raw electrum suitable for refining into wire.',
   0,0,1,20, 1,1,17, 1031,'',0, 0,0,1, 65535,65535,0, 0,0),

  (147930, 'Superior Gem Polish',
   'A high-quality polishing compound for refining cut gems.',
   0,0,1,20, 1,1,17, 706,'',0, 100000,1.0,1, 65535,65535,0, 0,0),

  (147931, 'Tempered Chain Clasp',
   'A tempered metal clasp used to fasten a high-quality belt.',
   0,0,1,20, 1,1,17, 752,'',0, 0,0,1, 65535,65535,0, 0,0),

  (147932, 'Electrum Gem Clasp',
   'An electrum clasp with a gem socket for securing a cloak.',
   0,0,1,20, 1,1,17, 618,'',0, 0,0,1, 65535,65535,0, 0,0);

-- ============================================================
-- MOLDS (T3) — vendor sold, salvage on fail, 100pp each
-- ============================================================
INSERT IGNORE INTO items
  (id, Name, lore, nodrop, norent, stackable, stacksize,
   weight, size, itemtype, icon, idfile, material,
   price, sellrate, tradeskills, classes, races, slots, reqlevel, reclevel)
VALUES
  (147933, 'Tempered Ring Mold',
   'A precision mold used to shape a tempered ring.',
   0,0,0,1, 1,1,17, 1151,'',0, 100000,1.0,1, 65535,65535,0, 0,0),

  (147934, 'Tempered Earring Mold',
   'A precision mold used to shape a tempered earring.',
   0,0,0,1, 1,1,17, 1151,'',0, 100000,1.0,1, 65535,65535,0, 0,0),

  (147935, 'Tempered Necklace Mold',
   'A precision mold used to shape a tempered necklace.',
   0,0,0,1, 1,1,17, 1151,'',0, 100000,1.0,1, 65535,65535,0, 0,0),

  (147936, 'Tempered Face Mold',
   'A precision mold used to shape a tempered face piece.',
   0,0,0,1, 1,1,17, 1151,'',0, 100000,1.0,1, 65535,65535,0, 0,0),

  (147937, 'Tempered Belt Mold',
   'A precision mold used to shape a tempered belt clasp.',
   0,0,0,1, 1,1,17, 1151,'',0, 100000,1.0,1, 65535,65535,0, 0,0),

  (147938, 'Tempered Cloak Mold',
   'A precision mold used to shape a tempered cloak clasp.',
   0,0,0,1, 1,1,17, 1151,'',0, 100000,1.0,1, 65535,65535,0, 0,0);

-- ============================================================
-- SETTING (T3) — vendor sold, salvages on Set Gem fail, 100pp
-- ============================================================
INSERT IGNORE INTO items
  (id, Name, lore, nodrop, norent, stackable, stacksize,
   weight, size, itemtype, icon, idfile, material,
   price, sellrate, tradeskills, classes, races, slots, reqlevel, reclevel)
VALUES
  (147939, 'Electrum Filigree Setting',
   'A fine electrum filigree setting for securing a polished gem.',
   0,0,0,1, 1,1,17, 618,'',0, 100000,1.0,1, 65535,65535,0, 0,0);

-- ============================================================
-- INTERMEDIATES (T3)
-- Emerald chain: Cracked → Shaped → Gleaming → Emerald Setting
-- Diamond chain: Hazy Shard → Rough → Faceted → Diamond Setting
-- Metal chain:   Grain → Electrum Wire → Band/Frame/Chain
-- ============================================================
INSERT IGNORE INTO items
  (id, Name, lore, nodrop, norent, stackable, stacksize,
   weight, size, itemtype, icon, idfile, material,
   price, sellrate, tradeskills, classes, races, slots, reqlevel, reclevel)
VALUES
  (147940, 'Shaped Emerald',
   'A roughly cut emerald beginning to show its green clarity.',
   0,0,1,20, 1,1,17, 958,'',0, 0,0,0, 65535,65535,0, 0,0),

  (147941, 'Gleaming Emerald',
   'A polished emerald with a brilliant green gleam.',
   0,0,1,20, 1,1,17, 958,'',0, 0,0,0, 65535,65535,0, 0,0),

  (147942, 'Emerald Setting',
   'A gleaming emerald in electrum filigree, ready for assembly.',
   0,0,1,20, 1,1,17, 618,'',0, 0,0,0, 65535,65535,0, 0,0),

  (147943, 'Rough Diamond',
   'A roughly cut diamond beginning to reveal its inner fire.',
   0,0,1,20, 1,1,17, 966,'',0, 0,0,0, 65535,65535,0, 0,0),

  (147944, 'Faceted Diamond',
   'A brilliantly faceted diamond with exceptional clarity.',
   0,0,1,20, 1,1,17, 966,'',0, 0,0,0, 65535,65535,0, 0,0),

  (147945, 'Diamond Setting',
   'A faceted diamond in electrum filigree, ready for assembly.',
   0,0,1,20, 1,1,17, 618,'',0, 0,0,0, 65535,65535,0, 0,0),

  (147946, 'Electrum Wire',
   'A length of drawn electrum wire for high-quality jewelry.',
   0,0,1,20, 1,1,17, 1140,'',0, 0,0,0, 65535,65535,0, 0,0),

  (147947, 'Electrum Band',
   'A smooth electrum band shaped for a ring.',
   0,0,1,20, 1,1,17, 1140,'',0, 0,0,0, 65535,65535,0, 0,0),

  (147948, 'Electrum Frame',
   'A fine electrum frame for earrings and face pieces.',
   0,0,1,20, 1,1,17, 1140,'',0, 0,0,0, 65535,65535,0, 0,0),

  (147949, 'Electrum Chain',
   'A fine electrum chain for necklace assembly.',
   0,0,1,20, 1,1,17, 1140,'',0, 0,0,0, 65535,65535,0, 0,0);

-- ============================================================
-- FINISHED ACCESSORIES (T3) — resists only
-- ============================================================
INSERT IGNORE INTO items
  (id, Name, lore, nodrop, norent, stackable,
   weight, size, itemtype, magic,
   MR, FR, CR, PR, DR,
   icon, idfile, material, sellrate, tradeskills,
   classes, races, slots, loregroup, reqlevel, reclevel)
VALUES
  (147950, 'Tempered Emerald Ring',
   'An emerald set in electrum, offering strong elemental resistance.',
   0,0,0, 0,0,10,1,
   4,4,4,4,4,
   512,'',0, 0,0, 65535,65535,98304, 0, 0,0),

  (147951, 'Tempered Emerald Earring',
   'An emerald in electrum, offering strong elemental resistance.',
   0,0,0, 0,0,10,1,
   4,4,4,4,4,
   715,'',0, 0,0, 65535,65535,18, 0, 0,0),

  (147952, 'Tempered Emerald Necklace',
   'An emerald pendant on a fine electrum chain.',
   0,0,0, 1,0,10,1,
   4,4,4,4,4,
   502,'',0, 0,0, 65535,65535,32, 0, 0,0),

  (147953, 'Tempered Diamond Mask',
   'A diamond-set electrum mask with superior magical protection.',
   0,0,0, 2,1,10,1,
   8,4,4,4,4,
   528,'',0, 0,0, 65535,65535,8, 0, 0,0),

  (147954, 'Tempered Electrum Belt',
   'A tempered electrum belt with strong cold and poison resistance.',
   0,0,0, 2,2,10,1,
   0,0,4,4,0,
   503,'',0, 0,0, 65535,65535,1048576, 0, 0,0),

  (147955, 'Tempered Diamond Cloak',
   'A diamond-clasped electrum cloak, the finest resist at this tier.',
   0,0,0, 3,3,10,1,
   6,6,6,6,6,
   659,'',0, 0,0, 65535,65535,256, 0, 0,0);

-- ============================================================
-- RECIPES (T3)
-- tradeskill=61 (Jewelry Making), trivial range 115–185
-- ============================================================
INSERT IGNORE INTO tradeskill_recipe (id, name, tradeskill, skillneeded, trivial, nofail) VALUES
  (31408, 'Shaped Emerald',            61, 0, 115, 0),
  (31409, 'Rough Diamond',             61, 0, 115, 0),
  (31410, 'Electrum Wire',             61, 0, 120, 0),
  (31411, 'Gleaming Emerald',          61, 0, 130, 0),
  (31412, 'Faceted Diamond',           61, 0, 130, 0),
  (31413, 'Electrum Band',             61, 0, 135, 0),
  (31414, 'Electrum Frame',            61, 0, 135, 0),
  (31415, 'Electrum Chain',            61, 0, 140, 0),
  (31416, 'Emerald Setting',           61, 0, 145, 0),
  (31417, 'Diamond Setting',           61, 0, 145, 0),
  (31418, 'Tempered Emerald Earring',  61, 0, 155, 0),
  (31419, 'Tempered Emerald Ring',     61, 0, 155, 0),
  (31420, 'Tempered Diamond Mask',     61, 0, 160, 0),
  (31421, 'Tempered Emerald Necklace', 61, 0, 165, 0),
  (31422, 'Tempered Electrum Belt',    61, 0, 170, 0),
  (31423, 'Tempered Diamond Cloak',    61, 0, 185, 0);

-- ============================================================
-- RECIPE ENTRIES (T3)
-- ============================================================

-- 31408: Shaped Emerald
-- 2× Cracked Emerald + 1× Superior Gem Polish → Shaped Emerald
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31408,147872,0,0,0,0,1),
  (31408,147940,1,0,0,0,0),
  (31408,147927,0,0,2,0,0),
  (31408,147930,0,0,1,0,0);

-- 31409: Rough Diamond
-- 2× Hazy Diamond Shard + 1× Superior Gem Polish → Rough Diamond
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31409,147872,0,0,0,0,1),
  (31409,147943,1,0,0,0,0),
  (31409,147928,0,0,2,0,0),
  (31409,147930,0,0,1,0,0);

-- 31410: Electrum Wire
-- 2× Electrum Grain + 1× High-Grade Tempering Flux (147598) → Electrum Wire
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31410,147872,0,0,0,0,1),
  (31410,147946,1,0,0,0,0),
  (31410,147929,0,0,2,0,0),
  (31410,147598,0,0,1,0,0);

-- 31411: Gleaming Emerald
-- 2× Shaped Emerald + 1× Superior Gem Polish → Gleaming Emerald
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31411,147872,0,0,0,0,1),
  (31411,147941,1,0,0,0,0),
  (31411,147940,0,0,2,0,0),
  (31411,147930,0,0,1,0,0);

-- 31412: Faceted Diamond
-- 2× Rough Diamond + 1× Superior Gem Polish → Faceted Diamond
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31412,147872,0,0,0,0,1),
  (31412,147944,1,0,0,0,0),
  (31412,147943,0,0,2,0,0),
  (31412,147930,0,0,1,0,0);

-- 31413: Electrum Band
-- 1× Electrum Wire → Electrum Band
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31413,147872,0,0,0,0,1),
  (31413,147947,1,0,0,0,0),
  (31413,147946,0,0,1,0,0);

-- 31414: Electrum Frame
-- 1× Electrum Wire → Electrum Frame
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31414,147872,0,0,0,0,1),
  (31414,147948,1,0,0,0,0),
  (31414,147946,0,0,1,0,0);

-- 31415: Electrum Chain
-- 2× Electrum Wire → Electrum Chain
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31415,147872,0,0,0,0,1),
  (31415,147949,1,0,0,0,0),
  (31415,147946,0,0,2,0,0);

-- 31416: Emerald Setting
-- 1× Gleaming Emerald + 1× Electrum Filigree Setting (salvages) → Emerald Setting
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31416,147872,0,0,0,0,1),
  (31416,147942,1,0,0,0,0),
  (31416,147941,0,0,1,0,0),
  (31416,147939,0,0,1,1,0);

-- 31417: Diamond Setting
-- 1× Faceted Diamond + 1× Electrum Filigree Setting (salvages) → Diamond Setting
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31417,147872,0,0,0,0,1),
  (31417,147945,1,0,0,0,0),
  (31417,147944,0,0,1,0,0),
  (31417,147939,0,0,1,1,0);

-- 31418: Tempered Emerald Earring
-- 1× Emerald Setting + 1× Electrum Frame
-- + 1× Tempered Earring Mold (salvages) + 1× Superior Gem Polish → Earring
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31418,147872,0,0,0,0,1),
  (31418,147951,1,0,0,0,0),
  (31418,147942,0,0,1,0,0),
  (31418,147948,0,0,1,0,0),
  (31418,147934,0,0,1,1,0),
  (31418,147930,0,0,1,0,0);

-- 31419: Tempered Emerald Ring
-- 1× Emerald Setting + 1× Electrum Band
-- + 1× Tempered Ring Mold (salvages) + 1× Superior Gem Polish → Ring
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31419,147872,0,0,0,0,1),
  (31419,147950,1,0,0,0,0),
  (31419,147942,0,0,1,0,0),
  (31419,147947,0,0,1,0,0),
  (31419,147933,0,0,1,1,0),
  (31419,147930,0,0,1,0,0);

-- 31420: Tempered Diamond Mask
-- 1× Diamond Setting + 1× Electrum Frame
-- + 1× Tempered Face Mold (salvages) + 1× Superior Gem Polish → Mask
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31420,147872,0,0,0,0,1),
  (31420,147953,1,0,0,0,0),
  (31420,147945,0,0,1,0,0),
  (31420,147948,0,0,1,0,0),
  (31420,147936,0,0,1,1,0),
  (31420,147930,0,0,1,0,0);

-- 31421: Tempered Emerald Necklace
-- 1× Emerald Setting + 1× Electrum Chain
-- + 1× Tempered Necklace Mold (salvages) + 1× Superior Gem Polish → Necklace
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31421,147872,0,0,0,0,1),
  (31421,147952,1,0,0,0,0),
  (31421,147942,0,0,1,0,0),
  (31421,147949,0,0,1,0,0),
  (31421,147935,0,0,1,1,0),
  (31421,147930,0,0,1,0,0);

-- 31422: Tempered Electrum Belt
-- 3× Electrum Wire + 1× Tempered Chain Clasp
-- + 1× Tempered Belt Mold (salvages) + 1× High-Grade Tempering Flux → Belt
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31422,147872,0,0,0,0,1),
  (31422,147954,1,0,0,0,0),
  (31422,147946,0,0,3,0,0),
  (31422,147931,0,0,1,0,0),
  (31422,147937,0,0,1,1,0),
  (31422,147598,0,0,1,0,0);

-- 31423: Tempered Diamond Cloak
-- 1× Faceted Diamond + 2× Electrum Wire + 1× Electrum Gem Clasp
-- + 1× Tempered Cloak Mold (salvages) + 1× Superior Gem Polish → Cloak
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31423,147872,0,0,0,0,1),
  (31423,147955,1,0,0,0,0),
  (31423,147944,0,0,1,0,0),
  (31423,147946,0,0,2,0,0),
  (31423,147932,0,0,1,0,0),
  (31423,147938,0,0,1,1,0),
  (31423,147930,0,0,1,0,0);

-- ============================================================
-- MERCHANT LIST (T3) — Gem Merchant (list 1000028), slots 16–23
-- ============================================================
INSERT IGNORE INTO merchantlist (merchantid, slot, item) VALUES
  (1000028, 16, 147933),  -- Tempered Ring Mold    100pp
  (1000028, 17, 147934),  -- Tempered Earring Mold 100pp
  (1000028, 18, 147935),  -- Tempered Necklace Mold 100pp
  (1000028, 19, 147936),  -- Tempered Face Mold    100pp
  (1000028, 20, 147937),  -- Tempered Belt Mold    100pp
  (1000028, 21, 147938),  -- Tempered Cloak Mold   100pp
  (1000028, 22, 147939),  -- Electrum Filigree Setting 100pp
  (1000028, 23, 147930);  -- Superior Gem Polish   100pp

-- ============================================================
-- LOOT TABLE INTEGRATION (T3)
-- Appended to loottable 111005
-- (Catacombs A/B/C, Dranik's Hollows A/B/C, Harbinger's Spire)
-- ============================================================
INSERT IGNORE INTO lootdrop (id, name) VALUES
  (992060, 'lap_t3_cracked_emerald'),
  (992061, 'lap_t3_hazy_diamond_shard'),
  (992062, 'lap_t3_electrum_grain'),
  (992063, 'lap_t3_superior_gem_polish'),
  (992064, 'lap_t3_tempered_chain_clasp'),
  (992065, 'lap_t3_electrum_gem_clasp');

INSERT IGNORE INTO lootdrop_entries (lootdrop_id, item_id, item_charges, equip_item, chance) VALUES
  (992060, 147927, 1, 0, 15),  -- Cracked Emerald        15%
  (992061, 147928, 1, 0, 10),  -- Hazy Diamond Shard     10%
  (992062, 147929, 1, 0, 15),  -- Electrum Grain         15%
  (992063, 147930, 1, 0, 10),  -- Superior Gem Polish    10%
  (992064, 147931, 1, 0,  5),  -- Tempered Chain Clasp    5%
  (992065, 147932, 1, 0,  5);  -- Electrum Gem Clasp      5%

INSERT IGNORE INTO loottable_entries (loottable_id, lootdrop_id, multiplier, droplimit, mindrop, probability) VALUES
  (111005, 992060, 1, 1, 0, 100),
  (111005, 992061, 1, 1, 0, 100),
  (111005, 992062, 1, 1, 0, 100),
  (111005, 992063, 1, 1, 0, 100),
  (111005, 992064, 1, 1, 0, 100),
  (111005, 992065, 1, 1, 0, 100);
