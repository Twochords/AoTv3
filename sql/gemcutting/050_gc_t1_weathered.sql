-- Gem Cutting: Tier 1 — Weathered
-- Tradeskill: 61 (Jewelry Making), Container: Gem Cutting Station (item 147985)
-- Two augment lines: Vitality (HP, Garnet) and Clarity (Mana, Aquamarine)
-- Shared catalysts: Minor Gem Polish (147875, from Lapidary T1)
--
-- Item IDs:
--   Drop items   : 147986–147987
--   Grindstone   : 147988
--   Setting      : 147989
--   Intermediates: 147990–147993
--   Augments     : 147994–147995
-- Recipe IDs     : 31440–31445
-- Lootdrop IDs   : 992072–992073 (appended to loottable 111003)
-- Merchant list  : 1000029 (Gem Cutter, NPC 760143), slots 0–1 (grindstone + setting)

-- ============================================================
-- DROP ITEMS (T1)
-- ============================================================
INSERT IGNORE INTO items
  (id, Name, lore, nodrop, norent, stackable, stacksize,
   weight, size, itemtype, icon, idfile, material,
   price, sellrate, tradeskills, classes, races, slots, reqlevel, reclevel)
VALUES
  (147986, 'Rough Garnet',
   'A rough red stone used in vitality augment crafting.',
   0,0,1,20, 1,1,17, 961,'',0, 0,0,1, 65535,65535,0, 0,0),

  (147987, 'Rough Aquamarine',
   'A rough blue stone used in clarity augment crafting.',
   0,0,1,20, 1,1,17, 963,'',0, 0,0,1, 65535,65535,0, 0,0);

-- ============================================================
-- GRINDSTONE (T1) — vendor sold, consumed in cut step
-- ============================================================
INSERT IGNORE INTO items
  (id, Name, lore, nodrop, norent, stackable, stacksize,
   weight, size, itemtype, icon, idfile, material,
   price, sellrate, tradeskills, classes, races, slots, reqlevel, reclevel)
VALUES
  (147988, 'Minor Gem Grindstone',
   'A coarse grinding stone for shaping rough gems.',
   0,0,1,20, 1,1,17, 1075,'',0, 5000,1.0,1, 65535,65535,0, 0,0);

-- ============================================================
-- AUGMENT SETTING (T1) — vendor sold, salvages on fail
-- ============================================================
INSERT IGNORE INTO items
  (id, Name, lore, nodrop, norent, stackable, stacksize,
   weight, size, itemtype, icon, idfile, material,
   price, sellrate, tradeskills, classes, races, slots, reqlevel, reclevel)
VALUES
  (147989, 'Crude Augment Setting',
   'A crude metal setting used to mount a gem for augmentation.',
   0,0,0,1, 1,1,17, 618,'',0, 5000,1.0,1, 65535,65535,0, 0,0);

-- ============================================================
-- INTERMEDIATES (T1)
-- ============================================================
INSERT IGNORE INTO items
  (id, Name, lore, nodrop, norent, stackable, stacksize,
   weight, size, itemtype, icon, idfile, material,
   price, sellrate, tradeskills, classes, races, slots, reqlevel, reclevel)
VALUES
  (147990, 'Faceted Garnet',
   'A roughly faceted garnet showing its red depth.',
   0,0,1,20, 1,1,17, 961,'',0, 0,0,0, 65535,65535,0, 0,0),

  (147991, 'Polished Garnet',
   'A polished garnet with a deep red gleam.',
   0,0,1,20, 1,1,17, 961,'',0, 0,0,0, 65535,65535,0, 0,0),

  (147992, 'Faceted Aquamarine',
   'A roughly faceted aquamarine showing its blue clarity.',
   0,0,1,20, 1,1,17, 963,'',0, 0,0,0, 65535,65535,0, 0,0),

  (147993, 'Polished Aquamarine',
   'A polished aquamarine with a clear blue gleam.',
   0,0,1,20, 1,1,17, 963,'',0, 0,0,0, 65535,65535,0, 0,0);

