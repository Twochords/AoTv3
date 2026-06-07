-- Lapidary: Tier 4 — Ascendant
-- Tradeskill: 61 (Jewelry Making)
-- Container: Lapidary's Workbench (item 147872)
-- Shared catalyst: Prime Celestial Flux (147642) for metal refining
--
-- Gem types:
--   Celestial Gem → Ring, Earring, Necklace
--   Arcane Stone  → Mask, Cloak
--   Belt          → mithril metal only
--
-- Item IDs:
--   Drop items   : 147956–147961
--   Molds (T4)   : 147962–147967
--   Setting (T4) : 147968
--   Intermediates: 147969–147978
--   Accessories  : 147979–147984
-- Recipe IDs     : 31424–31439
-- Lootdrop IDs   : 992066–992071 (appended to loottable 111006)
-- Merchant list  : 1000028 (Gem Merchant), slots 24–31

-- ============================================================
-- DROP ITEMS (T4)
-- ============================================================
INSERT IGNORE INTO items
  (id, Name, lore, nodrop, norent, stackable, stacksize,
   weight, size, itemtype, icon, idfile, material,
   price, sellrate, tradeskills, classes, races, slots, reqlevel, reclevel)
VALUES
  (147956, 'Raw Celestial Gem',
   'A gem pulsing with elemental energy from T4 Dranik zones.',
   0,0,1,20, 1,1,17, 959,'',0, 0,0,1, 65535,65535,0, 0,0),

  (147957, 'Arcane Stone Core',
   'An arcane stone core from the deepest Dranik zones.',
   0,0,1,20, 1,1,17, 766,'',0, 0,0,1, 65535,65535,0, 0,0),

  (147958, 'Mithril Dust',
   'Fine mithril dust suitable for drawing into jewelry wire.',
   0,0,1,20, 1,1,17, 1138,'',0, 0,0,1, 65535,65535,0, 0,0),

  (147959, 'Prime Gem Polish',
   'The finest polishing compound for ascendant gemcrafting.',
   0,0,1,20, 1,1,17, 706,'',0, 500000,1.0,1, 65535,65535,0, 0,0),

  (147960, 'Ascendant Chain Clasp',
   'A mithril clasp for fastening an ascendant belt.',
   0,0,1,20, 1,1,17, 752,'',0, 0,0,1, 65535,65535,0, 0,0),

  (147961, 'Mithril Gem Clasp',
   'A mithril clasp with an arcane gem socket for a cloak.',
   0,0,1,20, 1,1,17, 618,'',0, 0,0,1, 65535,65535,0, 0,0);

-- ============================================================
-- MOLDS (T4) — vendor sold, salvage on fail, 500pp each
-- ============================================================
INSERT IGNORE INTO items
  (id, Name, lore, nodrop, norent, stackable, stacksize,
   weight, size, itemtype, icon, idfile, material,
   price, sellrate, tradeskills, classes, races, slots, reqlevel, reclevel)
VALUES
  (147962, 'Ascendant Ring Mold',
   'A masterwork mold used to shape an ascendant ring.',
   0,0,0,1, 1,1,17, 1151,'',0, 500000,1.0,1, 65535,65535,0, 0,0),

  (147963, 'Ascendant Earring Mold',
   'A masterwork mold used to shape an ascendant earring.',
   0,0,0,1, 1,1,17, 1151,'',0, 500000,1.0,1, 65535,65535,0, 0,0),

  (147964, 'Ascendant Necklace Mold',
   'A masterwork mold used to shape an ascendant necklace.',
   0,0,0,1, 1,1,17, 1151,'',0, 500000,1.0,1, 65535,65535,0, 0,0),

  (147965, 'Ascendant Face Mold',
   'A masterwork mold used to shape an ascendant face piece.',
   0,0,0,1, 1,1,17, 1151,'',0, 500000,1.0,1, 65535,65535,0, 0,0),

  (147966, 'Ascendant Belt Mold',
   'A masterwork mold used to shape an ascendant belt clasp.',
   0,0,0,1, 1,1,17, 1151,'',0, 500000,1.0,1, 65535,65535,0, 0,0),

  (147967, 'Ascendant Cloak Mold',
   'A masterwork mold used to shape an ascendant cloak clasp.',
   0,0,0,1, 1,1,17, 1151,'',0, 500000,1.0,1, 65535,65535,0, 0,0);

