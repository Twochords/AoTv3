-- Lapidary: Tier 1 — Weathered
-- Tradeskill: 61 (Jewelry Making)
-- Container: Lapidary's Workbench (item 147872, world object 228458)
--
-- Item IDs:
--   Drop items   : 147873–147877
--   Molds (T1)   : 147878–147883
--   Setting (T1) : 147884
--   Intermediates: 147885–147891
--   Accessories  : 147892–147897
-- Recipe IDs     : 31379–31391
-- Lootdrop IDs   : 992049–992053 (appended to loottable 111003)
-- Merchant list  : 1000028 (Gem Merchant, NPC 760142), slots 0–7

-- ============================================================
-- DROP ITEMS (T1)
-- nodrop=0 norent=0 (freely tradeable), stackable, stacksize=20
-- ============================================================
INSERT IGNORE INTO items
  (id, Name, lore, nodrop, norent, stackable, stacksize,
   weight, size, itemtype, icon, idfile, material,
   price, sellrate, tradeskills, classes, races, slots, reqlevel, reclevel)
VALUES
  (147873, 'Dull Stone Chip',
   'A rough uncut stone salvaged from fallen creatures.',
   0,0,1,20, 1,1,17, 959,'',0, 0,0,1, 65535,65535,0, 0,0),

  (147874, 'Tarnished Copper Flake',
   'A tarnished flake of copper useful for jewelry crafting.',
   0,0,1,20, 1,1,17, 1031,'',0, 0,0,1, 65535,65535,0, 0,0),

  (147875, 'Minor Gem Polish',
   'A weak polishing compound used to refine and set raw stones.',
   0,0,1,20, 1,1,17, 706,'',0, 5000,1.0,1, 65535,65535,0, 0,0),

  (147876, 'Crude Chain Clasp',
   'A crude copper clasp used to fasten a belt.',
   0,0,1,20, 1,1,17, 752,'',0, 0,0,1, 65535,65535,0, 0,0),

  (147877, 'Crude Gem Clasp',
   'A crude clasp with a gem inlay socket used to secure a cloak.',
   0,0,1,20, 1,1,17, 618,'',0, 0,0,1, 65535,65535,0, 0,0);

-- ============================================================
-- MOLDS (T1) — vendor sold, salvage on combine fail, 5pp each
-- ============================================================
INSERT IGNORE INTO items
  (id, Name, lore, nodrop, norent, stackable, stacksize,
   weight, size, itemtype, icon, idfile, material,
   price, sellrate, tradeskills, classes, races, slots, reqlevel, reclevel)
VALUES
  (147878, 'Weathered Ring Mold',
   'A worn mold used to shape a ring.',
   0,0,0,1, 1,1,17, 1151,'',0, 5000,1.0,1, 65535,65535,0, 0,0),

  (147879, 'Weathered Earring Mold',
   'A worn mold used to shape an earring.',
   0,0,0,1, 1,1,17, 1151,'',0, 5000,1.0,1, 65535,65535,0, 0,0),

  (147880, 'Weathered Necklace Mold',
   'A worn mold used to shape a necklace.',
   0,0,0,1, 1,1,17, 1151,'',0, 5000,1.0,1, 65535,65535,0, 0,0),

  (147881, 'Weathered Face Mold',
   'A worn mold used to shape a face piece.',
   0,0,0,1, 1,1,17, 1151,'',0, 5000,1.0,1, 65535,65535,0, 0,0),

  (147882, 'Weathered Belt Mold',
   'A worn mold used to shape a belt clasp.',
   0,0,0,1, 1,1,17, 1151,'',0, 5000,1.0,1, 65535,65535,0, 0,0),

  (147883, 'Weathered Cloak Mold',
   'A worn mold used to shape a cloak clasp.',
   0,0,0,1, 1,1,17, 1151,'',0, 5000,1.0,1, 65535,65535,0, 0,0);

-- ============================================================
-- SETTING (T1) — vendor sold, salvages on Set Gem fail, 5pp
-- ============================================================
INSERT IGNORE INTO items
  (id, Name, lore, nodrop, norent, stackable, stacksize,
   weight, size, itemtype, icon, idfile, material,
   price, sellrate, tradeskills, classes, races, slots, reqlevel, reclevel)
VALUES
  (147884, 'Bent Copper Setting',
   'A crude copper jewelry setting for holding a polished gem.',
   0,0,0,1, 1,1,17, 618,'',0, 5000,1.0,1, 65535,65535,0, 0,0);

