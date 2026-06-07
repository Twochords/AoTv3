-- Weapon Smithing: Tier 3 — Tempered
-- Container: Weapon Crafting Forge (object ID 228457)
-- Shared catalyst: High-Grade Tempering Flux (item 147598)
-- Trivial range: 115–185
--
-- Item ID ranges:
--   Drop items   : 147689–147692
--   Molds (T3)   : 147728–147741
--   Intermediates: 147766–147768
--   Weapons (T3) : 147828–147841
-- Recipe IDs     : 31337–31353

-- ============================================================
-- DROP ITEMS (T3)
-- ============================================================
INSERT INTO items
  (id, Name, lore, nodrop, norent, stackable, weight, size, itemtype,
   damage, delay, astr, asta, adex, aagi, aint, awis, acha, mana,
   price, icon, idfile, material, sellrate, tradeskills, classes, races, slots,
   reqlevel, reclevel)
VALUES
  (147689,'Steel Weapon Shard',
   'A sharpened steel shard ideal for weapon crafting.',
   0,0,1,1,1,17,0,0,0,0,0,0,0,0,0,0,0,1135,'',0,0,1,65535,65535,0, 0, 0),

  (147690,'Balanced Weapon Handle',
   'A well-balanced grip for fine weapon crafting.',
   0,0,1,1,1,17,0,0,0,0,0,0,0,0,0,0,0,682,'',0,0,1,65535,65535,0, 0, 0),

  (147691,'Balanced Weapon Shaft',
   'A balanced wooden shaft for fine hafted weapons.',
   0,0,1,1,1,17,0,0,0,0,0,0,0,0,0,0,0,807,'',0,0,1,65535,65535,0, 0, 0),

  (147692,'Brilliant Focus Stone',
   'A brilliantly glowing stone crackling with arcane power.',
   0,0,1,1,1,17,0,0,0,0,0,0,0,0,0,0,0,651,'',0,0,1,65535,65535,0, 0, 0);

-- ============================================================
-- WEAPON MOLDS (T3) — price: 100pp = 100000 copper
-- ============================================================
INSERT INTO items
  (id, Name, lore, nodrop, norent, stackable, weight, size, itemtype,
   damage, delay, astr, asta, adex, aagi, aint, awis, acha, mana,
   price, icon, idfile, material, sellrate, tradeskills, classes, races, slots,
   reqlevel, reclevel)
VALUES
  (147728,'Tempered Long Sword Mold',        'A precision template for a tempered long sword.',        0,0,1,1,1,17,0,0,0,0,0,0,0,0,0,0,100000,504,'',0,1,1,65535,65535,0, 0, 0),
  (147729,'Tempered Short Sword Mold',       'A precision template for a tempered short sword.',       0,0,1,1,1,17,0,0,0,0,0,0,0,0,0,0,100000,504,'',0,1,1,65535,65535,0, 0, 0),
  (147730,'Tempered Scimitar Mold',          'A precision template for a tempered scimitar.',          0,0,1,1,1,17,0,0,0,0,0,0,0,0,0,0,100000,504,'',0,1,1,65535,65535,0, 0, 0),
  (147731,'Tempered Axe Mold',               'A precision template for a tempered axe.',               0,0,1,1,1,17,0,0,0,0,0,0,0,0,0,0,100000,504,'',0,1,1,65535,65535,0, 0, 0),
  (147732,'Tempered Mace Mold',              'A precision template for a tempered mace.',              0,0,1,1,1,17,0,0,0,0,0,0,0,0,0,0,100000,504,'',0,1,1,65535,65535,0, 0, 0),
  (147733,'Tempered Hammer Mold',            'A precision template for a tempered hammer.',            0,0,1,1,1,17,0,0,0,0,0,0,0,0,0,0,100000,504,'',0,1,1,65535,65535,0, 0, 0),
  (147734,'Tempered Club Mold',              'A precision template for a tempered club.',              0,0,1,1,1,17,0,0,0,0,0,0,0,0,0,0,100000,504,'',0,1,1,65535,65535,0, 0, 0),
  (147735,'Tempered Dagger Mold',            'A precision template for a tempered dagger.',            0,0,1,1,1,17,0,0,0,0,0,0,0,0,0,0,100000,504,'',0,1,1,65535,65535,0, 0, 0),
  (147736,'Tempered Spear Mold',             'A precision template for a tempered spear.',             0,0,1,1,1,17,0,0,0,0,0,0,0,0,0,0,100000,504,'',0,1,1,65535,65535,0, 0, 0),
  (147737,'Tempered Two Handed Sword Mold',  'A precision template for a tempered two handed sword.',  0,0,1,1,1,17,0,0,0,0,0,0,0,0,0,0,100000,504,'',0,1,1,65535,65535,0, 0, 0),
  (147738,'Tempered Two Handed Axe Mold',    'A precision template for a tempered two handed axe.',    0,0,1,1,1,17,0,0,0,0,0,0,0,0,0,0,100000,504,'',0,1,1,65535,65535,0, 0, 0),
  (147739,'Tempered Two Handed Hammer Mold', 'A precision template for a tempered two handed hammer.', 0,0,1,1,1,17,0,0,0,0,0,0,0,0,0,0,100000,504,'',0,1,1,65535,65535,0, 0, 0),
  (147740,'Tempered Staff Mold',             'A precision template for a tempered staff.',             0,0,1,1,1,17,0,0,0,0,0,0,0,0,0,0,100000,504,'',0,1,1,65535,65535,0, 0, 0),
  (147741,'Tempered Halberd Mold',           'A precision template for a tempered halberd.',           0,0,1,1,1,17,0,0,0,0,0,0,0,0,0,0,100000,504,'',0,1,1,65535,65535,0, 0, 0);