-- ============================================================
-- SETTING (T4) — vendor sold, salvages on Set Gem fail, 500pp
-- ============================================================
INSERT IGNORE INTO items
  (id, Name, lore, nodrop, norent, stackable, stacksize,
   weight, size, itemtype, icon, idfile, material,
   price, sellrate, tradeskills, classes, races, slots, reqlevel, reclevel)
VALUES
  (147968, 'Mithril Arcane Setting',
   'A mithril setting etched with arcane runes for a gem.',
   0,0,0,1, 1,1,17, 618,'',0, 500000,1.0,1, 65535,65535,0, 0,0);

-- ============================================================
-- INTERMEDIATES (T4)
-- Celestial chain: Raw → Carved → Radiant → Celestial Gem Setting
-- Arcane chain:    Core → Shaped → Luminous → Arcane Stone Setting
-- Metal chain:     Dust → Mithril Wire → Band/Frame/Chain
-- ============================================================
INSERT IGNORE INTO items
  (id, Name, lore, nodrop, norent, stackable, stacksize,
   weight, size, itemtype, icon, idfile, material,
   price, sellrate, tradeskills, classes, races, slots, reqlevel, reclevel)
VALUES
  (147969, 'Carved Celestial Gem',
   'A carefully carved celestial gem with a growing inner light.',
   0,0,1,20, 1,1,17, 959,'',0, 0,0,0, 65535,65535,0, 0,0),

  (147970, 'Radiant Celestial Gem',
   'A radiant celestial gem blazing with elemental energy.',
   0,0,1,20, 1,1,17, 959,'',0, 0,0,0, 65535,65535,0, 0,0),

  (147971, 'Celestial Gem Setting',
   'A radiant gem bound in mithril runes, ready for assembly.',
   0,0,1,20, 1,1,17, 618,'',0, 0,0,0, 65535,65535,0, 0,0),

  (147972, 'Shaped Arcane Stone',
   'A shaped arcane stone beginning to hum with power.',
   0,0,1,20, 1,1,17, 766,'',0, 0,0,0, 65535,65535,0, 0,0),

  (147973, 'Luminous Arcane Stone',
   'A luminous arcane stone radiating magical power.',
   0,0,1,20, 1,1,17, 766,'',0, 0,0,0, 65535,65535,0, 0,0),

  (147974, 'Arcane Stone Setting',
   'A luminous stone bound in mithril runes, ready for assembly.',
   0,0,1,20, 1,1,17, 618,'',0, 0,0,0, 65535,65535,0, 0,0),

  (147975, 'Mithril Wire',
   'A length of drawn mithril wire for ascendant jewelry.',
   0,0,1,20, 1,1,17, 1138,'',0, 0,0,0, 65535,65535,0, 0,0),

  (147976, 'Mithril Band',
   'A gleaming mithril band shaped for a ring.',
   0,0,1,20, 1,1,17, 1138,'',0, 0,0,0, 65535,65535,0, 0,0),

  (147977, 'Mithril Frame',
   'A gleaming mithril frame for earrings and face pieces.',
   0,0,1,20, 1,1,17, 1138,'',0, 0,0,0, 65535,65535,0, 0,0),

  (147978, 'Mithril Chain',
   'A gleaming mithril chain for necklace assembly.',
   0,0,1,20, 1,1,17, 1138,'',0, 0,0,0, 65535,65535,0, 0,0);

-- ============================================================
-- FINISHED ACCESSORIES (T4) — resists only
-- ============================================================
INSERT IGNORE INTO items
  (id, Name, lore, nodrop, norent, stackable,
   weight, size, itemtype, magic,
   MR, FR, CR, PR, DR,
   icon, idfile, material, sellrate, tradeskills,
   classes, races, slots, loregroup, reqlevel, reclevel)
