-- Weapon Smithing: Tier 1 — Weathered
-- Container: Weapon Crafting Forge (object ID 228457)
-- Shared catalyst: Minor Tempering Flux (item 147506)
-- Trivial range: 25–100
--
-- Item ID ranges:
--   Drop items   : 147681–147684
--   Molds (T1)   : 147700–147713
--   Intermediates: 147760–147762
--   Weapons (T1) : 147800–147813
-- Recipe IDs     : 31303–31319

-- ============================================================
-- DROP ITEMS (T1)
-- ============================================================
INSERT INTO items
  (id, Name, lore, nodrop, norent, stackable, weight, size, itemtype,
   damage, delay, astr, asta, adex, aagi, aint, awis, acha, mana,
   price, icon, idfile, material, sellrate, tradeskills, classes, races, slots,
   reqlevel, reclevel)
VALUES
  (147681, 'Weathered Metal Shard',
   'Crude metal salvaged from worn gear.',
   1,1,1, 1,1,17, 0,0, 0,0,0,0,0,0,0,0, 0,1135,'',0,0, 1,65535,65535,0, 0, 0),

  (147682, 'Splintered Weapon Handle',
   'A rough splintered grip salvageable for weapon crafting.',
   1,1,1, 1,1,17, 0,0, 0,0,0,0,0,0,0,0, 0,682,'',0,0, 1,65535,65535,0, 0, 0),

  (147683, 'Cracked Weapon Haft',
   'A cracked wooden shaft still usable for hafted weapon crafting.',
   1,1,1, 1,1,17, 0,0, 0,0,0,0,0,0,0,0, 0,807,'',0,0, 1,65535,65535,0, 0, 0),

  (147684, 'Dim Focus Stone',
   'A dull stone faintly charged with arcane energy.',
   1,1,1, 1,1,17, 0,0, 0,0,0,0,0,0,0,0, 0,651,'',0,0, 1,65535,65535,0, 0, 0);

-- ============================================================
-- WEAPON MOLDS (T1) — vendor sold, salvage on combine fail
-- Price: 5pp = 5000 copper
-- ============================================================
INSERT INTO items
  (id, Name, lore, nodrop, norent, stackable, weight, size, itemtype,
   damage, delay, astr, asta, adex, aagi, aint, awis, acha, mana,
   price, icon, idfile, material, sellrate, tradeskills, classes, races, slots,
   reqlevel, reclevel)
VALUES
  (147700,'Weathered Long Sword Mold',    'A worn template used to form a long sword.',    0,0,1,1,1,17,0,0,0,0,0,0,0,0,0,0,5000,504,'',0,1,1,65535,65535,0, 0, 0),
  (147701,'Weathered Short Sword Mold',   'A worn template used to form a short sword.',   0,0,1,1,1,17,0,0,0,0,0,0,0,0,0,0,5000,504,'',0,1,1,65535,65535,0, 0, 0),
  (147702,'Weathered Scimitar Mold',      'A worn template used to form a scimitar.',      0,0,1,1,1,17,0,0,0,0,0,0,0,0,0,0,5000,504,'',0,1,1,65535,65535,0, 0, 0),
  (147703,'Weathered Axe Mold',           'A worn template used to form an axe.',          0,0,1,1,1,17,0,0,0,0,0,0,0,0,0,0,5000,504,'',0,1,1,65535,65535,0, 0, 0),
  (147704,'Weathered Mace Mold',          'A worn template used to form a mace.',          0,0,1,1,1,17,0,0,0,0,0,0,0,0,0,0,5000,504,'',0,1,1,65535,65535,0, 0, 0),
  (147705,'Weathered Hammer Mold',        'A worn template used to form a hammer.',        0,0,1,1,1,17,0,0,0,0,0,0,0,0,0,0,5000,504,'',0,1,1,65535,65535,0, 0, 0),
  (147706,'Weathered Club Mold',          'A worn template used to form a club.',          0,0,1,1,1,17,0,0,0,0,0,0,0,0,0,0,5000,504,'',0,1,1,65535,65535,0, 0, 0),
  (147707,'Weathered Dagger Mold',        'A worn template used to form a dagger.',        0,0,1,1,1,17,0,0,0,0,0,0,0,0,0,0,5000,504,'',0,1,1,65535,65535,0, 0, 0),
  (147708,'Weathered Spear Mold',         'A worn template used to form a spear.',         0,0,1,1,1,17,0,0,0,0,0,0,0,0,0,0,5000,504,'',0,1,1,65535,65535,0, 0, 0),
  (147709,'Weathered Two Handed Sword Mold','A worn template used to form a two handed sword.',0,0,1,1,1,17,0,0,0,0,0,0,0,0,0,0,5000,504,'',0,1,1,65535,65535,0, 0, 0),
  (147710,'Weathered Two Handed Axe Mold','A worn template used to form a two handed axe.',  0,0,1,1,1,17,0,0,0,0,0,0,0,0,0,0,5000,504,'',0,1,1,65535,65535,0, 0, 0),
  (147711,'Weathered Two Handed Hammer Mold','A worn template used to form a two handed hammer.',0,0,1,1,1,17,0,0,0,0,0,0,0,0,0,0,5000,504,'',0,1,1,65535,65535,0, 0, 0),
  (147712,'Weathered Staff Mold',         'A worn template used to form a staff.',         0,0,1,1,1,17,0,0,0,0,0,0,0,0,0,0,5000,504,'',0,1,1,65535,65535,0, 0, 0),
  (147713,'Weathered Halberd Mold',       'A worn template used to form a halberd.',       0,0,1,1,1,17,0,0,0,0,0,0,0,0,0,0,5000,504,'',0,1,1,65535,65535,0, 0, 0);

