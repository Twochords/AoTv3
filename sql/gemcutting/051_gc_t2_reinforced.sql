-- Gem Cutting: Tier 2 — Reinforced
-- Tradeskill: 61 (Jewelry Making), Container: Gem Cutting Station (item 147985)
-- Shared gem polish: Standard Gem Polish (147901, from Lapidary T2)
--
-- Item IDs:
--   Drop items   : 147996–147997
--   Grindstone   : 147998
--   Setting      : 147999
--   Intermediates: 148000–148003
--   Augments     : 148004–148005
-- Recipe IDs     : 31446–31451
-- Lootdrop IDs   : 992074–992075 (appended to loottable 111004)
-- Merchant list  : 1000029 (Gem Cutter, NPC 760143), see 054_gc_merchant.sql

-- ============================================================
-- DROP ITEMS (T2)
-- ============================================================
INSERT IGNORE INTO items
  (id, Name, lore, nodrop, norent, stackable, stacksize,
   weight, size, itemtype, icon, idfile, material,
   price, sellrate, tradeskills, classes, races, slots, reqlevel, reclevel)
VALUES
  (147996, 'Pale Garnet Chip',
   'A pale red garnet chip salvaged from creatures in the Bloodfields and Ruined City.',
   0,0,1,20, 1,1,17, 961,'',0, 0,0,1, 65535,65535,0, 0,0),

  (147997, 'Pale Aquamarine Chip',
   'A pale blue aquamarine chip salvaged from creatures in the Bloodfields and Sewers.',
   0,0,1,20, 1,1,17, 963,'',0, 0,0,1, 65535,65535,0, 0,0);

-- ============================================================
-- GRINDSTONE (T2) — vendor sold, consumed in cut step
-- ============================================================
INSERT IGNORE INTO items
  (id, Name, lore, nodrop, norent, stackable, stacksize,
   weight, size, itemtype, icon, idfile, material,
   price, sellrate, tradeskills, classes, races, slots, reqlevel, reclevel)
VALUES
  (147998, 'Standard Gem Grindstone',
   'A medium-grit grinding stone for shaping reinforced-tier gems.',
   0,0,1,20, 1,1,17, 1075,'',0, 25000,1.0,1, 65535,65535,0, 0,0);

-- ============================================================
-- AUGMENT SETTING (T2) — vendor sold, salvages on fail
-- ============================================================
INSERT IGNORE INTO items
  (id, Name, lore, nodrop, norent, stackable, stacksize,
   weight, size, itemtype, icon, idfile, material,
   price, sellrate, tradeskills, classes, races, slots, reqlevel, reclevel)
VALUES
  (147999, 'Worked Augment Setting',
   'A worked metal setting for mounting a reinforced-tier gem.',
   0,0,0,1, 1,1,17, 618,'',0, 25000,1.0,1, 65535,65535,0, 0,0);

-- ============================================================
-- INTERMEDIATES (T2)
-- ============================================================
INSERT IGNORE INTO items
  (id, Name, lore, nodrop, norent, stackable, stacksize,
   weight, size, itemtype, icon, idfile, material,
   price, sellrate, tradeskills, classes, races, slots, reqlevel, reclevel)
VALUES
  (148000, 'Faceted Pale Garnet',
   'A roughly faceted pale garnet beginning to show its depth.',
   0,0,1,20, 1,1,17, 961,'',0, 0,0,0, 65535,65535,0, 0,0),

  (148001, 'Polished Pale Garnet',
   'A polished pale garnet with a warm red sheen.',
   0,0,1,20, 1,1,17, 961,'',0, 0,0,0, 65535,65535,0, 0,0),

  (148002, 'Faceted Pale Aquamarine',
   'A roughly faceted pale aquamarine beginning to show its clarity.',
   0,0,1,20, 1,1,17, 963,'',0, 0,0,0, 65535,65535,0, 0,0),

  (148003, 'Polished Pale Aquamarine',
   'A polished pale aquamarine with a cool blue sheen.',
   0,0,1,20, 1,1,17, 963,'',0, 0,0,0, 65535,65535,0, 0,0);