VALUES
  (147979, 'Ascendant Celestial Ring',
   'A celestial gem in mithril, granting exceptional resistance.',
   0,0,0, 0,0,10,1,
   8,8,8,8,8,
   512,'',0, 0,0, 65535,65535,98304, 0, 0,0),

  (147980, 'Ascendant Celestial Earring',
   'A celestial gem in mithril, granting exceptional resistance.',
   0,0,0, 0,0,10,1,
   8,8,8,8,8,
   715,'',0, 0,0, 65535,65535,18, 0, 0,0),

  (147981, 'Ascendant Celestial Necklace',
   'A celestial gem pendant on a gleaming mithril chain.',
   0,0,0, 1,0,10,1,
   8,8,8,8,8,
   502,'',0, 0,0, 65535,65535,32, 0, 0,0),

  (147982, 'Ascendant Arcane Mask',
   'An arcane stone mithril mask of unrivaled magical protection.',
   0,0,0, 2,1,10,1,
   16,8,8,8,8,
   528,'',0, 0,0, 65535,65535,8, 0, 0,0),

  (147983, 'Ascendant Mithril Belt',
   'A mithril belt offering exceptional cold and poison resistance.',
   0,0,0, 2,2,10,1,
   0,0,8,8,0,
   503,'',0, 0,0, 65535,65535,1048576, 0, 0,0),

  (147984, 'Ascendant Arcane Cloak',
   'An arcane mithril cloak, the finest resist piece craftable.',
   0,0,0, 3,3,10,1,
   12,12,12,12,12,
   659,'',0, 0,0, 65535,65535,256, 0, 0,0);

-- ============================================================
-- RECIPES (T4)
-- tradeskill=61 (Jewelry Making), trivial range 145–200
-- ============================================================
INSERT IGNORE INTO tradeskill_recipe (id, name, tradeskill, skillneeded, trivial, nofail) VALUES
  (31424, 'Carved Celestial Gem',       61, 0, 150, 0),
  (31425, 'Shaped Arcane Stone',        61, 0, 150, 0),
  (31426, 'Mithril Wire',               61, 0, 158, 0),
  (31427, 'Radiant Celestial Gem',      61, 0, 168, 0),
  (31428, 'Luminous Arcane Stone',      61, 0, 168, 0),
  (31429, 'Mithril Band',               61, 0, 172, 0),
  (31430, 'Mithril Frame',              61, 0, 172, 0),
  (31431, 'Mithril Chain',              61, 0, 176, 0),
  (31432, 'Celestial Gem Setting',      61, 0, 180, 0),
  (31433, 'Arcane Stone Setting',       61, 0, 180, 0),
  (31434, 'Ascendant Celestial Earring',61, 0, 188, 0),
  (31435, 'Ascendant Celestial Ring',   61, 0, 188, 0),
  (31436, 'Ascendant Arcane Mask',      61, 0, 192, 0),
  (31437, 'Ascendant Celestial Necklace',61,0, 195, 0),
  (31438, 'Ascendant Mithril Belt',     61, 0, 197, 0),
  (31439, 'Ascendant Arcane Cloak',     61, 0, 200, 0);

-- ============================================================
-- RECIPE ENTRIES (T4)
-- ============================================================

-- 31424: Carved Celestial Gem
-- 2× Raw Celestial Gem + 1× Prime Gem Polish → Carved Celestial Gem
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31424,147872,0,0,0,0,1),
  (31424,147969,1,0,0,0,0),
  (31424,147956,0,0,2,0,0),
  (31424,147959,0,0,1,0,0);

-- 31425: Shaped Arcane Stone
-- 2× Arcane Stone Core + 1× Prime Gem Polish → Shaped Arcane Stone
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31425,147872,0,0,0,0,1),
  (31425,147972,1,0,0,0,0),
  (31425,147957,0,0,2,0,0),
  (31425,147959,0,0,1,0,0);

