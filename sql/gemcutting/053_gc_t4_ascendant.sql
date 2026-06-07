-- Gem Cutting: Tier 4 — Ascendant
-- Tradeskill: 61 (Jewelry Making), Container: Gem Cutting Station (item 147985)
-- Shared gem polish: Prime Gem Polish (147959, from Lapidary T4)
--
-- Item IDs:
--   Drop items   : 148016–148017
--   Grindstone   : 148018
--   Setting      : 148019
--   Intermediates: 148020–148023
--   Augments     : 148024–148025
-- Recipe IDs     : 31458–31463
-- Lootdrop IDs   : 992078–992079 (appended to loottable 111006)
-- Merchant list  : 1000029 (Gem Cutter, NPC 760143), see 054_gc_merchant.sql

-- ============================================================
-- DROP ITEMS (T4)
-- ============================================================
INSERT IGNORE INTO items
  (id, Name, lore, nodrop, norent, stackable, stacksize,
   weight, size, itemtype, icon, idfile, material,
   price, sellrate, tradeskills, classes, races, slots, reqlevel, reclevel)
VALUES
  (148016, 'Brilliant Garnet Core',
   'A gemstone core pulsing with a deep red fire, found in the Wall of Slaughter and beyond.',
   0,0,1,20, 1,1,17, 961,'',0, 0,0,1, 65535,65535,0, 0,0),

  (148017, 'Brilliant Aquamarine Core',
   'A gemstone core emanating vivid blue light, found in Riftseekers and the Proving Grounds.',
   0,0,1,20, 1,1,17, 963,'',0, 0,0,1, 65535,65535,0, 0,0);

-- ============================================================
-- GRINDSTONE (T4) — vendor sold, consumed in cut step
-- ============================================================
INSERT IGNORE INTO items
  (id, Name, lore, nodrop, norent, stackable, stacksize,
   weight, size, itemtype, icon, idfile, material,
   price, sellrate, tradeskills, classes, races, slots, reqlevel, reclevel)
VALUES
  (148018, 'Master''s Gem Grindstone',
   'An exceptionally fine grinding stone for shaping ascendant-tier gems.',
   0,0,1,20, 1,1,17, 1075,'',0, 500000,1.0,1, 65535,65535,0, 0,0);

-- ============================================================
-- AUGMENT SETTING (T4) — vendor sold, salvages on fail
-- ============================================================
INSERT IGNORE INTO items
  (id, Name, lore, nodrop, norent, stackable, stacksize,
   weight, size, itemtype, icon, idfile, material,
   price, sellrate, tradeskills, classes, races, slots, reqlevel, reclevel)
VALUES
  (148019, 'Masterwork Augment Setting',
   'A masterwork setting for mounting an ascendant-tier gem.',
   0,0,0,1, 1,1,17, 618,'',0, 500000,1.0,1, 65535,65535,0, 0,0);

-- ============================================================
-- INTERMEDIATES (T4)
-- ============================================================
INSERT IGNORE INTO items
  (id, Name, lore, nodrop, norent, stackable, stacksize,
   weight, size, itemtype, icon, idfile, material,
   price, sellrate, tradeskills, classes, races, slots, reqlevel, reclevel)
VALUES
  (148020, 'Faceted Brilliant Garnet',
   'A brilliantly faceted garnet with a captivating inner fire.',
   0,0,1,20, 1,1,17, 961,'',0, 0,0,0, 65535,65535,0, 0,0),

  (148021, 'Polished Brilliant Garnet',
   'A flawlessly polished garnet radiating deep red power.',
   0,0,1,20, 1,1,17, 961,'',0, 0,0,0, 65535,65535,0, 0,0),

  (148022, 'Faceted Brilliant Aquamarine',
   'A brilliantly faceted aquamarine with a captivating inner light.',
   0,0,1,20, 1,1,17, 963,'',0, 0,0,0, 65535,65535,0, 0,0),

  (148023, 'Polished Brilliant Aquamarine',
   'A flawlessly polished aquamarine radiating vivid blue clarity.',
   0,0,1,20, 1,1,17, 963,'',0, 0,0,0, 65535,65535,0, 0,0);

