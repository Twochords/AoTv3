-- Gem Cutting: Tier 3 — Tempered
-- Tradeskill: 61 (Jewelry Making), Container: Gem Cutting Station (item 147985)
-- Shared gem polish: Superior Gem Polish (147930, from Lapidary T3)
--
-- Item IDs:
--   Drop items   : 148006–148007
--   Grindstone   : 148008
--   Setting      : 148009
--   Intermediates: 148010–148013
--   Augments     : 148014–148015
-- Recipe IDs     : 31452–31457
-- Lootdrop IDs   : 992076–992077 (appended to loottable 111005)
-- Merchant list  : 1000029 (Gem Cutter, NPC 760143), see 054_gc_merchant.sql

-- ============================================================
-- DROP ITEMS (T3)
-- ============================================================
INSERT IGNORE INTO items
  (id, Name, lore, nodrop, norent, stackable, stacksize,
   weight, size, itemtype, icon, idfile, material,
   price, sellrate, tradeskills, classes, races, slots, reqlevel, reclevel)
VALUES
  (148006, 'Deep Garnet Crystal',
   'A rich garnet crystal dropped in the Catacombs, Hollows, and Harbinger''s Spire.',
   0,0,1,20, 1,1,17, 961,'',0, 0,0,1, 65535,65535,0, 0,0),

  (148007, 'Deep Aquamarine Crystal',
   'A vivid aquamarine crystal dropped in the deeper Dranik zones.',
   0,0,1,20, 1,1,17, 963,'',0, 0,0,1, 65535,65535,0, 0,0);

-- ============================================================
-- GRINDSTONE (T3) — vendor sold, consumed in cut step
-- ============================================================
INSERT IGNORE INTO items
  (id, Name, lore, nodrop, norent, stackable, stacksize,
   weight, size, itemtype, icon, idfile, material,
   price, sellrate, tradeskills, classes, races, slots, reqlevel, reclevel)
VALUES
  (148008, 'Superior Gem Grindstone',
   'A fine-grit grinding stone for shaping tempered-tier gems.',
   0,0,1,20, 1,1,17, 1075,'',0, 100000,1.0,1, 65535,65535,0, 0,0);

-- ============================================================
-- AUGMENT SETTING (T3) — vendor sold, salvages on fail
-- ============================================================
INSERT IGNORE INTO items
  (id, Name, lore, nodrop, norent, stackable, stacksize,
   weight, size, itemtype, icon, idfile, material,
   price, sellrate, tradeskills, classes, races, slots, reqlevel, reclevel)
VALUES
  (148009, 'Refined Augment Setting',
   'A refined metal setting for mounting a tempered-tier gem.',
   0,0,0,1, 1,1,17, 618,'',0, 100000,1.0,1, 65535,65535,0, 0,0);

-- ============================================================
-- INTERMEDIATES (T3)
-- ============================================================
INSERT IGNORE INTO items
  (id, Name, lore, nodrop, norent, stackable, stacksize,
   weight, size, itemtype, icon, idfile, material,
   price, sellrate, tradeskills, classes, races, slots, reqlevel, reclevel)
VALUES
  (148010, 'Faceted Deep Garnet',
   'A deeply faceted garnet revealing its rich red interior.',
   0,0,1,20, 1,1,17, 961,'',0, 0,0,0, 65535,65535,0, 0,0),

  (148011, 'Polished Deep Garnet',
   'A brilliantly polished deep garnet with a powerful red gleam.',
   0,0,1,20, 1,1,17, 961,'',0, 0,0,0, 65535,65535,0, 0,0),

  (148012, 'Faceted Deep Aquamarine',
   'A deeply faceted aquamarine revealing its vivid blue interior.',
   0,0,1,20, 1,1,17, 963,'',0, 0,0,0, 65535,65535,0, 0,0),

  (148013, 'Polished Deep Aquamarine',
   'A brilliantly polished deep aquamarine with a vivid blue gleam.',
   0,0,1,20, 1,1,17, 963,'',0, 0,0,0, 65535,65535,0, 0,0);