-- ============================================================
-- INTERMEDIATES (T1)
-- ============================================================
INSERT INTO items
  (id, Name, lore, nodrop, norent, stackable, weight, size, itemtype,
   damage, delay, astr, asta, adex, aagi, aint, awis, acha, mana,
   price, icon, idfile, material, sellrate, tradeskills, classes, races, slots,
   reqlevel, reclevel)
VALUES
  (147760,'Weathered Weapon Billet',
   'A crude bar of refined metal ready for shaping.',
   0,0,1,2,2,17,0,0,0,0,0,0,0,0,0,0,0,1135,'',0,0,0,65535,65535,0, 0, 0),

  (147761,'Weathered Weapon Blank',
   'A rough weapon form awaiting final assembly.',
   0,0,1,2,2,17,0,0,0,0,0,0,0,0,0,0,0,1135,'',0,0,0,65535,65535,0, 0, 0),

  (147762,'Weathered Staff Core',
   'Three hafts bound into a rough staff form.',
   0,0,1,2,3,17,0,0,0,0,0,0,0,0,0,0,0,807,'',0,0,0,65535,65535,0, 0, 0);

-- ============================================================
-- FINISHED WEAPONS (T1) — nodrop, norent
-- 1H ratio 1:2 (dmg = delay/2), 2H ratio 1:1 (dmg = delay)
-- All: reqlevel=1, reclevel=1
-- ============================================================
-- itemtype: 0=1H Slash, 1=2H Slash, 2=Pierce, 3=1H Blunt, 4=2H Blunt
-- slots: 24576=primary+secondary (1H), 8192=primary only (2H)
INSERT INTO items
  (id, Name, lore, nodrop, norent, stackable, weight, size, itemtype,
   damage, delay, astr, asta, adex, aagi, aint, awis, acha, mana,
   price, icon, idfile, material, sellrate, tradeskills, classes, races, slots,
   reqlevel, reclevel)
VALUES
-- 1H Slashing
  (147800,'Weathered Long Sword','A crude long sword forged at the Weapon Crafting Forge.',
   0,0,0,50,3,0, 11,22, 1,0,1,0,0,0,0,0, 0,590,'IT10649',0,0,0,65535,65535,24576, 0, 0),
  (147801,'Weathered Short Sword','A crude short sword forged at the Weapon Crafting Forge.',
   0,0,0,45,3,0,  9,18, 1,0,1,0,0,0,0,0, 0,580,'IT10653',0,0,0,65535,65535,24576, 0, 0),
  (147802,'Weathered Scimitar','A crude scimitar forged at the Weapon Crafting Forge.',
   0,0,0,50,3,0, 10,20, 0,0,1,0,0,1,0,0, 0,604,'IT41',0,0,0,65535,65535,24576, 0, 0),
  (147803,'Weathered Axe','A crude axe forged at the Weapon Crafting Forge.',
   0,0,0,50,3,0, 11,22, 1,1,0,0,0,0,0,0, 0,569,'IT10728',0,0,0,65535,65535,24576, 0, 0),
