-- Weapon Smithing: Tier 4 — Ascendant
-- Container: Weapon Crafting Forge (object ID 228457)
-- Shared catalyst: Prime Celestial Flux (item 147642)
-- Trivial range: 145–200
--
-- Item ID ranges:
--   Drop items   : 147693–147696
--   Molds (T4)   : 147742–147755
--   Intermediates: 147769–147771
--   Weapons (T4) : 147842–147855
-- Recipe IDs     : 31354–31370

-- ============================================================
-- DROP ITEMS (T4)
-- ============================================================
INSERT INTO items
  (id, Name, lore, nodrop, norent, stackable, weight, size, itemtype,
   damage, delay, astr, asta, adex, aagi, aint, awis, acha, mana,
   price, icon, idfile, material, sellrate, tradeskills, classes, races, slots,
   reqlevel, reclevel)
VALUES
  (147693,'Ascendant Metal Shard',
   'A gleaming shard of otherworldly metal crackling with celestial energy.',
   0,0,1,1,1,17,0,0,0,0,0,0,0,0,0,0,0,1138,'',0,0,1,65535,65535,0, 0, 0),

  (147694,'Runed Weapon Handle',
   'An intricately runed grip humming with ancient power.',
   0,0,1,1,1,17,0,0,0,0,0,0,0,0,0,0,0,682,'',0,0,1,65535,65535,0, 0, 0),

  (147695,'Runed Weapon Shaft',
   'A runed wooden shaft imbued with ascendant energy.',
   0,0,1,1,1,17,0,0,0,0,0,0,0,0,0,0,0,807,'',0,0,1,65535,65535,0, 0, 0),

  (147696,'Radiant Focus Stone',
   'A radiant stone blazing with concentrated celestial arcane energy.',
   0,0,1,1,1,17,0,0,0,0,0,0,0,0,0,0,0,651,'',0,0,1,65535,65535,0, 0, 0);

-- ============================================================
-- WEAPON MOLDS (T4) — price: 500pp = 500000 copper
-- ============================================================
INSERT INTO items
  (id, Name, lore, nodrop, norent, stackable, weight, size, itemtype,
   damage, delay, astr, asta, adex, aagi, aint, awis, acha, mana,
   price, icon, idfile, material, sellrate, tradeskills, classes, races, slots,
   reqlevel, reclevel)
