-- Weapon Smithing: Tier 2 — Reinforced
-- Container: Weapon Crafting Forge (object ID 228457)
-- Shared catalyst: Standard Tempering Flux (item 147554)
-- Trivial range: 75–145
--
-- Item ID ranges:
--   Drop items   : 147685–147688
--   Molds (T2)   : 147714–147727
--   Intermediates: 147763–147765
--   Weapons (T2) : 147814–147827
-- Recipe IDs     : 31320–31336

-- ============================================================
-- DROP ITEMS (T2)
-- ============================================================
INSERT INTO items
  (id, Name, lore, nodrop, norent, stackable, weight, size, itemtype,
   damage, delay, astr, asta, adex, aagi, aint, awis, acha, mana,
   price, icon, idfile, material, sellrate, tradeskills, classes, races, slots,
   reqlevel, reclevel)
VALUES
  (147685,'Iron Weapon Fragment',
   'A dense iron fragment suitable for weapon crafting.',
   0,0,1,1,1,17,0,0,0,0,0,0,0,0,0,0,0,1135,'',0,0,1,65535,65535,0, 0, 0),

  (147686,'Rough Weapon Handle',
   'A rough but serviceable weapon grip.',
   0,0,1,1,1,17,0,0,0,0,0,0,0,0,0,0,0,682,'',0,0,1,65535,65535,0, 0, 0),

  (147687,'Sturdy Weapon Haft',
   'A solid wooden haft good for hafted weapons.',
   0,0,1,1,1,17,0,0,0,0,0,0,0,0,0,0,0,807,'',0,0,1,65535,65535,0, 0, 0),

  (147688,'Glowing Focus Stone',
   'A stone pulsing with contained arcane energy.',
   0,0,1,1,1,17,0,0,0,0,0,0,0,0,0,0,0,651,'',0,0,1,65535,65535,0, 0, 0);

-- ============================================================
-- WEAPON MOLDS (T2) — price: 25pp = 25000 copper
-- ============================================================
INSERT INTO items
  (id, Name, lore, nodrop, norent, stackable, weight, size, itemtype,
   damage, delay, astr, asta, adex, aagi, aint, awis, acha, mana,
   price, icon, idfile, material, sellrate, tradeskills, classes, races, slots,
   reqlevel, reclevel)
VALUES
  (147714,'Reinforced Long Sword Mold',       'A template used to form a reinforced long sword.',       0,0,1,1,1,17,0,0,0,0,0,0,0,0,0,0,25000,504,'',0,1,1,65535,65535,0, 0, 0),
  (147715,'Reinforced Short Sword Mold',      'A template used to form a reinforced short sword.',      0,0,1,1,1,17,0,0,0,0,0,0,0,0,0,0,25000,504,'',0,1,1,65535,65535,0, 0, 0),
  (147716,'Reinforced Scimitar Mold',         'A template used to form a reinforced scimitar.',         0,0,1,1,1,17,0,0,0,0,0,0,0,0,0,0,25000,504,'',0,1,1,65535,65535,0, 0, 0),
  (147717,'Reinforced Axe Mold',              'A template used to form a reinforced axe.',              0,0,1,1,1,17,0,0,0,0,0,0,0,0,0,0,25000,504,'',0,1,1,65535,65535,0, 0, 0),
  (147718,'Reinforced Mace Mold',             'A template used to form a reinforced mace.',             0,0,1,1,1,17,0,0,0,0,0,0,0,0,0,0,25000,504,'',0,1,1,65535,65535,0, 0, 0),
  (147719,'Reinforced Hammer Mold',           'A template used to form a reinforced hammer.',           0,0,1,1,1,17,0,0,0,0,0,0,0,0,0,0,25000,504,'',0,1,1,65535,65535,0, 0, 0),
  (147720,'Reinforced Club Mold',             'A template used to form a reinforced club.',             0,0,1,1,1,17,0,0,0,0,0,0,0,0,0,0,25000,504,'',0,1,1,65535,65535,0, 0, 0),
  (147721,'Reinforced Dagger Mold',           'A template used to form a reinforced dagger.',           0,0,1,1,1,17,0,0,0,0,0,0,0,0,0,0,25000,504,'',0,1,1,65535,65535,0, 0, 0),
  (147722,'Reinforced Spear Mold',            'A template used to form a reinforced spear.',            0,0,1,1,1,17,0,0,0,0,0,0,0,0,0,0,25000,504,'',0,1,1,65535,65535,0, 0, 0),
  (147723,'Reinforced Two Handed Sword Mold', 'A template used to form a reinforced two handed sword.', 0,0,1,1,1,17,0,0,0,0,0,0,0,0,0,0,25000,504,'',0,1,1,65535,65535,0, 0, 0),
  (147724,'Reinforced Two Handed Axe Mold',   'A template used to form a reinforced two handed axe.',   0,0,1,1,1,17,0,0,0,0,0,0,0,0,0,0,25000,504,'',0,1,1,65535,65535,0, 0, 0),
  (147725,'Reinforced Two Handed Hammer Mold','A template used to form a reinforced two handed hammer.',0,0,1,1,1,17,0,0,0,0,0,0,0,0,0,0,25000,504,'',0,1,1,65535,65535,0, 0, 0),
  (147726,'Reinforced Staff Mold',            'A template used to form a reinforced staff.',            0,0,1,1,1,17,0,0,0,0,0,0,0,0,0,0,25000,504,'',0,1,1,65535,65535,0, 0, 0),
  (147727,'Reinforced Halberd Mold',          'A template used to form a reinforced halberd.',          0,0,1,1,1,17,0,0,0,0,0,0,0,0,0,0,25000,504,'',0,1,1,65535,65535,0, 0, 0);

