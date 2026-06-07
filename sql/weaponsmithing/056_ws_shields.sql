-- Weapon Smithing: Shields (all tiers)
-- Container: Weapon Crafting Forge (item ID 147680)
-- One shield per tier. Recipe cost same as medium 1H (2x Blank + Handle + Mold + Flux).
-- Placed in progression after medium 1H weapons, before 2H weapons.
--
-- Item IDs:
--   Molds   : 147856-147859
--   Shields : 147860-147863
-- Recipe IDs: 31371-31374
-- Merchant  : slots 56-59 on list 1000027

-- ============================================================
-- SHIELD MOLDS (all tiers)
-- ============================================================
INSERT INTO items
  (id, Name, lore, nodrop, norent, stackable, weight, size, itemtype,
   damage, delay, ac, astr, asta, adex, aagi, aint, awis, acha, mana,
   price, icon, idfile, material, sellrate, tradeskills, classes, races, slots,
   reqlevel, reclevel)
VALUES
  (147856,'Weathered Shield Mold',   'A worn template used to form a shield.',          0,0,1,1,1,17,0,0,0,0,0,0,0,0,0,0,0,   5000,504,'',0,1,1,65535,65535,0,0,0),
  (147857,'Reinforced Shield Mold',  'A template used to form a reinforced shield.',    0,0,1,1,1,17,0,0,0,0,0,0,0,0,0,0,0,  25000,504,'',0,1,1,65535,65535,0,0,0),
  (147858,'Tempered Shield Mold',    'A precision template for a tempered shield.',     0,0,1,1,1,17,0,0,0,0,0,0,0,0,0,0,0, 100000,504,'',0,1,1,65535,65535,0,0,0),
  (147859,'Ascendant Shield Mold',   'A masterwork template for an ascendant shield.',  0,0,1,1,1,17,0,0,0,0,0,0,0,0,0,0,0, 500000,504,'',0,1,1,65535,65535,0,0,0);

-- ============================================================
-- FINISHED SHIELDS (all tiers)
-- itemtype=8, slots=16384 (secondary slot)
-- Stats: STA / AGI scaling 1x / 2x / 4x / 8x
-- AC: T1=30, T2=60, T3=90, T4=120
-- ============================================================
INSERT INTO items
  (id, Name, lore, nodrop, norent, stackable, weight, size, itemtype,
   damage, delay, ac, astr, asta, adex, aagi, aint, awis, acha, mana,
   price, icon, idfile, material, sellrate, tradeskills, classes, races, slots,
   reqlevel, reclevel)
VALUES
  (147860,'Weathered Shield',
   'A crude shield forged at the Weapon Crafting Forge.',
   0,0,0,40,3,8, 0,0, 30, 0,1,0,1,0,0,0,0,
   0,759,'IT201',0,0,0,65535,65535,16384,0,0),

  (147861,'Reinforced Shield',
   'A reinforced shield forged at the Weapon Crafting Forge.',
   0,0,0,40,3,8, 0,0, 60, 0,2,0,2,0,0,0,0,
   0,759,'IT206',0,0,0,65535,65535,16384,0,0),

  (147862,'Tempered Shield',
   'A tempered shield forged at the Weapon Crafting Forge.',
   0,0,0,40,3,8, 0,0, 90, 0,4,0,4,0,0,0,0,
   0,1244,'IT218',0,0,0,65535,65535,16384,0,0),

  (147863,'Ascendant Shield',
   'An ascendant shield forged at the Weapon Crafting Forge.',
   0,0,0,40,3,8, 0,0,120, 0,8,0,8,0,0,0,0,
   0,606,'IT211',0,0,0,65535,65535,16384,0,0);

-- ============================================================
-- RECIPES
-- Positioned after medium 1H, before 2H in each tier
-- Cost: 2x Blank + 1x Handle + Mold (salvage) + Flux
-- ============================================================
INSERT INTO tradeskill_recipe (id, name, tradeskill, skillneeded, trivial, nofail) VALUES
  (31371,'Weathered Shield',   63,0, 50,0),
  (31372,'Reinforced Shield',  63,0,104,0),
  (31373,'Tempered Shield',    63,0,157,0),
  (31374,'Ascendant Shield',   63,0,193,0);

-- 31371: Weathered Shield
-- 2x T1 Blank (147761) + 1x T1 Handle (147682) + T1 Shield Mold (147856, salvage) + T1 Flux (147506)
INSERT INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31371,147680,0,0,0,0,1),
  (31371,147860,1,0,0,0,0),
  (31371,147761,0,0,2,0,0),
  (31371,147682,0,0,1,0,0),
  (31371,147856,0,0,1,1,0),
  (31371,147506,0,0,1,0,0);

-- 31372: Reinforced Shield
-- 2x T2 Blank (147764) + 1x T2 Handle (147686) + T2 Shield Mold (147857, salvage) + T2 Flux (147554)
INSERT INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31372,147680,0,0,0,0,1),
  (31372,147861,1,0,0,0,0),
  (31372,147764,0,0,2,0,0),
  (31372,147686,0,0,1,0,0),
  (31372,147857,0,0,1,1,0),
  (31372,147554,0,0,1,0,0);

-- 31373: Tempered Shield
-- 2x T3 Blank (147767) + 1x T3 Handle (147690) + T3 Shield Mold (147858, salvage) + T3 Flux (147598)
INSERT INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31373,147680,0,0,0,0,1),
  (31373,147862,1,0,0,0,0),
  (31373,147767,0,0,2,0,0),
  (31373,147690,0,0,1,0,0),
  (31373,147858,0,0,1,1,0),
  (31373,147598,0,0,1,0,0);

-- 31374: Ascendant Shield
-- 2x T4 Blank (147770) + 1x T4 Handle (147694) + T4 Shield Mold (147859, salvage) + T4 Flux (147642)
INSERT INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31374,147680,0,0,0,0,1),
  (31374,147863,1,0,0,0,0),
  (31374,147770,0,0,2,0,0),
  (31374,147694,0,0,1,0,0),
  (31374,147859,0,0,1,1,0),
  (31374,147642,0,0,1,0,0);

-- ============================================================
-- MERCHANT LIST — append shield molds to list 1000027
-- ============================================================
UPDATE items SET sellrate = 1.0 WHERE id BETWEEN 147856 AND 147859;

INSERT INTO merchantlist (merchantid, slot, item) VALUES
  (1000027, 56, 147856), -- Weathered Shield Mold
  (1000027, 57, 147857), -- Reinforced Shield Mold
  (1000027, 58, 147858), -- Tempered Shield Mold
  (1000027, 59, 147859); -- Ascendant Shield Mold