-- 31426: Mithril Wire
-- 2× Mithril Dust + 1× Prime Celestial Flux (147642) → Mithril Wire
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31426,147872,0,0,0,0,1),
  (31426,147975,1,0,0,0,0),
  (31426,147958,0,0,2,0,0),
  (31426,147642,0,0,1,0,0);

-- 31427: Radiant Celestial Gem
-- 2× Carved Celestial Gem + 1× Prime Gem Polish → Radiant Celestial Gem
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31427,147872,0,0,0,0,1),
  (31427,147970,1,0,0,0,0),
  (31427,147969,0,0,2,0,0),
  (31427,147959,0,0,1,0,0);

-- 31428: Luminous Arcane Stone
-- 2× Shaped Arcane Stone + 1× Prime Gem Polish → Luminous Arcane Stone
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31428,147872,0,0,0,0,1),
  (31428,147973,1,0,0,0,0),
  (31428,147972,0,0,2,0,0),
  (31428,147959,0,0,1,0,0);

-- 31429: Mithril Band
-- 1× Mithril Wire → Mithril Band
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31429,147872,0,0,0,0,1),
  (31429,147976,1,0,0,0,0),
  (31429,147975,0,0,1,0,0);

-- 31430: Mithril Frame
-- 1× Mithril Wire → Mithril Frame
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31430,147872,0,0,0,0,1),
  (31430,147977,1,0,0,0,0),
  (31430,147975,0,0,1,0,0);

-- 31431: Mithril Chain
-- 2× Mithril Wire → Mithril Chain
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31431,147872,0,0,0,0,1),
  (31431,147978,1,0,0,0,0),
  (31431,147975,0,0,2,0,0);

-- 31432: Celestial Gem Setting
-- 1× Radiant Celestial Gem + 1× Mithril Arcane Setting (salvages) → Celestial Gem Setting
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31432,147872,0,0,0,0,1),
  (31432,147971,1,0,0,0,0),
  (31432,147970,0,0,1,0,0),
  (31432,147968,0,0,1,1,0);

-- 31433: Arcane Stone Setting
-- 1× Luminous Arcane Stone + 1× Mithril Arcane Setting (salvages) → Arcane Stone Setting
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31433,147872,0,0,0,0,1),
  (31433,147974,1,0,0,0,0),
  (31433,147973,0,0,1,0,0),
  (31433,147968,0,0,1,1,0);

-- 31434: Ascendant Celestial Earring
-- 1× Celestial Gem Setting + 1× Mithril Frame
-- + 1× Ascendant Earring Mold (salvages) + 1× Prime Gem Polish → Earring
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31434,147872,0,0,0,0,1),
  (31434,147980,1,0,0,0,0),
  (31434,147971,0,0,1,0,0),
  (31434,147977,0,0,1,0,0),
  (31434,147963,0,0,1,1,0),
  (31434,147959,0,0,1,0,0);

-- 31435: Ascendant Celestial Ring
-- 1× Celestial Gem Setting + 1× Mithril Band
-- + 1× Ascendant Ring Mold (salvages) + 1× Prime Gem Polish → Ring
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31435,147872,0,0,0,0,1),
  (31435,147979,1,0,0,0,0),
  (31435,147971,0,0,1,0,0),
  (31435,147976,0,0,1,0,0),
  (31435,147962,0,0,1,1,0),
  (31435,147959,0,0,1,0,0);

-- 31436: Ascendant Arcane Mask
-- 1× Arcane Stone Setting + 1× Mithril Frame
-- + 1× Ascendant Face Mold (salvages) + 1× Prime Gem Polish → Mask
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31436,147872,0,0,0,0,1),
  (31436,147982,1,0,0,0,0),
  (31436,147974,0,0,1,0,0),
  (31436,147977,0,0,1,0,0),
  (31436,147965,0,0,1,1,0),
  (31436,147959,0,0,1,0,0);