VALUES
  (147742,'Ascendant Long Sword Mold',        'A masterwork template for an ascendant long sword.',        0,0,1,1,1,17,0,0,0,0,0,0,0,0,0,0,500000,504,'',0,1,1,65535,65535,0, 0, 0),
  (147743,'Ascendant Short Sword Mold',       'A masterwork template for an ascendant short sword.',       0,0,1,1,1,17,0,0,0,0,0,0,0,0,0,0,500000,504,'',0,1,1,65535,65535,0, 0, 0),
  (147744,'Ascendant Scimitar Mold',          'A masterwork template for an ascendant scimitar.',          0,0,1,1,1,17,0,0,0,0,0,0,0,0,0,0,500000,504,'',0,1,1,65535,65535,0, 0, 0),
  (147745,'Ascendant Axe Mold',               'A masterwork template for an ascendant axe.',               0,0,1,1,1,17,0,0,0,0,0,0,0,0,0,0,500000,504,'',0,1,1,65535,65535,0, 0, 0),
  (147746,'Ascendant Mace Mold',              'A masterwork template for an ascendant mace.',              0,0,1,1,1,17,0,0,0,0,0,0,0,0,0,0,500000,504,'',0,1,1,65535,65535,0, 0, 0),
  (147747,'Ascendant Hammer Mold',            'A masterwork template for an ascendant hammer.',            0,0,1,1,1,17,0,0,0,0,0,0,0,0,0,0,500000,504,'',0,1,1,65535,65535,0, 0, 0),
  (147748,'Ascendant Club Mold',              'A masterwork template for an ascendant club.',              0,0,1,1,1,17,0,0,0,0,0,0,0,0,0,0,500000,504,'',0,1,1,65535,65535,0, 0, 0),
  (147749,'Ascendant Dagger Mold',            'A masterwork template for an ascendant dagger.',            0,0,1,1,1,17,0,0,0,0,0,0,0,0,0,0,500000,504,'',0,1,1,65535,65535,0, 0, 0),
  (147750,'Ascendant Spear Mold',             'A masterwork template for an ascendant spear.',             0,0,1,1,1,17,0,0,0,0,0,0,0,0,0,0,500000,504,'',0,1,1,65535,65535,0, 0, 0),
  (147751,'Ascendant Two Handed Sword Mold',  'A masterwork template for an ascendant two handed sword.',  0,0,1,1,1,17,0,0,0,0,0,0,0,0,0,0,500000,504,'',0,1,1,65535,65535,0, 0, 0),
  (147752,'Ascendant Two Handed Axe Mold',    'A masterwork template for an ascendant two handed axe.',    0,0,1,1,1,17,0,0,0,0,0,0,0,0,0,0,500000,504,'',0,1,1,65535,65535,0, 0, 0),
  (147753,'Ascendant Two Handed Hammer Mold', 'A masterwork template for an ascendant two handed hammer.', 0,0,1,1,1,17,0,0,0,0,0,0,0,0,0,0,500000,504,'',0,1,1,65535,65535,0, 0, 0),
  (147754,'Ascendant Staff Mold',             'A masterwork template for an ascendant staff.',             0,0,1,1,1,17,0,0,0,0,0,0,0,0,0,0,500000,504,'',0,1,1,65535,65535,0, 0, 0),
  (147755,'Ascendant Halberd Mold',           'A masterwork template for an ascendant halberd.',           0,0,1,1,1,17,0,0,0,0,0,0,0,0,0,0,500000,504,'',0,1,1,65535,65535,0, 0, 0);

-- ============================================================
-- INTERMEDIATES (T4)
-- ============================================================
INSERT INTO items
  (id, Name, lore, nodrop, norent, stackable, weight, size, itemtype,
   damage, delay, astr, asta, adex, aagi, aint, awis, acha, mana,
   price, icon, idfile, material, sellrate, tradeskills, classes, races, slots,
   reqlevel, reclevel)
VALUES
  (147769,'Ascendant Weapon Billet',
   'A gleaming bar of ascendant metal pulsing with celestial energy.',
   0,0,1,2,2,17,0,0,0,0,0,0,0,0,0,0,0,1138,'',0,0,0,65535,65535,0, 0, 0),

  (147770,'Ascendant Weapon Blank',
   'A radiant weapon form awaiting its final ascendant assembly.',
   0,0,1,2,2,17,0,0,0,0,0,0,0,0,0,0,0,1138,'',0,0,0,65535,65535,0, 0, 0),

  (147771,'Ascendant Staff Core',
   'Three runed shafts bound into an ascendant staff form.',
   0,0,1,2,3,17,0,0,0,0,0,0,0,0,0,0,0,807,'',0,0,0,65535,65535,0, 0, 0);

-- ============================================================
-- FINISHED WEAPONS (T4)
-- 1H ratio 2:1 (dmg = delay × 2), 2H ratio 4:1 (dmg = delay × 4)
-- Stats: T1 × 8. reqlevel=55, reclevel=60
-- ============================================================
INSERT INTO items
  (id, Name, lore, nodrop, norent, stackable, weight, size, itemtype,
   damage, delay, astr, asta, adex, aagi, aint, awis, acha, mana,
   price, icon, idfile, material, sellrate, tradeskills, classes, races, slots,
   reqlevel, reclevel)