-- ============================================================
-- INTERMEDIATES (T2)
-- ============================================================
INSERT INTO items
  (id, Name, lore, nodrop, norent, stackable, weight, size, itemtype,
   damage, delay, astr, asta, adex, aagi, aint, awis, acha, mana,
   price, icon, idfile, material, sellrate, tradeskills, classes, races, slots,
   reqlevel, reclevel)
VALUES
  (147763,'Iron Weapon Billet',
   'A solid bar of refined iron ready for shaping.',
   0,0,1,2,2,17,0,0,0,0,0,0,0,0,0,0,0,1135,'',0,0,0,65535,65535,0, 0, 0),

  (147764,'Iron Weapon Blank',
   'A shaped iron weapon form awaiting final assembly.',
   0,0,1,2,2,17,0,0,0,0,0,0,0,0,0,0,0,1135,'',0,0,0,65535,65535,0, 0, 0),

  (147765,'Iron Staff Core',
   'Three hafts bound into a solid staff form.',
   0,0,1,2,3,17,0,0,0,0,0,0,0,0,0,0,0,807,'',0,0,0,65535,65535,0, 0, 0);

-- ============================================================
-- FINISHED WEAPONS (T2)
-- 1H ratio 1:1 (dmg = delay), 2H ratio 2:1 (dmg = delay × 2)
-- Stats: T1 × 2. reqlevel=20, reclevel=25
-- ============================================================
INSERT INTO items
  (id, Name, lore, nodrop, norent, stackable, weight, size, itemtype,
   damage, delay, astr, asta, adex, aagi, aint, awis, acha, mana,
   price, icon, idfile, material, sellrate, tradeskills, classes, races, slots,
   reqlevel, reclevel)
VALUES
-- 1H Slashing
  (147814,'Reinforced Long Sword','A reinforced long sword forged at the Weapon Crafting Forge.',
   0,0,0,50,3,0, 22,22, 2,0,2,0,0,0,0,0, 0,590,'IT10649',0,0,0,65535,65535,24576, 0, 0),
  (147815,'Reinforced Short Sword','A reinforced short sword forged at the Weapon Crafting Forge.',
   0,0,0,45,3,0, 18,18, 2,0,2,0,0,0,0,0, 0,580,'IT10653',0,0,0,65535,65535,24576, 0, 0),
  (147816,'Reinforced Scimitar','A reinforced scimitar forged at the Weapon Crafting Forge.',
   0,0,0,50,3,0, 20,20, 0,0,2,0,0,2,0,0, 0,604,'IT41',0,0,0,65535,65535,24576, 0, 0),
  (147817,'Reinforced Axe','A reinforced axe forged at the Weapon Crafting Forge.',
   0,0,0,50,3,0, 22,22, 2,2,0,0,0,0,0,0, 0,569,'IT10728',0,0,0,65535,65535,24576, 0, 0),
-- 1H Blunt
  (147818,'Reinforced Mace','A reinforced mace forged at the Weapon Crafting Forge.',
   0,0,0,50,3,3, 24,24, 2,0,0,0,0,2,0,0, 0,578,'IT7',0,0,0,65535,65535,24576, 0, 0),
  (147819,'Reinforced Hammer','A reinforced hammer forged at the Weapon Crafting Forge.',
   0,0,0,60,3,3, 26,26, 2,2,0,0,0,0,0,0, 0,567,'IT14',0,0,0,65535,65535,24576, 0, 0),
  (147820,'Reinforced Club','A reinforced club forged at the Weapon Crafting Forge.',
   0,0,0,45,3,3, 18,18, 0,2,0,0,0,2,0,0, 0,737,'IT18',0,0,0,65535,65535,24576, 0, 0),