-- ============================================================
-- INTERMEDIATES (T1) — not vendor sold
-- ============================================================
INSERT IGNORE INTO items
  (id, Name, lore, nodrop, norent, stackable, stacksize,
   weight, size, itemtype, icon, idfile, material,
   price, sellrate, tradeskills, classes, races, slots, reqlevel, reclevel)
VALUES
  (147885, 'Chipped Quartz',
   'A roughly cut stone, still dull but beginning to take shape.',
   0,0,1,20, 1,1,17, 953,'',0, 0,0,0, 65535,65535,0, 0,0),

  (147886, 'Polished Stone',
   'A carefully polished stone with a faint gleam.',
   0,0,1,20, 1,1,17, 959,'',0, 0,0,0, 65535,65535,0, 0,0),

  (147887, 'Rough Stone Setting',
   'A polished stone secured in a copper setting, ready for assembly.',
   0,0,1,20, 1,1,17, 618,'',0, 0,0,0, 65535,65535,0, 0,0),

  (147888, 'Hammered Copper Strip',
   'A strip of hammered copper for use in jewelry.',
   0,0,1,20, 1,1,17, 1031,'',0, 0,0,0, 65535,65535,0, 0,0),

  (147889, 'Crude Copper Band',
   'A rough copper band shaped for a ring.',
   0,0,1,20, 1,1,17, 1031,'',0, 0,0,0, 65535,65535,0, 0,0),

  (147890, 'Crude Copper Frame',
   'A rough copper frame used for earrings and face pieces.',
   0,0,1,20, 1,1,17, 1031,'',0, 0,0,0, 65535,65535,0, 0,0),

  (147891, 'Crude Copper Chain',
   'A crude copper chain for necklace assembly.',
   0,0,1,20, 1,1,17, 1031,'',0, 0,0,0, 65535,65535,0, 0,0);

-- ============================================================
-- FINISHED ACCESSORIES (T1)
-- All tiers: MR/FR/CR/PR/DR scaling, secondary stat per slot
-- T1: all resists +1 (standard), Face MR+2, Belt CR+PR only, Cloak all +2
-- ============================================================
INSERT IGNORE INTO items
  (id, Name, lore, nodrop, norent, stackable,
   weight, size, itemtype, magic,
   MR, FR, CR, PR, DR,
   icon, idfile, material, sellrate, tradeskills,
   classes, races, slots, loregroup, reqlevel, reclevel)
VALUES
  (147892, 'Weathered Stone Ring',
   'A rough stone ring offering modest protection against the elements.',
   0,0,0, 0,0,10,1,
   1,1,1,1,1,
   512,'',0, 0,0, 65535,65535,98304, 0, 0,0),

  (147893, 'Weathered Stone Earring',
   'A rough stone earring offering modest protection against the elements.',
   0,0,0, 0,0,10,1,
   1,1,1,1,1,
   715,'',0, 0,0, 65535,65535,18, 0, 0,0),

  (147894, 'Weathered Stone Necklace',
   'A rough stone pendant hanging on a crude copper chain.',
   0,0,0, 1,0,10,1,
   1,1,1,1,1,
   502,'',0, 0,0, 65535,65535,32, 0, 0,0),

  (147895, 'Weathered Stone Mask',
   'A crude stone mask offering heightened magical protection.',
   0,0,0, 2,1,10,1,
   2,1,1,1,1,
   528,'',0, 0,0, 65535,65535,8, 0, 0,0),

  (147896, 'Weathered Copper Belt',
   'A crude copper belt offering resistance to cold and poison.',
   0,0,0, 2,2,10,1,
   0,0,1,1,0,
   503,'',0, 0,0, 65535,65535,1048576, 0, 0,0),

  (147897, 'Weathered Stone Cloak',
   'A stone-clasped cloak providing the strongest resist coverage at this tier.',
   0,0,0, 3,3,10,1,
   2,2,2,2,2,
   659,'',0, 0,0, 65535,65535,256, 0, 0,0);