VALUES
-- 1H Slashing
  (147842,'Ascendant Long Sword','An ascendant long sword forged at the Weapon Crafting Forge.',
   0,0,0,50,3,0, 44,22, 8,0,8,0,0,0,0,0, 0,590,'IT10649',0,0,0,65535,65535,24576, 0, 0),
  (147843,'Ascendant Short Sword','An ascendant short sword forged at the Weapon Crafting Forge.',
   0,0,0,45,3,0, 36,18, 8,0,8,0,0,0,0,0, 0,580,'IT10653',0,0,0,65535,65535,24576, 0, 0),
  (147844,'Ascendant Scimitar','An ascendant scimitar forged at the Weapon Crafting Forge.',
   0,0,0,50,3,0, 40,20, 0,0,8,0,0,8,0,0, 0,604,'IT41',0,0,0,65535,65535,24576, 0, 0),
  (147845,'Ascendant Axe','An ascendant axe forged at the Weapon Crafting Forge.',
   0,0,0,50,3,0, 44,22, 8,8,0,0,0,0,0,0, 0,569,'IT10728',0,0,0,65535,65535,24576, 0, 0),
-- 1H Blunt
  (147846,'Ascendant Mace','An ascendant mace forged at the Weapon Crafting Forge.',
   0,0,0,50,3,3, 48,24, 8,0,0,0,0,8,0,0, 0,578,'IT7',0,0,0,65535,65535,24576, 0, 0),
  (147847,'Ascendant Hammer','An ascendant hammer forged at the Weapon Crafting Forge.',
   0,0,0,60,3,3, 52,26, 8,8,0,0,0,0,0,0, 0,567,'IT14',0,0,0,65535,65535,24576, 0, 0),
  (147848,'Ascendant Club','An ascendant club forged at the Weapon Crafting Forge.',
   0,0,0,45,3,3, 36,18, 0,8,0,0,0,8,0,0, 0,737,'IT18',0,0,0,65535,65535,24576, 0, 0),
-- 1H Piercing
  (147849,'Ascendant Dagger','An ascendant dagger forged at the Weapon Crafting Forge.',
   0,0,0,30,3,2, 32,16, 0,0,8,8,0,0,0,0, 0,592,'IT10650',0,0,0,65535,65535,24576, 0, 0),
  (147850,'Ascendant Spear','An ascendant spear forged at the Weapon Crafting Forge.',
   0,0,0,60,3,2, 38,19, 8,0,8,0,0,0,0,0, 0,740,'IT10613',0,0,0,65535,65535,24576, 0, 0),
-- 2H Slashing
  (147851,'Ascendant Two Handed Sword','An ascendant two handed sword forged at the Weapon Crafting Forge.',
   0,0,0,90,4,1, 120,30, 8,8,8,0,0,0,0,0, 0,519,'IT10648',0,0,0,65535,65535,8192, 0, 0),
  (147852,'Ascendant Two Handed Axe','An ascendant two handed axe forged at the Weapon Crafting Forge.',
   0,0,0,90,4,1, 128,32, 16,16,0,0,0,0,0,0, 0,568,'IT25',0,0,0,65535,65535,8192, 0, 0),
-- 2H Blunt
  (147853,'Ascendant Two Handed Hammer','An ascendant two handed hammer forged at the Weapon Crafting Forge.',
   0,0,0,100,4,4, 144,36, 8,8,0,8,0,0,0,0, 0,567,'IT24',0,0,0,65535,65535,8192, 0, 0),
  (147854,'Ascendant Staff','An ascendant staff forged at the Weapon Crafting Forge.',
   0,0,0,70,4,4, 112,28, 0,0,0,0,8,8,0,40, 0,602,'IT10200',0,0,0,65535,65535,8192, 0, 0),
-- 2H Piercing
  (147855,'Ascendant Halberd','An ascendant halberd forged at the Weapon Crafting Forge.',
   0,0,0,90,4,1, 136,34, 8,0,8,8,0,0,0,0, 0,736,'IT23',0,0,0,65535,65535,8192, 0, 0);