-- ============================================================
-- INTERMEDIATES (T3)
-- ============================================================
INSERT INTO items
  (id, Name, lore, nodrop, norent, stackable, weight, size, itemtype,
   damage, delay, astr, asta, adex, aagi, aint, awis, acha, mana,
   price, icon, idfile, material, sellrate, tradeskills, classes, races, slots,
   reqlevel, reclevel)
VALUES
  (147766,'Steel Weapon Billet',
   'A tempered bar of refined steel ready for shaping.',
   0,0,1,2,2,17,0,0,0,0,0,0,0,0,0,0,0,1138,'',0,0,0,65535,65535,0, 0, 0),

  (147767,'Steel Weapon Blank',
   'A tempered steel weapon form awaiting final assembly.',
   0,0,1,2,2,17,0,0,0,0,0,0,0,0,0,0,0,1138,'',0,0,0,65535,65535,0, 0, 0),

  (147768,'Steel Staff Core',
   'Three balanced shafts bound into a tempered staff form.',
   0,0,1,2,3,17,0,0,0,0,0,0,0,0,0,0,0,807,'',0,0,0,65535,65535,0, 0, 0);

-- ============================================================
-- FINISHED WEAPONS (T3)
-- 1H ratio 1.5:1 (dmg = delay × 1.5, rounded), 2H ratio 3:1
-- Stats: T1 × 4. reqlevel=40, reclevel=45
-- ============================================================
INSERT INTO items
  (id, Name, lore, nodrop, norent, stackable, weight, size, itemtype,
   damage, delay, astr, asta, adex, aagi, aint, awis, acha, mana,
   price, icon, idfile, material, sellrate, tradeskills, classes, races, slots,
   reqlevel, reclevel)
VALUES
-- 1H Slashing
  (147828,'Tempered Long Sword','A tempered long sword forged at the Weapon Crafting Forge.',
   0,0,0,50,3,0, 33,22, 4,0,4,0,0,0,0,0, 0,590,'IT10649',0,0,0,65535,65535,24576, 0, 0),
  (147829,'Tempered Short Sword','A tempered short sword forged at the Weapon Crafting Forge.',
   0,0,0,45,3,0, 27,18, 4,0,4,0,0,0,0,0, 0,580,'IT10653',0,0,0,65535,65535,24576, 0, 0),
  (147830,'Tempered Scimitar','A tempered scimitar forged at the Weapon Crafting Forge.',
   0,0,0,50,3,0, 30,20, 0,0,4,0,0,4,0,0, 0,604,'IT41',0,0,0,65535,65535,24576, 0, 0),
  (147831,'Tempered Axe','A tempered axe forged at the Weapon Crafting Forge.',
   0,0,0,50,3,0, 33,22, 4,4,0,0,0,0,0,0, 0,569,'IT10728',0,0,0,65535,65535,24576, 0, 0),
-- 1H Blunt
  (147832,'Tempered Mace','A tempered mace forged at the Weapon Crafting Forge.',
   0,0,0,50,3,3, 36,24, 4,0,0,0,0,4,0,0, 0,578,'IT7',0,0,0,65535,65535,24576, 0, 0),
  (147833,'Tempered Hammer','A tempered hammer forged at the Weapon Crafting Forge.',
   0,0,0,60,3,3, 39,26, 4,4,0,0,0,0,0,0, 0,567,'IT14',0,0,0,65535,65535,24576, 0, 0),
  (147834,'Tempered Club','A tempered club forged at the Weapon Crafting Forge.',
   0,0,0,45,3,3, 27,18, 0,4,0,0,0,4,0,0, 0,737,'IT18',0,0,0,65535,65535,24576, 0, 0),
