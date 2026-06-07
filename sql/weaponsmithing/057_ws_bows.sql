-- Weapon Smithing: Bows (all tiers)
-- Container: Weapon Crafting Forge (item ID 147680)
-- itemtype=5 (archery bow), slots=2048 (range slot)
-- Damage ratios match 2H weapons: T1=1:1, T2=2:1, T3=3:1, T4=4:1
-- Delay=45 across all tiers (standard bow delay)
-- Stats: DEX / AGI, scaling 1x / 2x / 4x / 8x
-- Recipe cost: 3x Blank + 2x Haft/Shaft + Bow Mold (salvage) + Flux
-- Trivials slot between Halberd and Two Handed Hammer in each tier
--
-- Item IDs:
--   Molds : 147864-147867
--   Bows  : 147868-147871
-- Recipe IDs: 31375-31378
-- Merchant  : slots 60-63 on list 1000027

-- ============================================================
-- BOW MOLDS (all tiers)
-- ============================================================
INSERT INTO items
  (id, Name, lore, nodrop, norent, stackable, weight, size, itemtype,
   damage, delay, ac, astr, asta, adex, aagi, aint, awis, acha, mana,
   price, icon, idfile, material, sellrate, tradeskills, classes, races, slots,
   reqlevel, reclevel)
VALUES
  (147864,'Weathered Bow Mold',   'A worn template used to form a bow.',          0,0,1,1,1,17,0,0,0,0,0,0,0,0,0,0,0,   5000,504,'',0,1,1,65535,65535,0,0,0),
  (147865,'Reinforced Bow Mold',  'A template used to form a reinforced bow.',    0,0,1,1,1,17,0,0,0,0,0,0,0,0,0,0,0,  25000,504,'',0,1,1,65535,65535,0,0,0),
  (147866,'Tempered Bow Mold',    'A precision template for a tempered bow.',     0,0,1,1,1,17,0,0,0,0,0,0,0,0,0,0,0, 100000,504,'',0,1,1,65535,65535,0,0,0),
  (147867,'Ascendant Bow Mold',   'A masterwork template for an ascendant bow.',  0,0,1,1,1,17,0,0,0,0,0,0,0,0,0,0,0, 500000,504,'',0,1,1,65535,65535,0,0,0);

-- ============================================================
-- FINISHED BOWS (all tiers)
-- delay=45, damage scales 1:1 / 2:1 / 3:1 / 4:1
-- T1: 45/45  T2: 90/45  T3: 135/45  T4: 180/45
-- ============================================================
INSERT INTO items
  (id, Name, lore, nodrop, norent, stackable, weight, size, itemtype,
   damage, delay, ac, astr, asta, adex, aagi, aint, awis, acha, mana,
   price, icon, idfile, material, sellrate, tradeskills, classes, races, slots,
   reqlevel, reclevel)
VALUES
  (147868,'Weathered Bow',
   'A crude bow forged at the Weapon Crafting Forge.',
   0,0,0,30,4,5, 45,45, 0, 0,0,1,1,0,0,0,0,
   0,597,'IT10614',0,0,0,65535,65535,2048,0,0),

  (147869,'Reinforced Bow',
   'A reinforced bow forged at the Weapon Crafting Forge.',
   0,0,0,30,4,5, 90,45, 0, 0,0,2,2,0,0,0,0,
   0,597,'IT10614',0,0,0,65535,65535,2048,0,0),

  (147870,'Tempered Bow',
   'A tempered bow forged at the Weapon Crafting Forge.',
   0,0,0,30,4,5, 135,45, 0, 0,0,4,4,0,0,0,0,
   0,1104,'IT10300',0,0,0,65535,65535,2048,0,0),

  (147871,'Ascendant Bow',
   'An ascendant bow forged at the Weapon Crafting Forge.',
   0,0,0,30,4,5, 180,45, 0, 0,0,8,8,0,0,0,0,
   0,1448,'IT10717',0,0,0,65535,65535,2048,0,0);

-- ============================================================
-- RECIPES
-- Trivials slot between Halberd and Two Handed Hammer each tier:
--   T1: Halberd=57, Bow=58, 2H Hammer=62
--   T2: Halberd=112, Bow=115, 2H Hammer=120
--   T3: Halberd=163, Bow=164, 2H Hammer=166
--   T4: Halberd=196, Bow=197, 2H Hammer=198
-- ============================================================
INSERT INTO tradeskill_recipe (id, name, tradeskill, skillneeded, trivial, nofail) VALUES
  (31375,'Weathered Bow',   63,0, 58,0),
  (31376,'Reinforced Bow',  63,0,115,0),
  (31377,'Tempered Bow',    63,0,164,0),
  (31378,'Ascendant Bow',   63,0,197,0);

-- 31375: Weathered Bow
-- 3x T1 Blank (147761) + 2x T1 Haft (147683) + T1 Bow Mold (147864, salvage) + T1 Flux (147506)
INSERT INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31375,147680,0,0,0,0,1),
  (31375,147868,1,0,0,0,0),
  (31375,147761,0,0,3,0,0),
  (31375,147683,0,0,2,0,0),
  (31375,147864,0,0,1,1,0),
  (31375,147506,0,0,1,0,0);

-- 31376: Reinforced Bow
-- 3x T2 Blank (147764) + 2x T2 Haft (147687) + T2 Bow Mold (147865, salvage) + T2 Flux (147554)
INSERT INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31376,147680,0,0,0,0,1),
  (31376,147869,1,0,0,0,0),
  (31376,147764,0,0,3,0,0),
  (31376,147687,0,0,2,0,0),
  (31376,147865,0,0,1,1,0),
  (31376,147554,0,0,1,0,0);

-- 31377: Tempered Bow
-- 3x T3 Blank (147767) + 2x T3 Shaft (147691) + T3 Bow Mold (147866, salvage) + T3 Flux (147598)
INSERT INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31377,147680,0,0,0,0,1),
  (31377,147870,1,0,0,0,0),
  (31377,147767,0,0,3,0,0),
  (31377,147691,0,0,2,0,0),
  (31377,147866,0,0,1,1,0),
  (31377,147598,0,0,1,0,0);

-- 31378: Ascendant Bow
-- 3x T4 Blank (147770) + 2x T4 Shaft (147695) + T4 Bow Mold (147867, salvage) + T4 Flux (147642)
INSERT INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31378,147680,0,0,0,0,1),
  (31378,147871,1,0,0,0,0),
  (31378,147770,0,0,3,0,0),
  (31378,147695,0,0,2,0,0),
  (31378,147867,0,0,1,1,0),
  (31378,147642,0,0,1,0,0);

-- ============================================================
-- MERCHANT LIST — append bow molds to list 1000027
-- ============================================================
UPDATE items SET sellrate = 1.0 WHERE id BETWEEN 147864 AND 147867;

INSERT INTO merchantlist (merchantid, slot, item) VALUES
  (1000027, 60, 147864), -- Weathered Bow Mold
  (1000027, 61, 147865), -- Reinforced Bow Mold
  (1000027, 62, 147866), -- Tempered Bow Mold
  (1000027, 63, 147867); -- Ascendant Bow Mold