-- ============================================================
-- FINISHED AUGMENTS (T2)
-- itemtype=54 (augment), augtype=512 (bit_AugTypeCraftedCommon, slot 10)
-- augrestrict=0 — fits armor, weapons, and accessories equally
-- augdistiller=0 — no distiller required
-- slots=2097150 — all equip slots except Charm (bits 1-20)
-- T2: +25 HP (Vitality), +25 Mana (Clarity)
-- ============================================================
INSERT IGNORE INTO items
  (id, Name, lore, nodrop, norent, stackable,
   weight, size, itemtype, magic,
   hp, mana, augtype, augrestrict, augdistiller,
   icon, idfile, material, sellrate, tradeskills,
   classes, races, slots, reqlevel, reclevel)
VALUES
  (148004, 'Reinforced Garnet of Vitality',
   'A reinforced garnet augment granting a solid bonus to hit points.',
   0,0,0, 0,0,54,1,
   25,0, 512,0,0,
   961,'',0, 0,0, 65535,65535,2097150, 0,0),

  (148005, 'Reinforced Aquamarine of Clarity',
   'A reinforced aquamarine augment granting a solid bonus to mana.',
   0,0,0, 0,0,54,1,
   0,25, 512,0,0,
   963,'',0, 0,0, 65535,65535,2097150, 0,0);

-- ============================================================
-- RECIPES (T2)
-- tradeskill=61 (Jewelry Making)
-- ============================================================
INSERT IGNORE INTO tradeskill_recipe (id, name, tradeskill, skillneeded, trivial, nofail) VALUES
  (31446, 'Faceted Pale Garnet',               61, 0,  75, 0),
  (31447, 'Faceted Pale Aquamarine',           61, 0,  75, 0),
  (31448, 'Polished Pale Garnet',              61, 0,  90, 0),
  (31449, 'Polished Pale Aquamarine',          61, 0,  90, 0),
  (31450, 'Reinforced Garnet of Vitality',     61, 0, 115, 0),
  (31451, 'Reinforced Aquamarine of Clarity',  61, 0, 115, 0);

-- ============================================================
-- RECIPE ENTRIES (T2)
-- Container = Gem Cutting Station (item 147985), iscontainer=1
-- Setting salvages on fail (salvagecount=1)
-- ============================================================

-- 31446: Faceted Pale Garnet
-- 2x Pale Garnet Chip + 1x Standard Gem Grindstone → Faceted Pale Garnet
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31446,147985,0,0,0,0,1),
  (31446,148000,1,0,0,0,0),
  (31446,147996,0,0,2,0,0),
  (31446,147998,0,0,1,0,0);

-- 31447: Faceted Pale Aquamarine
-- 2x Pale Aquamarine Chip + 1x Standard Gem Grindstone → Faceted Pale Aquamarine
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31447,147985,0,0,0,0,1),
  (31447,148002,1,0,0,0,0),
  (31447,147997,0,0,2,0,0),
  (31447,147998,0,0,1,0,0);

-- 31448: Polished Pale Garnet
-- 2x Faceted Pale Garnet + 1x Standard Gem Polish (147901, shared Lapidary) → Polished Pale Garnet
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31448,147985,0,0,0,0,1),
  (31448,148001,1,0,0,0,0),
  (31448,148000,0,0,2,0,0),
  (31448,147901,0,0,1,0,0);

-- 31449: Polished Pale Aquamarine
-- 2x Faceted Pale Aquamarine + 1x Standard Gem Polish → Polished Pale Aquamarine
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31449,147985,0,0,0,0,1),
  (31449,148003,1,0,0,0,0),
  (31449,148002,0,0,2,0,0),
  (31449,147901,0,0,1,0,0);

-- 31450: Reinforced Garnet of Vitality
-- 1x Polished Pale Garnet + 1x Worked Augment Setting (salvages) → Augment
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31450,147985,0,0,0,0,1),
  (31450,148004,1,0,0,0,0),
  (31450,148001,0,0,1,0,0),
  (31450,147999,0,0,1,1,0);

-- 31451: Reinforced Aquamarine of Clarity
-- 1x Polished Pale Aquamarine + 1x Worked Augment Setting (salvages) → Augment
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31451,147985,0,0,0,0,1),
  (31451,148005,1,0,0,0,0),
  (31451,148003,0,0,1,0,0),
  (31451,147999,0,0,1,1,0);