-- ============================================================
-- FINISHED AUGMENTS (T3)
-- itemtype=54 (augment), augtype=512 (bit_AugTypeCraftedCommon, slot 10)
-- augrestrict=0 — fits armor, weapons, and accessories equally
-- augdistiller=0 — no distiller required
-- slots=2097150 — all equip slots except Charm (bits 1-20)
-- T3: +60 HP (Vitality), +60 Mana (Clarity)
-- ============================================================
INSERT IGNORE INTO items
  (id, Name, lore, nodrop, norent, stackable,
   weight, size, itemtype, magic,
   hp, mana, augtype, augrestrict, augdistiller,
   icon, idfile, material, sellrate, tradeskills,
   classes, races, slots, reqlevel, reclevel)
VALUES
  (148014, 'Tempered Garnet of Vitality',
   'A tempered garnet augment granting a strong bonus to hit points.',
   0,0,0, 0,0,54,1,
   60,0, 512,0,0,
   961,'',0, 0,0, 65535,65535,2097150, 0,0),

  (148015, 'Tempered Aquamarine of Clarity',
   'A tempered aquamarine augment granting a strong bonus to mana.',
   0,0,0, 0,0,54,1,
   0,60, 512,0,0,
   963,'',0, 0,0, 65535,65535,2097150, 0,0);

-- ============================================================
-- RECIPES (T3)
-- tradeskill=61 (Jewelry Making)
-- ============================================================
INSERT IGNORE INTO tradeskill_recipe (id, name, tradeskill, skillneeded, trivial, nofail) VALUES
  (31452, 'Faceted Deep Garnet',              61, 0, 115, 0),
  (31453, 'Faceted Deep Aquamarine',          61, 0, 115, 0),
  (31454, 'Polished Deep Garnet',             61, 0, 130, 0),
  (31455, 'Polished Deep Aquamarine',         61, 0, 130, 0),
  (31456, 'Tempered Garnet of Vitality',      61, 0, 155, 0),
  (31457, 'Tempered Aquamarine of Clarity',   61, 0, 155, 0);

-- ============================================================
-- RECIPE ENTRIES (T3)
-- Container = Gem Cutting Station (item 147985), iscontainer=1
-- Setting salvages on fail (salvagecount=1)
-- ============================================================

-- 31452: Faceted Deep Garnet
-- 2x Deep Garnet Crystal + 1x Superior Gem Grindstone → Faceted Deep Garnet
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31452,147985,0,0,0,0,1),
  (31452,148010,1,0,0,0,0),
  (31452,148006,0,0,2,0,0),
  (31452,148008,0,0,1,0,0);

-- 31453: Faceted Deep Aquamarine
-- 2x Deep Aquamarine Crystal + 1x Superior Gem Grindstone → Faceted Deep Aquamarine
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31453,147985,0,0,0,0,1),
  (31453,148012,1,0,0,0,0),
  (31453,148007,0,0,2,0,0),
  (31453,148008,0,0,1,0,0);

-- 31454: Polished Deep Garnet
-- 2x Faceted Deep Garnet + 1x Superior Gem Polish (147930, shared Lapidary) → Polished Deep Garnet
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31454,147985,0,0,0,0,1),
  (31454,148011,1,0,0,0,0),
  (31454,148010,0,0,2,0,0),
  (31454,147930,0,0,1,0,0);

-- 31455: Polished Deep Aquamarine
-- 2x Faceted Deep Aquamarine + 1x Superior Gem Polish → Polished Deep Aquamarine
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31455,147985,0,0,0,0,1),
  (31455,148013,1,0,0,0,0),
  (31455,148012,0,0,2,0,0),
  (31455,147930,0,0,1,0,0);

-- 31456: Tempered Garnet of Vitality
-- 1x Polished Deep Garnet + 1x Refined Augment Setting (salvages) → Augment
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31456,147985,0,0,0,0,1),
  (31456,148014,1,0,0,0,0),
  (31456,148011,0,0,1,0,0),
  (31456,148009,0,0,1,1,0);

-- 31457: Tempered Aquamarine of Clarity
-- 1x Polished Deep Aquamarine + 1x Refined Augment Setting (salvages) → Augment
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31457,147985,0,0,0,0,1),
  (31457,148015,1,0,0,0,0),
  (31457,148013,0,0,1,0,0),
  (31457,148009,0,0,1,1,0);