-- ============================================================
-- FINISHED AUGMENTS (T4)
-- itemtype=54 (augment), augtype=512 (bit_AugTypeCraftedCommon, slot 10)
-- augrestrict=0 — fits armor, weapons, and accessories equally
-- augdistiller=0 — no distiller required
-- slots=2097150 — all equip slots except Charm (bits 1-20)
-- T4: +150 HP (Vitality), +150 Mana (Clarity)
-- ============================================================
INSERT IGNORE INTO items
  (id, Name, lore, nodrop, norent, stackable,
   weight, size, itemtype, magic,
   hp, mana, augtype, augrestrict, augdistiller,
   icon, idfile, material, sellrate, tradeskills,
   classes, races, slots, reqlevel, reclevel)
VALUES
  (148024, 'Ascendant Garnet of Vitality',
   'A flawless garnet augment granting a powerful bonus to hit points.',
   0,0,0, 0,0,54,1,
   150,0, 512,0,0,
   961,'',0, 0,0, 65535,65535,2097150, 0,0),

  (148025, 'Ascendant Aquamarine of Clarity',
   'A flawless aquamarine augment granting a powerful bonus to mana.',
   0,0,0, 0,0,54,1,
   0,150, 512,0,0,
   963,'',0, 0,0, 65535,65535,2097150, 0,0);

-- ============================================================
-- RECIPES (T4)
-- tradeskill=61 (Jewelry Making)
-- ============================================================
INSERT IGNORE INTO tradeskill_recipe (id, name, tradeskill, skillneeded, trivial, nofail) VALUES
  (31458, 'Faceted Brilliant Garnet',          61, 0, 145, 0),
  (31459, 'Faceted Brilliant Aquamarine',      61, 0, 145, 0),
  (31460, 'Polished Brilliant Garnet',         61, 0, 160, 0),
  (31461, 'Polished Brilliant Aquamarine',     61, 0, 160, 0),
  (31462, 'Ascendant Garnet of Vitality',      61, 0, 185, 0),
  (31463, 'Ascendant Aquamarine of Clarity',   61, 0, 185, 0);

-- ============================================================
-- RECIPE ENTRIES (T4)
-- Container = Gem Cutting Station (item 147985), iscontainer=1
-- Setting salvages on fail (salvagecount=1)
-- ============================================================

-- 31458: Faceted Brilliant Garnet
-- 2x Brilliant Garnet Core + 1x Master's Gem Grindstone → Faceted Brilliant Garnet
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31458,147985,0,0,0,0,1),
  (31458,148020,1,0,0,0,0),
  (31458,148016,0,0,2,0,0),
  (31458,148018,0,0,1,0,0);

-- 31459: Faceted Brilliant Aquamarine
-- 2x Brilliant Aquamarine Core + 1x Master's Gem Grindstone → Faceted Brilliant Aquamarine
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31459,147985,0,0,0,0,1),
  (31459,148022,1,0,0,0,0),
  (31459,148017,0,0,2,0,0),
  (31459,148018,0,0,1,0,0);

-- 31460: Polished Brilliant Garnet
-- 2x Faceted Brilliant Garnet + 1x Prime Gem Polish (147959, shared Lapidary) → Polished Brilliant Garnet
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31460,147985,0,0,0,0,1),
  (31460,148021,1,0,0,0,0),
  (31460,148020,0,0,2,0,0),
  (31460,147959,0,0,1,0,0);

-- 31461: Polished Brilliant Aquamarine
-- 2x Faceted Brilliant Aquamarine + 1x Prime Gem Polish → Polished Brilliant Aquamarine
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31461,147985,0,0,0,0,1),
  (31461,148023,1,0,0,0,0),
  (31461,148022,0,0,2,0,0),
  (31461,147959,0,0,1,0,0);

-- 31462: Ascendant Garnet of Vitality
-- 1x Polished Brilliant Garnet + 1x Masterwork Augment Setting (salvages) → Augment
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31462,147985,0,0,0,0,1),
  (31462,148024,1,0,0,0,0),
  (31462,148021,0,0,1,0,0),
  (31462,148019,0,0,1,1,0);

-- 31463: Ascendant Aquamarine of Clarity
-- 1x Polished Brilliant Aquamarine + 1x Masterwork Augment Setting (salvages) → Augment
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31463,147985,0,0,0,0,1),
  (31463,148025,1,0,0,0,0),
  (31463,148023,0,0,1,0,0),
  (31463,148019,0,0,1,1,0);