-- 31437: Ascendant Celestial Necklace
-- 1× Celestial Gem Setting + 1× Mithril Chain
-- + 1× Ascendant Necklace Mold (salvages) + 1× Prime Gem Polish → Necklace
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31437,147872,0,0,0,0,1),
  (31437,147981,1,0,0,0,0),
  (31437,147971,0,0,1,0,0),
  (31437,147978,0,0,1,0,0),
  (31437,147964,0,0,1,1,0),
  (31437,147959,0,0,1,0,0);

-- 31438: Ascendant Mithril Belt
-- 3× Mithril Wire + 1× Ascendant Chain Clasp
-- + 1× Ascendant Belt Mold (salvages) + 1× Prime Celestial Flux → Belt
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31438,147872,0,0,0,0,1),
  (31438,147983,1,0,0,0,0),
  (31438,147975,0,0,3,0,0),
  (31438,147960,0,0,1,0,0),
  (31438,147966,0,0,1,1,0),
  (31438,147642,0,0,1,0,0);

-- 31439: Ascendant Arcane Cloak
-- 1× Luminous Arcane Stone + 2× Mithril Wire + 1× Mithril Gem Clasp
-- + 1× Ascendant Cloak Mold (salvages) + 1× Prime Gem Polish → Cloak
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31439,147872,0,0,0,0,1),
  (31439,147984,1,0,0,0,0),
  (31439,147973,0,0,1,0,0),
  (31439,147975,0,0,2,0,0),
  (31439,147961,0,0,1,0,0),
  (31439,147967,0,0,1,1,0),
  (31439,147959,0,0,1,0,0);

-- ============================================================
-- MERCHANT LIST (T4) — Gem Merchant (list 1000028), slots 24–31
-- ============================================================
INSERT IGNORE INTO merchantlist (merchantid, slot, item) VALUES
  (1000028, 24, 147962),  -- Ascendant Ring Mold    500pp
  (1000028, 25, 147963),  -- Ascendant Earring Mold 500pp
  (1000028, 26, 147964),  -- Ascendant Necklace Mold 500pp
  (1000028, 27, 147965),  -- Ascendant Face Mold    500pp
  (1000028, 28, 147966),  -- Ascendant Belt Mold    500pp
  (1000028, 29, 147967),  -- Ascendant Cloak Mold   500pp
  (1000028, 30, 147968),  -- Mithril Arcane Setting 500pp
  (1000028, 31, 147959);  -- Prime Gem Polish       500pp

-- ============================================================
-- LOOT TABLE INTEGRATION (T4)
-- Appended to loottable 111006
-- (Wall of Slaughter, Riftseekers', Proving Grounds, Chambers)
-- ============================================================
INSERT IGNORE INTO lootdrop (id, name) VALUES
  (992066, 'lap_t4_raw_celestial_gem'),
  (992067, 'lap_t4_arcane_stone_core'),
  (992068, 'lap_t4_mithril_dust'),
  (992069, 'lap_t4_prime_gem_polish'),
  (992070, 'lap_t4_ascendant_chain_clasp'),
  (992071, 'lap_t4_mithril_gem_clasp');

INSERT IGNORE INTO lootdrop_entries (lootdrop_id, item_id, item_charges, equip_item, chance) VALUES
  (992066, 147956, 1, 0, 15),  -- Raw Celestial Gem      15%
  (992067, 147957, 1, 0, 10),  -- Arcane Stone Core      10%
  (992068, 147958, 1, 0, 15),  -- Mithril Dust           15%
  (992069, 147959, 1, 0, 10),  -- Prime Gem Polish       10%
  (992070, 147960, 1, 0,  5),  -- Ascendant Chain Clasp   5%
  (992071, 147961, 1, 0,  5);  -- Mithril Gem Clasp       5%

INSERT IGNORE INTO loottable_entries (loottable_id, lootdrop_id, multiplier, droplimit, mindrop, probability) VALUES
  (111006, 992066, 1, 1, 0, 100),
  (111006, 992067, 1, 1, 0, 100),
  (111006, 992068, 1, 1, 0, 100),
  (111006, 992069, 1, 1, 0, 100),
  (111006, 992070, 1, 1, 0, 100),
  (111006, 992071, 1, 1, 0, 100);