-- 1H Piercing
  (147835,'Tempered Dagger','A tempered dagger forged at the Weapon Crafting Forge.',
   0,0,0,30,3,2, 24,16, 0,0,4,4,0,0,0,0, 0,592,'IT10650',0,0,0,65535,65535,24576, 0, 0),
  (147836,'Tempered Spear','A tempered spear forged at the Weapon Crafting Forge.',
   0,0,0,60,3,2, 29,19, 4,0,4,0,0,0,0,0, 0,740,'IT10613',0,0,0,65535,65535,24576, 0, 0),
-- 2H Slashing
  (147837,'Tempered Two Handed Sword','A tempered two handed sword forged at the Weapon Crafting Forge.',
   0,0,0,90,4,1, 90,30, 4,4,4,0,0,0,0,0, 0,519,'IT10648',0,0,0,65535,65535,8192, 0, 0),
  (147838,'Tempered Two Handed Axe','A tempered two handed axe forged at the Weapon Crafting Forge.',
   0,0,0,90,4,1, 96,32, 8,8,0,0,0,0,0,0, 0,568,'IT25',0,0,0,65535,65535,8192, 0, 0),
-- 2H Blunt
  (147839,'Tempered Two Handed Hammer','A tempered two handed hammer forged at the Weapon Crafting Forge.',
   0,0,0,100,4,4, 108,36, 4,4,0,4,0,0,0,0, 0,567,'IT24',0,0,0,65535,65535,8192, 0, 0),
  (147840,'Tempered Staff','A tempered staff forged at the Weapon Crafting Forge.',
   0,0,0,70,4,4, 84,28, 0,0,0,0,4,4,0,20, 0,602,'IT10200',0,0,0,65535,65535,8192, 0, 0),
-- 2H Piercing
  (147841,'Tempered Halberd','A tempered halberd forged at the Weapon Crafting Forge.',
   0,0,0,90,4,1, 102,34, 4,0,4,4,0,0,0,0, 0,736,'IT23',0,0,0,65535,65535,8192, 0, 0);

-- ============================================================
-- RECIPES (T3)
-- ============================================================
INSERT INTO tradeskill_recipe (id, name, tradeskill, skillneeded, trivial, nofail) VALUES
  (31337,'Steel Weapon Billet',             63,0, 0, 0),
  (31338,'Steel Weapon Blank',              63,0, 0, 0),
  (31339,'Steel Staff Core',                63,0, 0, 0),
  (31340,'Tempered Dagger',                 63,0, 0, 0),
  (31341,'Tempered Short Sword',            63,0, 0, 0),
  (31342,'Tempered Club',                   63,0, 0, 0),
  (31343,'Tempered Mace',                   63,0, 0, 0),
  (31344,'Tempered Spear',                  63,0, 0, 0),
  (31345,'Tempered Long Sword',             63,0, 0, 0),
  (31346,'Tempered Scimitar',               63,0, 0, 0),
  (31347,'Tempered Axe',                    63,0, 0, 0),
  (31348,'Tempered Hammer',                 63,0, 0, 0),
  (31349,'Tempered Two Handed Sword',       63,0, 0, 0),
  (31350,'Tempered Two Handed Axe',         63,0, 0, 0),
  (31351,'Tempered Halberd',                63,0, 0, 0),
  (31352,'Tempered Two Handed Hammer',      63,0, 0, 0),
  (31353,'Tempered Staff',                  63,0, 0, 0);

-- ============================================================
-- RECIPE ENTRIES (T3)
-- Shared catalyst: High-Grade Tempering Flux (147598)
-- ============================================================

-- 31337: Steel Weapon Billet — 2× Steel Shard (147689) + 1× Flux (147598)
INSERT INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31337,147680,0,0,0, 0, 0),(31337,147766,1,0,0, 0, 0),
  (31337,147689,0,0,2, 0, 0),(31337,147598,0,0,1, 0, 0);

-- 31338: Steel Weapon Blank — 2× Steel Billet (147766)
INSERT INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31338,147680,0,0,0, 0, 0),(31338,147767,1,0,0, 0, 0),
  (31338,147766,0,0,2, 0, 0);

-- 31339: Steel Staff Core — 3× Balanced Shaft (147691) + 1× Flux (147598)
INSERT INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31339,147680,0,0,0, 0, 0),(31339,147768,1,0,0, 0, 0),
  (31339,147691,0,0,3, 0, 0),(31339,147598,0,0,1, 0, 0);

-- 31340: Tempered Dagger
INSERT INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31340,147680,0,0,0, 0, 0),(31340,147835,1,0,0, 0, 0),
  (31340,147767,0,0,1, 0, 0),(31340,147690,0,0,1, 0, 0),
  (31340,147735,0,0,1, 0, 0),(31340,147598,0,0,1, 0, 0);