-- 1H Blunt
  (147804,'Weathered Mace','A crude mace forged at the Weapon Crafting Forge.',
   0,0,0,50,3,3, 12,24, 1,0,0,0,0,1,0,0, 0,578,'IT7',0,0,0,65535,65535,24576, 0, 0),
  (147805,'Weathered Hammer','A crude hammer forged at the Weapon Crafting Forge.',
   0,0,0,60,3,3, 13,26, 1,1,0,0,0,0,0,0, 0,567,'IT14',0,0,0,65535,65535,24576, 0, 0),
  (147806,'Weathered Club','A crude club forged at the Weapon Crafting Forge.',
   0,0,0,45,3,3,  9,18, 0,1,0,0,0,1,0,0, 0,737,'IT18',0,0,0,65535,65535,24576, 0, 0),
-- 1H Piercing
  (147807,'Weathered Dagger','A crude dagger forged at the Weapon Crafting Forge.',
   0,0,0,30,3,2,  8,16, 0,0,1,1,0,0,0,0, 0,592,'IT10650',0,0,0,65535,65535,24576, 0, 0),
  (147808,'Weathered Spear','A crude spear forged at the Weapon Crafting Forge.',
   0,0,0,60,3,2, 10,19, 1,0,1,0,0,0,0,0, 0,740,'IT10613',0,0,0,65535,65535,24576, 0, 0),
-- 2H Slashing
  (147809,'Weathered Two Handed Sword','A crude two handed sword forged at the Weapon Crafting Forge.',
   0,0,0,90,4,1, 30,30, 1,1,1,0,0,0,0,0, 0,519,'IT10648',0,0,0,65535,65535,8192, 0, 0),
  (147810,'Weathered Two Handed Axe','A crude two handed axe forged at the Weapon Crafting Forge.',
   0,0,0,90,4,1, 32,32, 2,2,0,0,0,0,0,0, 0,568,'IT25',0,0,0,65535,65535,8192, 0, 0),
-- 2H Blunt
  (147811,'Weathered Two Handed Hammer','A crude two handed hammer forged at the Weapon Crafting Forge.',
   0,0,0,100,4,4, 36,36, 1,1,0,1,0,0,0,0, 0,567,'IT24',0,0,0,65535,65535,8192, 0, 0),
  (147812,'Weathered Staff','A crude staff forged at the Weapon Crafting Forge.',
   0,0,0,70,4,4, 28,28, 0,0,0,0,1,1,0,5, 0,602,'IT10200',0,0,0,65535,65535,8192, 0, 0),
-- 2H Piercing
  (147813,'Weathered Halberd','A crude halberd forged at the Weapon Crafting Forge.',
   0,0,0,90,4,1, 34,34, 1,0,1,1,0,0,0,0, 0,736,'IT23',0,0,0,65535,65535,8192, 0, 0);

-- ============================================================
-- RECIPES (T1)
-- tradeskill=63 (Blacksmithing), skillneeded=0, nofail=0
-- ============================================================
INSERT INTO tradeskill_recipe (id, name, tradeskill, skillneeded, trivial, nofail) VALUES
  (31303,'Weathered Weapon Billet',         63,0, 0, 0),
  (31304,'Weathered Weapon Blank',          63,0, 0, 0),
  (31305,'Weathered Staff Core',            63,0, 0, 0),
  (31306,'Weathered Dagger',                63,0, 0, 0),
  (31307,'Weathered Short Sword',           63,0, 0, 0),
  (31308,'Weathered Club',                  63,0, 0, 0),
  (31309,'Weathered Mace',                  63,0, 0, 0),
  (31310,'Weathered Spear',                 63,0, 0, 0),
  (31311,'Weathered Long Sword',            63,0, 0, 0),
  (31312,'Weathered Scimitar',              63,0, 0, 0),
  (31313,'Weathered Axe',                   63,0, 0, 0),
  (31314,'Weathered Hammer',                63,0, 0, 0),
  (31315,'Weathered Two Handed Sword',      63,0, 0, 0),
  (31316,'Weathered Two Handed Axe',        63,0, 0, 0),
  (31317,'Weathered Halberd',               63,0, 0, 0),
  (31318,'Weathered Two Handed Hammer',     63,0, 0, 0),
  (31319,'Weathered Staff',                 63,0, 0, 0);