-- ============================================================
-- RECIPES (T1)
-- tradeskill=61 (Jewelry Making), skillneeded=0
-- ============================================================
INSERT IGNORE INTO tradeskill_recipe (id, name, tradeskill, skillneeded, trivial, nofail) VALUES
  (31379, 'Chipped Quartz',          61, 0, 25,  0),
  (31380, 'Hammered Copper Strip',   61, 0, 30,  0),
  (31381, 'Polished Stone',          61, 0, 40,  0),
  (31382, 'Crude Copper Band',       61, 0, 45,  0),
  (31383, 'Crude Copper Frame',      61, 0, 45,  0),
  (31384, 'Crude Copper Chain',      61, 0, 50,  0),
  (31385, 'Rough Stone Setting',     61, 0, 55,  0),
  (31386, 'Weathered Stone Earring', 61, 0, 65,  0),
  (31387, 'Weathered Stone Ring',    61, 0, 65,  0),
  (31388, 'Weathered Stone Mask',    61, 0, 70,  0),
  (31389, 'Weathered Stone Necklace',61, 0, 75,  0),
  (31390, 'Weathered Copper Belt',   61, 0, 80,  0),
  (31391, 'Weathered Stone Cloak',   61, 0, 100, 0);

-- ============================================================
-- RECIPE ENTRIES (T1)
-- Container row = Lapidary's Workbench (item 147872), all zeros
-- successcount=1 for output; componentcount=N for ingredients
-- salvagecount=1 for mold/setting (returned to player on fail)
-- ============================================================

-- 31379: Chipped Quartz
-- 2× Dull Stone Chip + 1× Minor Gem Polish → Chipped Quartz
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31379,147872,0,0,0,0,1),
  (31379,147885,1,0,0,0,0),
  (31379,147873,0,0,2,0,0),
  (31379,147875,0,0,1,0,0);

-- 31380: Hammered Copper Strip
-- 2× Tarnished Copper Flake + 1× Minor Tempering Flux (147506, shared) → Strip
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31380,147872,0,0,0,0,1),
  (31380,147888,1,0,0,0,0),
  (31380,147874,0,0,2,0,0),
  (31380,147506,0,0,1,0,0);

-- 31381: Polished Stone
-- 2× Chipped Quartz + 1× Minor Gem Polish → Polished Stone
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31381,147872,0,0,0,0,1),
  (31381,147886,1,0,0,0,0),
  (31381,147885,0,0,2,0,0),
  (31381,147875,0,0,1,0,0);

-- 31382: Crude Copper Band
-- 1× Hammered Copper Strip → Crude Copper Band
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31382,147872,0,0,0,0,1),
  (31382,147889,1,0,0,0,0),
  (31382,147888,0,0,1,0,0);

-- 31383: Crude Copper Frame
-- 1× Hammered Copper Strip → Crude Copper Frame
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31383,147872,0,0,0,0,1),
  (31383,147890,1,0,0,0,0),
  (31383,147888,0,0,1,0,0);

-- 31384: Crude Copper Chain
-- 2× Hammered Copper Strip → Crude Copper Chain
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31384,147872,0,0,0,0,1),
  (31384,147891,1,0,0,0,0),
  (31384,147888,0,0,2,0,0);

-- 31385: Rough Stone Setting
-- 1× Polished Stone + 1× Bent Copper Setting (salvages on fail) → Rough Stone Setting
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31385,147872,0,0,0,0,1),
  (31385,147887,1,0,0,0,0),
  (31385,147886,0,0,1,0,0),
  (31385,147884,0,0,1,1,0);

-- 31386: Weathered Stone Earring
-- 1× Rough Stone Setting + 1× Crude Copper Frame
-- + 1× Weathered Earring Mold (salvages) + 1× Minor Gem Polish → Earring
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31386,147872,0,0,0,0,1),
  (31386,147893,1,0,0,0,0),
  (31386,147887,0,0,1,0,0),
  (31386,147890,0,0,1,0,0),
  (31386,147879,0,0,1,1,0),
  (31386,147875,0,0,1,0,0);

-- 31387: Weathered Stone Ring
-- 1× Rough Stone Setting + 1× Crude Copper Band
-- + 1× Weathered Ring Mold (salvages) + 1× Minor Gem Polish → Ring
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31387,147872,0,0,0,0,1),
  (31387,147892,1,0,0,0,0),
  (31387,147887,0,0,1,0,0),
  (31387,147889,0,0,1,0,0),
  (31387,147878,0,0,1,1,0),
  (31387,147875,0,0,1,0,0);