-- 31341: Tempered Short Sword
INSERT INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31341,147680,0,0,0, 0, 0),(31341,147829,1,0,0, 0, 0),
  (31341,147767,0,0,1, 0, 0),(31341,147690,0,0,1, 0, 0),
  (31341,147729,0,0,1, 0, 0),(31341,147598,0,0,1, 0, 0);

-- 31342: Tempered Club
INSERT INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31342,147680,0,0,0, 0, 0),(31342,147834,1,0,0, 0, 0),
  (31342,147767,0,0,1, 0, 0),(31342,147690,0,0,1, 0, 0),
  (31342,147734,0,0,1, 0, 0),(31342,147598,0,0,1, 0, 0);

-- 31343: Tempered Mace
INSERT INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31343,147680,0,0,0, 0, 0),(31343,147832,1,0,0, 0, 0),
  (31343,147767,0,0,1, 0, 0),(31343,147690,0,0,1, 0, 0),
  (31343,147732,0,0,1, 0, 0),(31343,147598,0,0,1, 0, 0);

-- 31344: Tempered Spear — uses Shaft
INSERT INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31344,147680,0,0,0, 0, 0),(31344,147836,1,0,0, 0, 0),
  (31344,147767,0,0,1, 0, 0),(31344,147691,0,0,1, 0, 0),
  (31344,147736,0,0,1, 0, 0),(31344,147598,0,0,1, 0, 0);

-- 31345: Tempered Long Sword — 2× Blank
INSERT INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31345,147680,0,0,0, 0, 0),(31345,147828,1,0,0, 0, 0),
  (31345,147767,0,0,2, 0, 0),(31345,147690,0,0,1, 0, 0),
  (31345,147728,0,0,1, 0, 0),(31345,147598,0,0,1, 0, 0);

-- 31346: Tempered Scimitar — 2× Blank
INSERT INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31346,147680,0,0,0, 0, 0),(31346,147830,1,0,0, 0, 0),
  (31346,147767,0,0,2, 0, 0),(31346,147690,0,0,1, 0, 0),
  (31346,147730,0,0,1, 0, 0),(31346,147598,0,0,1, 0, 0);

-- 31347: Tempered Axe — 2× Blank + Shaft
INSERT INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31347,147680,0,0,0, 0, 0),(31347,147831,1,0,0, 0, 0),
  (31347,147767,0,0,2, 0, 0),(31347,147691,0,0,1, 0, 0),
  (31347,147731,0,0,1, 0, 0),(31347,147598,0,0,1, 0, 0);

-- 31348: Tempered Hammer — 2× Blank
INSERT INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31348,147680,0,0,0, 0, 0),(31348,147833,1,0,0, 0, 0),
  (31348,147767,0,0,2, 0, 0),(31348,147690,0,0,1, 0, 0),
  (31348,147733,0,0,1, 0, 0),(31348,147598,0,0,1, 0, 0);

-- 31349: Tempered Two Handed Sword — 3× Blank + 2× Shaft
INSERT INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31349,147680,0,0,0, 0, 0),(31349,147837,1,0,0, 0, 0),
  (31349,147767,0,0,3, 0, 0),(31349,147691,0,0,2, 0, 0),
  (31349,147737,0,0,1, 0, 0),(31349,147598,0,0,1, 0, 0);

-- 31350: Tempered Two Handed Axe — 3× Blank + 2× Shaft
INSERT INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31350,147680,0,0,0, 0, 0),(31350,147838,1,0,0, 0, 0),
  (31350,147767,0,0,3, 0, 0),(31350,147691,0,0,2, 0, 0),
  (31350,147738,0,0,1, 0, 0),(31350,147598,0,0,1, 0, 0);

-- 31351: Tempered Halberd — 3× Blank + 2× Shaft
INSERT INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31351,147680,0,0,0, 0, 0),(31351,147841,1,0,0, 0, 0),
  (31351,147767,0,0,3, 0, 0),(31351,147691,0,0,2, 0, 0),
  (31351,147741,0,0,1, 0, 0),(31351,147598,0,0,1, 0, 0);

-- 31352: Tempered Two Handed Hammer — 3× Blank + 2× Handle
INSERT INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31352,147680,0,0,0, 0, 0),(31352,147839,1,0,0, 0, 0),
  (31352,147767,0,0,3, 0, 0),(31352,147690,0,0,2, 0, 0),
  (31352,147739,0,0,1, 0, 0),(31352,147598,0,0,1, 0, 0);

-- 31353: Tempered Staff — 1× Staff Core + 1× Focus Stone + 1× Mold + 1× Flux
INSERT INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31353,147680,0,0,0, 0, 0),(31353,147840,1,0,0, 0, 0),
  (31353,147768,0,0,1, 0, 0),(31353,147692,0,0,1, 0, 0),
  (31353,147740,0,0,1, 0, 0),(31353,147598,0,0,1, 0, 0);