-- ============================================================
-- RECIPE ENTRIES (T1)
-- iscontainer=1 for the forge; successcount=1 for outputs;
-- componentcount=N for consumed ingredients;
-- salvagecount=1 for molds (returned on fail)
-- ============================================================

-- 31303: Weathered Weapon Billet
-- 2× Weathered Metal Shard (147681) + 1× Minor Tempering Flux (147506)
INSERT INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31303,147680,0,0,0, 0, 0),
  (31303,147760,1,0,0, 0, 0),
  (31303,147681,0,0,2, 0, 0),
  (31303,147506,0,0,1, 0, 0);

-- 31304: Weathered Weapon Blank
-- 2× Weathered Weapon Billet (147760)
INSERT INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31304,147680,0,0,0, 0, 0),
  (31304,147761,1,0,0, 0, 0),
  (31304,147760,0,0,2, 0, 0);

-- 31305: Weathered Staff Core
-- 3× Cracked Weapon Haft (147683) + 1× Minor Tempering Flux (147506)
INSERT INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31305,147680,0,0,0, 0, 0),
  (31305,147762,1,0,0, 0, 0),
  (31305,147683,0,0,3, 0, 0),
  (31305,147506,0,0,1, 0, 0);

-- 31306: Weathered Dagger
-- 1× Blank + 1× Handle + 1× Dagger Mold (salvage) + 1× Flux
INSERT INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31306,147680,0,0,0, 0, 0),
  (31306,147807,1,0,0, 0, 0),
  (31306,147761,0,0,1, 0, 0),
  (31306,147682,0,0,1, 0, 0),
  (31306,147707,0,0,1, 0, 0),
  (31306,147506,0,0,1, 0, 0);

-- 31307: Weathered Short Sword
-- 1× Blank + 1× Handle + 1× Short Sword Mold (salvage) + 1× Flux
INSERT INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31307,147680,0,0,0, 0, 0),
  (31307,147801,1,0,0, 0, 0),
  (31307,147761,0,0,1, 0, 0),
  (31307,147682,0,0,1, 0, 0),
  (31307,147701,0,0,1, 0, 0),
  (31307,147506,0,0,1, 0, 0);

-- 31308: Weathered Club
-- 1× Blank + 1× Handle + 1× Club Mold (salvage) + 1× Flux
INSERT INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31308,147680,0,0,0, 0, 0),
  (31308,147806,1,0,0, 0, 0),
  (31308,147761,0,0,1, 0, 0),
  (31308,147682,0,0,1, 0, 0),
  (31308,147706,0,0,1, 0, 0),
  (31308,147506,0,0,1, 0, 0);

-- 31309: Weathered Mace
-- 1× Blank + 1× Handle + 1× Mace Mold (salvage) + 1× Flux
INSERT INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31309,147680,0,0,0, 0, 0),
  (31309,147804,1,0,0, 0, 0),
  (31309,147761,0,0,1, 0, 0),
  (31309,147682,0,0,1, 0, 0),
  (31309,147704,0,0,1, 0, 0),
  (31309,147506,0,0,1, 0, 0);

-- 31310: Weathered Spear
-- 1× Blank + 1× Haft + 1× Spear Mold (salvage) + 1× Flux
INSERT INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31310,147680,0,0,0, 0, 0),
  (31310,147808,1,0,0, 0, 0),
  (31310,147761,0,0,1, 0, 0),
  (31310,147683,0,0,1, 0, 0),
  (31310,147708,0,0,1, 0, 0),
  (31310,147506,0,0,1, 0, 0);