-- 31388: Weathered Stone Mask
-- 1× Rough Stone Setting + 1× Crude Copper Frame
-- + 1× Weathered Face Mold (salvages) + 1× Minor Gem Polish → Mask
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31388,147872,0,0,0,0,1),
  (31388,147895,1,0,0,0,0),
  (31388,147887,0,0,1,0,0),
  (31388,147890,0,0,1,0,0),
  (31388,147881,0,0,1,1,0),
  (31388,147875,0,0,1,0,0);

-- 31389: Weathered Stone Necklace
-- 1× Rough Stone Setting + 1× Crude Copper Chain
-- + 1× Weathered Necklace Mold (salvages) + 1× Minor Gem Polish → Necklace
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31389,147872,0,0,0,0,1),
  (31389,147894,1,0,0,0,0),
  (31389,147887,0,0,1,0,0),
  (31389,147891,0,0,1,0,0),
  (31389,147880,0,0,1,1,0),
  (31389,147875,0,0,1,0,0);

-- 31390: Weathered Copper Belt
-- 3× Hammered Copper Strip + 1× Crude Chain Clasp
-- + 1× Weathered Belt Mold (salvages) + 1× Minor Tempering Flux (shared) → Belt
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31390,147872,0,0,0,0,1),
  (31390,147896,1,0,0,0,0),
  (31390,147888,0,0,3,0,0),
  (31390,147876,0,0,1,0,0),
  (31390,147882,0,0,1,1,0),
  (31390,147506,0,0,1,0,0);

-- 31391: Weathered Stone Cloak
-- 1× Polished Stone + 2× Hammered Copper Strip + 1× Crude Gem Clasp
-- + 1× Weathered Cloak Mold (salvages) + 1× Minor Gem Polish → Cloak
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31391,147872,0,0,0,0,1),
  (31391,147897,1,0,0,0,0),
  (31391,147886,0,0,1,0,0),
  (31391,147888,0,0,2,0,0),
  (31391,147877,0,0,1,0,0),
  (31391,147883,0,0,1,1,0),
  (31391,147875,0,0,1,0,0);

-- ============================================================
-- MERCHANT LIST (T1) — Gem Merchant (NPC 760142, list 1000028)
-- Slots 0–7; T2–T4 will use slots 8–31 as tiers are added
-- ============================================================
INSERT IGNORE INTO merchantlist (merchantid, slot, item) VALUES
  (1000028, 0, 147878),  -- Weathered Ring Mold    5pp
  (1000028, 1, 147879),  -- Weathered Earring Mold 5pp
  (1000028, 2, 147880),  -- Weathered Necklace Mold 5pp
  (1000028, 3, 147881),  -- Weathered Face Mold    5pp
  (1000028, 4, 147882),  -- Weathered Belt Mold    5pp
  (1000028, 5, 147883),  -- Weathered Cloak Mold   5pp
  (1000028, 6, 147884),  -- Bent Copper Setting     5pp
  (1000028, 7, 147875);  -- Minor Gem Polish        5pp

-- ============================================================
-- LOOT TABLE INTEGRATION (T1)
-- Appended as independent lootdrop groups to loottable 111003
-- (Dranik's Scar, Nobles' Causeway — shared with armor/weapon drops)
-- ============================================================
INSERT IGNORE INTO lootdrop (id, name) VALUES
  (992049, 'lap_t1_dull_stone_chip'),
  (992050, 'lap_t1_tarnished_copper_flake'),
  (992051, 'lap_t1_minor_gem_polish'),
  (992052, 'lap_t1_crude_chain_clasp'),
  (992053, 'lap_t1_crude_gem_clasp');

INSERT IGNORE INTO lootdrop_entries (lootdrop_id, item_id, item_charges, equip_item, chance) VALUES
  (992049, 147873, 1, 0, 15),  -- Dull Stone Chip       15%
  (992050, 147874, 1, 0, 15),  -- Tarnished Copper Flake 15%
  (992051, 147875, 1, 0, 10),  -- Minor Gem Polish       10%
  (992052, 147876, 1, 0,  5),  -- Crude Chain Clasp       5%
  (992053, 147877, 1, 0,  5);  -- Crude Gem Clasp         5%

INSERT IGNORE INTO loottable_entries (loottable_id, lootdrop_id, multiplier, droplimit, mindrop, probability) VALUES
  (111003, 992049, 1, 1, 0, 100),
  (111003, 992050, 1, 1, 0, 100),
  (111003, 992051, 1, 1, 0, 100),
  (111003, 992052, 1, 1, 0, 100),
  (111003, 992053, 1, 1, 0, 100);