-- 1H Piercing
  (147821,'Reinforced Dagger','A reinforced dagger forged at the Weapon Crafting Forge.',
   0,0,0,30,3,2, 16,16, 0,0,2,2,0,0,0,0, 0,592,'IT10650',0,0,0,65535,65535,24576, 0, 0),
  (147822,'Reinforced Spear','A reinforced spear forged at the Weapon Crafting Forge.',
   0,0,0,60,3,2, 19,19, 2,0,2,0,0,0,0,0, 0,740,'IT10613',0,0,0,65535,65535,24576, 0, 0),
-- 2H Slashing
  (147823,'Reinforced Two Handed Sword','A reinforced two handed sword forged at the Weapon Crafting Forge.',
   0,0,0,90,4,1, 60,30, 2,2,2,0,0,0,0,0, 0,519,'IT10648',0,0,0,65535,65535,8192, 0, 0),
  (147824,'Reinforced Two Handed Axe','A reinforced two handed axe forged at the Weapon Crafting Forge.',
   0,0,0,90,4,1, 64,32, 4,4,0,0,0,0,0,0, 0,568,'IT25',0,0,0,65535,65535,8192, 0, 0),
-- 2H Blunt
  (147825,'Reinforced Two Handed Hammer','A reinforced two handed hammer forged at the Weapon Crafting Forge.',
   0,0,0,100,4,4, 72,36, 2,2,0,2,0,0,0,0, 0,567,'IT24',0,0,0,65535,65535,8192, 0, 0),
  (147826,'Reinforced Staff','A reinforced staff forged at the Weapon Crafting Forge.',
   0,0,0,70,4,4, 56,28, 0,0,0,0,2,2,0,10, 0,602,'IT10200',0,0,0,65535,65535,8192, 0, 0),
-- 2H Piercing
  (147827,'Reinforced Halberd','A reinforced halberd forged at the Weapon Crafting Forge.',
   0,0,0,90,4,1, 68,34, 2,0,2,2,0,0,0,0, 0,736,'IT23',0,0,0,65535,65535,8192, 0, 0);

-- ============================================================
-- RECIPES (T2)
-- ============================================================
INSERT INTO tradeskill_recipe (id, name, tradeskill, skillneeded, trivial, nofail) VALUES
  (31320,'Iron Weapon Billet',              63,0, 0, 0),
  (31321,'Iron Weapon Blank',               63,0, 0, 0),
  (31322,'Iron Staff Core',                 63,0, 0, 0),
  (31323,'Reinforced Dagger',               63,0, 0, 0),
  (31324,'Reinforced Short Sword',          63,0, 0, 0),
  (31325,'Reinforced Club',                 63,0, 0, 0),
  (31326,'Reinforced Mace',                 63,0, 0, 0),
  (31327,'Reinforced Spear',                63,0, 0, 0),
  (31328,'Reinforced Long Sword',           63,0, 0, 0),
  (31329,'Reinforced Scimitar',             63,0, 0, 0),
  (31330,'Reinforced Axe',                  63,0, 0, 0),
  (31331,'Reinforced Hammer',               63,0, 0, 0),
  (31332,'Reinforced Two Handed Sword',     63,0, 0, 0),
  (31333,'Reinforced Two Handed Axe',       63,0, 0, 0),
  (31334,'Reinforced Halberd',              63,0, 0, 0),
  (31335,'Reinforced Two Handed Hammer',    63,0, 0, 0),
  (31336,'Reinforced Staff',                63,0, 0, 0);

-- ============================================================
-- RECIPE ENTRIES (T2)
-- Shared catalyst: Standard Tempering Flux (147554)
-- ============================================================

-- 31320: Iron Weapon Billet — 2× Iron Fragment (147685) + 1× Flux (147554)
INSERT INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31320,147680,0,0,0, 0, 0),(31320,147763,1,0,0, 0, 0),
  (31320,147685,0,0,2, 0, 0),(31320,147554,0,0,1, 0, 0);

-- 31321: Iron Weapon Blank — 2× Iron Billet (147763)
INSERT INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31321,147680,0,0,0, 0, 0),(31321,147764,1,0,0, 0, 0),
  (31321,147763,0,0,2, 0, 0);

-- 31322: Iron Staff Core — 3× Sturdy Haft (147687) + 1× Flux (147554)
INSERT INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31322,147680,0,0,0, 0, 0),(31322,147765,1,0,0, 0, 0),
  (31322,147687,0,0,3, 0, 0),(31322,147554,0,0,1, 0, 0);

-- 31323: Reinforced Dagger — 1× Blank + 1× Handle + 1× Mold(s) + 1× Flux
INSERT INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31323,147680,0,0,0, 0, 0),(31323,147821,1,0,0, 0, 0),
  (31323,147764,0,0,1, 0, 0),(31323,147686,0,0,1, 0, 0),
  (31323,147721,0,0,1, 0, 0),(31323,147554,0,0,1, 0, 0);