-- ============================================================
-- FINISHED AUGMENTS (T1)
-- itemtype=54 (augment), augtype=512 (bit_AugTypeCraftedCommon, slot 10)
-- augrestrict=0 — fits armor, weapons, and accessories equally
-- augdistiller=0 — no distiller required
-- slots=2097150 — all equip slots except Charm (bits 1-20)
-- T1: +10 HP (Vitality), +10 Mana (Clarity)
-- ============================================================
INSERT IGNORE INTO items
  (id, Name, lore, nodrop, norent, stackable,
   weight, size, itemtype, magic,
   hp, mana, augtype, augrestrict, augdistiller,
   icon, idfile, material, sellrate, tradeskills,
   classes, races, slots, reqlevel, reclevel)
VALUES
  (147994, 'Weathered Garnet of Vitality',
   'A garnet augment granting a modest bonus to hit points.',
   0,0,0, 0,0,54,1,
   10,0, 512,0,0,
   961,'',0, 0,0, 65535,65535,2097150, 0,0),

  (147995, 'Weathered Aquamarine of Clarity',
   'An aquamarine augment granting a modest bonus to mana.',
   0,0,0, 0,0,54,1,
   0,10, 512,0,0,
   963,'',0, 0,0, 65535,65535,2097150, 0,0);

-- Fix for already-applied installs: update slots to include Primary+Secondary weapon slots
UPDATE items SET slots=2097150 WHERE id IN (147994, 147995);

-- ============================================================
-- RECIPES (T1)
-- tradeskill=61 (Jewelry Making)
-- ============================================================
INSERT IGNORE INTO tradeskill_recipe (id, name, tradeskill, skillneeded, trivial, nofail) VALUES
  (31440, 'Faceted Garnet',                  61, 0, 25, 0),
  (31441, 'Faceted Aquamarine',              61, 0, 25, 0),
  (31442, 'Polished Garnet',                 61, 0, 40, 0),
  (31443, 'Polished Aquamarine',             61, 0, 40, 0),
  (31444, 'Weathered Garnet of Vitality',    61, 0, 60, 0),
  (31445, 'Weathered Aquamarine of Clarity', 61, 0, 60, 0);

-- ============================================================
-- RECIPE ENTRIES (T1)
-- Container = Gem Cutting Station (item 147985), iscontainer=1
-- Setting salvages on fail (salvagecount=1)
-- ============================================================

-- 31440: Faceted Garnet
-- 2× Rough Garnet + 1× Minor Gem Grindstone → Faceted Garnet
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31440,147985,0,0,0,0,1),
  (31440,147990,1,0,0,0,0),
  (31440,147986,0,0,2,0,0),
  (31440,147988,0,0,1,0,0);

-- 31441: Faceted Aquamarine
-- 2× Rough Aquamarine + 1× Minor Gem Grindstone → Faceted Aquamarine
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31441,147985,0,0,0,0,1),
  (31441,147992,1,0,0,0,0),
  (31441,147987,0,0,2,0,0),
  (31441,147988,0,0,1,0,0);

-- 31442: Polished Garnet
-- 2× Faceted Garnet + 1× Minor Gem Polish (147875, shared Lapidary) → Polished Garnet
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31442,147985,0,0,0,0,1),
  (31442,147991,1,0,0,0,0),
  (31442,147990,0,0,2,0,0),
  (31442,147875,0,0,1,0,0);

-- 31443: Polished Aquamarine
-- 2× Faceted Aquamarine + 1× Minor Gem Polish → Polished Aquamarine
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31443,147985,0,0,0,0,1),
  (31443,147993,1,0,0,0,0),
  (31443,147992,0,0,2,0,0),
  (31443,147875,0,0,1,0,0);

-- 31444: Weathered Garnet of Vitality
-- 1× Polished Garnet + 1× Crude Augment Setting (salvages) → Augment
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31444,147985,0,0,0,0,1),
  (31444,147994,1,0,0,0,0),
  (31444,147991,0,0,1,0,0),
  (31444,147989,0,0,1,1,0);

-- 31445: Weathered Aquamarine of Clarity
-- 1× Polished Aquamarine + 1× Crude Augment Setting (salvages) → Augment
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31445,147985,0,0,0,0,1),
  (31445,147995,1,0,0,0,0),
  (31445,147993,0,0,1,0,0),
  (31445,147989,0,0,1,1,0);