-- ============================================================
-- RECIPES (T4)
-- ============================================================
INSERT INTO tradeskill_recipe (id, name, tradeskill, skillneeded, trivial, nofail) VALUES
  (31354,'Ascendant Weapon Billet',          63,0, 0, 0),
  (31355,'Ascendant Weapon Blank',           63,0, 0, 0),
  (31356,'Ascendant Staff Core',             63,0, 0, 0),
  (31357,'Ascendant Dagger',                 63,0, 0, 0),
  (31358,'Ascendant Short Sword',            63,0, 0, 0),
  (31359,'Ascendant Club',                   63,0, 0, 0),
  (31360,'Ascendant Mace',                   63,0, 0, 0),
  (31361,'Ascendant Spear',                  63,0, 0, 0),
  (31362,'Ascendant Long Sword',             63,0, 0, 0),
  (31363,'Ascendant Scimitar',               63,0, 0, 0),
  (31364,'Ascendant Axe',                    63,0, 0, 0),
  (31365,'Ascendant Hammer',                 63,0, 0, 0),
  (31366,'Ascendant Two Handed Sword',       63,0, 0, 0),
  (31367,'Ascendant Two Handed Axe',         63,0, 0, 0),
  (31368,'Ascendant Halberd',                63,0, 0, 0),
  (31369,'Ascendant Two Handed Hammer',      63,0, 0, 0),
  (31370,'Ascendant Staff',                  63,0, 0, 0);

-- ============================================================
-- RECIPE ENTRIES (T4)
-- Shared catalyst: Prime Celestial Flux (147642)
-- ============================================================

-- 31354: Ascendant Weapon Billet — 2× Ascendant Shard (147693) + 1× Flux (147642)
INSERT INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31354,147680,0,0,0, 0, 0),(31354,147769,1,0,0, 0, 0),
  (31354,147693,0,0,2, 0, 0),(31354,147642,0,0,1, 0, 0);

-- 31355: Ascendant Weapon Blank — 2× Ascendant Billet (147769)
INSERT INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31355,147680,0,0,0, 0, 0),(31355,147770,1,0,0, 0, 0),
  (31355,147769,0,0,2, 0, 0);

-- 31356: Ascendant Staff Core — 3× Runed Shaft (147695) + 1× Flux (147642)
INSERT INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31356,147680,0,0,0, 0, 0),(31356,147771,1,0,0, 0, 0),
  (31356,147695,0,0,3, 0, 0),(31356,147642,0,0,1, 0, 0);

-- 31357: Ascendant Dagger
INSERT INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31357,147680,0,0,0, 0, 0),(31357,147849,1,0,0, 0, 0),
  (31357,147770,0,0,1, 0, 0),(31357,147694,0,0,1, 0, 0),
  (31357,147749,0,0,1, 0, 0),(31357,147642,0,0,1, 0, 0);

-- 31358: Ascendant Short Sword
INSERT INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31358,147680,0,0,0, 0, 0),(31358,147843,1,0,0, 0, 0),
  (31358,147770,0,0,1, 0, 0),(31358,147694,0,0,1, 0, 0),
  (31358,147743,0,0,1, 0, 0),(31358,147642,0,0,1, 0, 0);

-- 31359: Ascendant Club
INSERT INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31359,147680,0,0,0, 0, 0),(31359,147848,1,0,0, 0, 0),
  (31359,147770,0,0,1, 0, 0),(31359,147694,0,0,1, 0, 0),
  (31359,147748,0,0,1, 0, 0),(31359,147642,0,0,1, 0, 0);

-- 31360: Ascendant Mace
INSERT INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31360,147680,0,0,0, 0, 0),(31360,147846,1,0,0, 0, 0),
  (31360,147770,0,0,1, 0, 0),(31360,147694,0,0,1, 0, 0),
  (31360,147746,0,0,1, 0, 0),(31360,147642,0,0,1, 0, 0);