-- 31324: Reinforced Short Sword
INSERT INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31324,147680,0,0,0, 0, 0),(31324,147815,1,0,0, 0, 0),
  (31324,147764,0,0,1, 0, 0),(31324,147686,0,0,1, 0, 0),
  (31324,147715,0,0,1, 0, 0),(31324,147554,0,0,1, 0, 0);

-- 31325: Reinforced Club
INSERT INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31325,147680,0,0,0, 0, 0),(31325,147820,1,0,0, 0, 0),
  (31325,147764,0,0,1, 0, 0),(31325,147686,0,0,1, 0, 0),
  (31325,147720,0,0,1, 0, 0),(31325,147554,0,0,1, 0, 0);

-- 31326: Reinforced Mace
INSERT INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31326,147680,0,0,0, 0, 0),(31326,147818,1,0,0, 0, 0),
  (31326,147764,0,0,1, 0, 0),(31326,147686,0,0,1, 0, 0),
  (31326,147718,0,0,1, 0, 0),(31326,147554,0,0,1, 0, 0);

-- 31327: Reinforced Spear — uses Haft instead of Handle
INSERT INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31327,147680,0,0,0, 0, 0),(31327,147822,1,0,0, 0, 0),
  (31327,147764,0,0,1, 0, 0),(31327,147687,0,0,1, 0, 0),
  (31327,147722,0,0,1, 0, 0),(31327,147554,0,0,1, 0, 0);

-- 31328: Reinforced Long Sword — 2× Blank
INSERT INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31328,147680,0,0,0, 0, 0),(31328,147814,1,0,0, 0, 0),
  (31328,147764,0,0,2, 0, 0),(31328,147686,0,0,1, 0, 0),
  (31328,147714,0,0,1, 0, 0),(31328,147554,0,0,1, 0, 0);

-- 31329: Reinforced Scimitar — 2× Blank
INSERT INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31329,147680,0,0,0, 0, 0),(31329,147816,1,0,0, 0, 0),
  (31329,147764,0,0,2, 0, 0),(31329,147686,0,0,1, 0, 0),
  (31329,147716,0,0,1, 0, 0),(31329,147554,0,0,1, 0, 0);

-- 31330: Reinforced Axe — 2× Blank + Haft
INSERT INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31330,147680,0,0,0, 0, 0),(31330,147817,1,0,0, 0, 0),
  (31330,147764,0,0,2, 0, 0),(31330,147687,0,0,1, 0, 0),
  (31330,147717,0,0,1, 0, 0),(31330,147554,0,0,1, 0, 0);

-- 31331: Reinforced Hammer — 2× Blank
INSERT INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31331,147680,0,0,0, 0, 0),(31331,147819,1,0,0, 0, 0),
  (31331,147764,0,0,2, 0, 0),(31331,147686,0,0,1, 0, 0),
  (31331,147719,0,0,1, 0, 0),(31331,147554,0,0,1, 0, 0);

-- 31332: Reinforced Two Handed Sword — 3× Blank + 2× Haft
INSERT INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31332,147680,0,0,0, 0, 0),(31332,147823,1,0,0, 0, 0),
  (31332,147764,0,0,3, 0, 0),(31332,147687,0,0,2, 0, 0),
  (31332,147723,0,0,1, 0, 0),(31332,147554,0,0,1, 0, 0);

-- 31333: Reinforced Two Handed Axe — 3× Blank + 2× Haft
INSERT INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31333,147680,0,0,0, 0, 0),(31333,147824,1,0,0, 0, 0),
  (31333,147764,0,0,3, 0, 0),(31333,147687,0,0,2, 0, 0),
  (31333,147724,0,0,1, 0, 0),(31333,147554,0,0,1, 0, 0);

-- 31334: Reinforced Halberd — 3× Blank + 2× Haft
INSERT INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31334,147680,0,0,0, 0, 0),(31334,147827,1,0,0, 0, 0),
  (31334,147764,0,0,3, 0, 0),(31334,147687,0,0,2, 0, 0),
  (31334,147727,0,0,1, 0, 0),(31334,147554,0,0,1, 0, 0);

-- 31335: Reinforced Two Handed Hammer — 3× Blank + 2× Handle
INSERT INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31335,147680,0,0,0, 0, 0),(31335,147825,1,0,0, 0, 0),
  (31335,147764,0,0,3, 0, 0),(31335,147686,0,0,2, 0, 0),
  (31335,147725,0,0,1, 0, 0),(31335,147554,0,0,1, 0, 0);

-- 31336: Reinforced Staff — 1× Staff Core + 1× Focus Stone + 1× Mold + 1× Flux
INSERT INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31336,147680,0,0,0, 0, 0),(31336,147826,1,0,0, 0, 0),
  (31336,147765,0,0,1, 0, 0),(31336,147688,0,0,1, 0, 0),
  (31336,147726,0,0,1, 0, 0),(31336,147554,0,0,1, 0, 0);