-- 31311: Weathered Long Sword
-- 2× Blank + 1× Handle + 1× Long Sword Mold (salvage) + 1× Flux
INSERT INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31311,147680,0,0,0, 0, 0),
  (31311,147800,1,0,0, 0, 0),
  (31311,147761,0,0,2, 0, 0),
  (31311,147682,0,0,1, 0, 0),
  (31311,147700,0,0,1, 0, 0),
  (31311,147506,0,0,1, 0, 0);

-- 31312: Weathered Scimitar
-- 2× Blank + 1× Handle + 1× Scimitar Mold (salvage) + 1× Flux
INSERT INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31312,147680,0,0,0, 0, 0),
  (31312,147802,1,0,0, 0, 0),
  (31312,147761,0,0,2, 0, 0),
  (31312,147682,0,0,1, 0, 0),
  (31312,147702,0,0,1, 0, 0),
  (31312,147506,0,0,1, 0, 0);

-- 31313: Weathered Axe
-- 2× Blank + 1× Haft + 1× Axe Mold (salvage) + 1× Flux
INSERT INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31313,147680,0,0,0, 0, 0),
  (31313,147803,1,0,0, 0, 0),
  (31313,147761,0,0,2, 0, 0),
  (31313,147683,0,0,1, 0, 0),
  (31313,147703,0,0,1, 0, 0),
  (31313,147506,0,0,1, 0, 0);

-- 31314: Weathered Hammer
-- 2× Blank + 1× Handle + 1× Hammer Mold (salvage) + 1× Flux
INSERT INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31314,147680,0,0,0, 0, 0),
  (31314,147805,1,0,0, 0, 0),
  (31314,147761,0,0,2, 0, 0),
  (31314,147682,0,0,1, 0, 0),
  (31314,147705,0,0,1, 0, 0),
  (31314,147506,0,0,1, 0, 0);

-- 31315: Weathered Two Handed Sword
-- 3× Blank + 2× Haft + 1× 2H Sword Mold (salvage) + 1× Flux
INSERT INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31315,147680,0,0,0, 0, 0),
  (31315,147809,1,0,0, 0, 0),
  (31315,147761,0,0,3, 0, 0),
  (31315,147683,0,0,2, 0, 0),
  (31315,147709,0,0,1, 0, 0),
  (31315,147506,0,0,1, 0, 0);

-- 31316: Weathered Two Handed Axe
-- 3× Blank + 2× Haft + 1× 2H Axe Mold (salvage) + 1× Flux
INSERT INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31316,147680,0,0,0, 0, 0),
  (31316,147810,1,0,0, 0, 0),
  (31316,147761,0,0,3, 0, 0),
  (31316,147683,0,0,2, 0, 0),
  (31316,147710,0,0,1, 0, 0),
  (31316,147506,0,0,1, 0, 0);

-- 31317: Weathered Halberd
-- 3× Blank + 2× Haft + 1× Halberd Mold (salvage) + 1× Flux
INSERT INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31317,147680,0,0,0, 0, 0),
  (31317,147813,1,0,0, 0, 0),
  (31317,147761,0,0,3, 0, 0),
  (31317,147683,0,0,2, 0, 0),
  (31317,147713,0,0,1, 0, 0),
  (31317,147506,0,0,1, 0, 0);

-- 31318: Weathered Two Handed Hammer
-- 3× Blank + 2× Handle + 1× 2H Hammer Mold (salvage) + 1× Flux
INSERT INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31318,147680,0,0,0, 0, 0),
  (31318,147811,1,0,0, 0, 0),
  (31318,147761,0,0,3, 0, 0),
  (31318,147682,0,0,2, 0, 0),
  (31318,147711,0,0,1, 0, 0),
  (31318,147506,0,0,1, 0, 0);

-- 31319: Weathered Staff
-- 1× Staff Core + 1× Dim Focus Stone + 1× Staff Mold (salvage) + 1× Flux
INSERT INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31319,147680,0,0,0, 0, 0),
  (31319,147812,1,0,0, 0, 0),
  (31319,147762,0,0,1, 0, 0),
  (31319,147684,0,0,1, 0, 0),
  (31319,147712,0,0,1, 0, 0),
  (31319,147506,0,0,1, 0, 0);