-- 31361: Ascendant Spear — uses Runed Shaft
INSERT INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31361,147680,0,0,0, 0, 0),(31361,147850,1,0,0, 0, 0),
  (31361,147770,0,0,1, 0, 0),(31361,147695,0,0,1, 0, 0),
  (31361,147750,0,0,1, 0, 0),(31361,147642,0,0,1, 0, 0);

-- 31362: Ascendant Long Sword — 2× Blank
INSERT INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31362,147680,0,0,0, 0, 0),(31362,147842,1,0,0, 0, 0),
  (31362,147770,0,0,2, 0, 0),(31362,147694,0,0,1, 0, 0),
  (31362,147742,0,0,1, 0, 0),(31362,147642,0,0,1, 0, 0);

-- 31363: Ascendant Scimitar — 2× Blank
INSERT INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31363,147680,0,0,0, 0, 0),(31363,147844,1,0,0, 0, 0),
  (31363,147770,0,0,2, 0, 0),(31363,147694,0,0,1, 0, 0),
  (31363,147744,0,0,1, 0, 0),(31363,147642,0,0,1, 0, 0);

-- 31364: Ascendant Axe — 2× Blank + Shaft
INSERT INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31364,147680,0,0,0, 0, 0),(31364,147845,1,0,0, 0, 0),
  (31364,147770,0,0,2, 0, 0),(31364,147695,0,0,1, 0, 0),
  (31364,147745,0,0,1, 0, 0),(31364,147642,0,0,1, 0, 0);

-- 31365: Ascendant Hammer — 2× Blank
INSERT INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31365,147680,0,0,0, 0, 0),(31365,147847,1,0,0, 0, 0),
  (31365,147770,0,0,2, 0, 0),(31365,147694,0,0,1, 0, 0),
  (31365,147747,0,0,1, 0, 0),(31365,147642,0,0,1, 0, 0);

-- 31366: Ascendant Two Handed Sword — 3× Blank + 2× Shaft
INSERT INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31366,147680,0,0,0, 0, 0),(31366,147851,1,0,0, 0, 0),
  (31366,147770,0,0,3, 0, 0),(31366,147695,0,0,2, 0, 0),
  (31366,147751,0,0,1, 0, 0),(31366,147642,0,0,1, 0, 0);

-- 31367: Ascendant Two Handed Axe — 3× Blank + 2× Shaft
INSERT INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31367,147680,0,0,0, 0, 0),(31367,147852,1,0,0, 0, 0),
  (31367,147770,0,0,3, 0, 0),(31367,147695,0,0,2, 0, 0),
  (31367,147752,0,0,1, 0, 0),(31367,147642,0,0,1, 0, 0);

-- 31368: Ascendant Halberd — 3× Blank + 2× Shaft
INSERT INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31368,147680,0,0,0, 0, 0),(31368,147855,1,0,0, 0, 0),
  (31368,147770,0,0,3, 0, 0),(31368,147695,0,0,2, 0, 0),
  (31368,147755,0,0,1, 0, 0),(31368,147642,0,0,1, 0, 0);

-- 31369: Ascendant Two Handed Hammer — 3× Blank + 2× Handle
INSERT INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31369,147680,0,0,0, 0, 0),(31369,147853,1,0,0, 0, 0),
  (31369,147770,0,0,3, 0, 0),(31369,147694,0,0,2, 0, 0),
  (31369,147753,0,0,1, 0, 0),(31369,147642,0,0,1, 0, 0);

-- 31370: Ascendant Staff — 1× Staff Core + 1× Focus Stone + 1× Mold + 1× Flux
INSERT INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31370,147680,0,0,0, 0, 0),(31370,147854,1,0,0, 0, 0),
  (31370,147771,0,0,1, 0, 0),(31370,147696,0,0,1, 0, 0),
  (31370,147754,0,0,1, 0, 0),(31370,147642,0,0,1, 0, 0);
