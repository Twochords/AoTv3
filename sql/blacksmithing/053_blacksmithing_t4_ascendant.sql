-- ============================================================================
-- Tier 4: Ascendant — Custom Blacksmithing System
-- ============================================================================
-- Items:   147636–147679
--   Drops/catalysts/patterns: 147636–147646
--   Intermediates:            147647–147655
--   Cloth armor:              147656–147661
--   Leather armor:            147662–147667
--   Mail armor:               147668–147673
--   Plate armor:              147674–147679
-- Recipes: 31269–31302
--   Refinement:    31269–31272
--   Intermediates: 31273–31278
--   Cloth armor:   31279–31284
--   Leather armor: 31285–31290
--   Mail armor:    31291–31296
--   Plate armor:   31297–31302
-- ============================================================================

-- ── 1. ITEMS ─────────────────────────────────────────────────────────────────

INSERT IGNORE INTO items
    (id,Name,lore,nodrop,norent,tradeskills,stackable,stacksize,
     icon,itemtype,weight,size,classes,races,slots,magic,loregroup,reclevel)
VALUES
(147636,'Enchanted Fiber Bundle',    'A bundle of magically infused fibers.',       1,1,1,1,20,532,17,1,1,65535,65535,0,0, 0, 0),
(147637,'Pristine Drake Hide',       'A flawless hide taken from a great drake.',   1,1,1,1,20,533,17,3,1,65535,65535,0,0, 0, 0),
(147638,'Mithril Ore Shard',         'A shard of rare mithril ore.',                1,1,1,1,20,640,17,5,1,65535,65535,0,0, 0, 0),
(147639,'Adamantite Ore Block',      'A block of dense adamantite ore.',            1,1,1,1,20,641,17,8,1,65535,65535,0,0, 0, 0),
(147640,'Enchanted Binding Thread',  'Thread spun with magical binding energy.',    1,1,1,1,20,650,17,1,1,65535,65535,0,0, 0, 0),
(147641,'Mystic Tanning Solution',   'A mystically infused tanning agent.',         1,1,1,1,20,845,17,1,1,65535,65535,0,0, 0, 0),
(147642,'Prime Celestial Flux',      'A refined celestial flux for mithril work.',  1,1,1,1,20,645,17,1,1,65535,65535,0,0, 0, 0),
(147643,'Ascendant Cloth Pattern',   'An exquisite template for ascendant cloth.',  1,1,1,1,20,651,17,1,1,65535,65535,0,0, 0, 0),
(147644,'Ascendant Leather Pattern', 'An exquisite template for ascendant leather.',1,1,1,1,20,651,17,1,1,65535,65535,0,0, 0, 0),
(147645,'Ascendant Mail Pattern',    'An exquisite template for ascendant mail.',   1,1,1,1,20,651,17,1,1,65535,65535,0,0, 0, 0),
(147646,'Ascendant Plate Pattern',   'An exquisite template for ascendant plate.',  1,1,1,1,20,651,17,1,1,65535,65535,0,0, 0, 0);

INSERT IGNORE INTO items
    (id,Name,lore,nodrop,norent,tradeskills,stackable,stacksize,
     icon,itemtype,weight,size,classes,races,slots,magic,loregroup,reclevel)
VALUES
(147647,'Bolt of Enchanted Silk',  'Enchanted silk cloth ready to be shaped.',      1,1,1,1,10,532,17, 2,2,65535,65535,0,0, 0, 0),
(147648,'Arcane Cloth Padding',    'A padding infused with arcane energy.',         1,1,1,1,10,532,17, 3,2,65535,65535,0,0, 0, 0),
(147649,'Ascendant Leather Sheet', 'A mystically treated leather sheet.',           1,1,1,1,10,534,17, 5,2,65535,65535,0,0, 0, 0),
(147650,'Ascendant Leather Panel', 'An ascendant leather panel ready to stitch.',   1,1,1,1,10,534,17, 7,2,65535,65535,0,0, 0, 0),
(147651,'Ascendant Refined Bar',   'A bar of refined mithril-adamantite alloy.',    1,1,1,1,10,643,17,15,2,65535,65535,0,0, 0, 0),
(147652,'Mithril Ring',            'A precision mithril ring for chainmail.',       1,1,1,1,20,644,17, 2,1,65535,65535,0,0, 0, 0),
(147653,'Ascendant Chain Bundle',  'A bundle of linked mithril rings.',             1,1,1,1,10,644,17,10,2,65535,65535,0,0, 0, 0),
(147654,'Mithril Sheet',           'A flat sheet of worked mithril alloy.',         1,1,1,1,10,643,17,20,2,65535,65535,0,0, 0, 0),
(147655,'Ascendant Plate Section', 'A precisely forged ascendant plate section.',   1,1,1,1,10,643,17,30,2,65535,65535,0,0, 0, 0);

-- Ascendant Cloth  AC: Robe=32,Cap=16,Sleeves=24,Bracers=16,Gloves=24,Trousers=24 | INT/WIS/CHA/STA=8
INSERT IGNORE INTO items
    (id,Name,lore,nodrop,norent,ac,astr,asta,aagi,adex,aint,awis,acha,
     itemtype,weight,size,classes,races,slots,magic,loregroup,reclevel,icon,idfile,material,color)
VALUES
(147656,'Ascendant Cloth Cap',    'A cap woven from enchanted silk.',                1,1,16,0,8,0,0,8,8,8,10,3,3,65535,65535,     4,1,-1,1, 641,'IT63', 0, 0),
(147657,'Ascendant Cloth Robe',   'A robe woven from enchanted ascendant silk.',    1,1,32,0,8,0,0,8,8,8,10,5,3,65535,65535,131072,1,-1,1, 838,'IT63', 0, 0),
(147658,'Ascendant Cloth Sleeves','Enchanted silk sleeves.',                         1,1,24,0,8,0,0,8,8,8,10,3,3,65535,65535,   128,1,-1,1, 670,'IT63', 0, 0),
(147659,'Ascendant Cloth Bracers','Enchanted silk bracers.',                         1,1,16,0,8,0,0,8,8,8,10,2,2,65535,65535,  1536,1,-1,1, 638,'IT63', 0, 0),
(147660,'Ascendant Cloth Gloves', 'Enchanted silk gloves.',                          1,1,24,0,8,0,0,8,8,8,10,2,2,65535,65535,  4096,1,-1,1, 517,'IT63', 0, 0),
(147661,'Ascendant Cloth Trousers','Enchanted silk trousers.',                       1,1,24,0,8,0,0,8,8,8,10,4,3,65535,65535,262144,1,-1,1, 631,'IT63', 0, 0);

-- Ascendant Leather  AC: Vest=40,Cap=24,Sleeves=32,Bracers=8,Gloves=24,Pants=32 | DEX/AGI/CHA/INT=8
INSERT IGNORE INTO items
    (id,Name,lore,nodrop,norent,ac,astr,asta,aagi,adex,aint,awis,acha,
     itemtype,weight,size,classes,races,slots,magic,loregroup,reclevel,icon,idfile,material,color)
VALUES
(147662,'Ascendant Leather Cap',    'A cap of pristine drake leather.',              1,1,24,0,0,8,8,8,0,8,10,5,3,65535,65535,     4,1,-1,1, 640,'IT63', 0, 0),
(147663,'Ascendant Leather Vest',   'A vest of ascendant leather panels.',           1,1,40,0,0,8,8,8,0,8,10,9,3,65535,65535,131072,1,-1,1, 632,'IT63', 0, 0),
(147664,'Ascendant Leather Sleeves','Ascendant leather sleeves.',                    1,1,32,0,0,8,8,8,0,8,10,5,3,65535,65535,   128,1,-1,1, 634,'IT63', 0, 0),
(147665,'Ascendant Leather Bracers','Ascendant leather bracers.',                    1,1, 8,0,0,8,8,8,0,8,10,3,2,65535,65535,  1536,1,-1,1, 637,'IT63', 0, 0),
(147666,'Ascendant Leather Gloves', 'Ascendant leather gloves.',                     1,1,24,0,0,8,8,8,0,8,10,3,2,65535,65535,  4096,1,-1,1, 636,'IT63', 0, 0),
(147667,'Ascendant Leather Pants',  'Ascendant leather trousers.',                   1,1,32,0,0,8,8,8,0,8,10,7,3,65535,65535,262144,1,-1,1, 635,'IT63', 0, 0);

-- Ascendant Mail  AC: Hauberk=56,Coif=32,Sleeves=32,Bracers=16,Gloves=32,Leggings=32 | STR/DEX/WIS/INT=8
INSERT IGNORE INTO items
    (id,Name,lore,nodrop,norent,ac,astr,asta,aagi,adex,aint,awis,acha,
     itemtype,weight,size,classes,races,slots,magic,loregroup,reclevel,icon,idfile,material,color)
VALUES
(147668,'Ascendant Mail Coif',    'A coif of linked mithril rings.',                 1,1,32,8,0,0,8,8,8,0,10, 8,3,65535,65535,     4,1,-1,1, 625,'IT63', 0, 0),
(147669,'Ascendant Mail Hauberk', 'A hauberk of interlocked mithril chain.',         1,1,56,8,0,0,8,8,8,0,10,15,3,65535,65535,131072,1,-1,1, 538,'IT63', 0, 0),
(147670,'Ascendant Mail Sleeves', 'Mithril chain sleeves.',                           1,1,32,8,0,0,8,8,8,0,10, 8,3,65535,65535,   128,1,-1,1, 543,'IT63', 0, 0),
(147671,'Ascendant Mail Bracers', 'Mithril chain bracers.',                           1,1,16,8,0,0,8,8,8,0,10, 5,2,65535,65535,  1536,1,-1,1, 620,'IT63', 0, 0),
(147672,'Ascendant Mail Gloves',  'Mithril chain gloves.',                            1,1,32,8,0,0,8,8,8,0,10, 5,2,65535,65535,  4096,1,-1,1, 526,'IT63', 0, 0),
(147673,'Ascendant Mail Leggings','Mithril chain leggings.',                          1,1,32,8,0,0,8,8,8,0,10,12,3,65535,65535,262144,1,-1,1, 540,'IT63', 0, 0);

-- Ascendant Plate  AC: Breastplate=64,Helm=32,Vambraces=48,Bracers=16,Gauntlets=32,Legplates=48 | STR=8,STA=16,AGI=8
INSERT IGNORE INTO items
    (id,Name,lore,nodrop,norent,ac,astr,asta,aagi,adex,aint,awis,acha,
     itemtype,weight,size,classes,races,slots,magic,loregroup,reclevel,icon,idfile,material,color)
VALUES
(147674,'Ascendant Plate Helm',       'A helm of ascendant plate.',                  1,1,32, 8,16,8,0,0,0,0,10,12,4,65535,65535,     4,1,-1,1, 550,'IT63', 0, 0),
(147675,'Ascendant Plate Breastplate','A breastplate of ascendant plate.',           1,1,64, 8,16,8,0,0,0,0,10,22,4,65535,65535,131072,1,-1,1, 624,'IT63', 0, 0),
(147676,'Ascendant Plate Vambraces',  'Ascendant plate arm guards.',                 1,1,48, 8,16,8,0,0,0,0,10,12,4,65535,65535,   128,1,-1,1, 622,'IT63', 0, 0),
(147677,'Ascendant Plate Bracers',    'Ascendant plate wrist guards.',               1,1,16, 8,16,8,0,0,0,0,10, 7,3,65535,65535,  1536,1,-1,1, 516,'IT63', 0, 0),
(147678,'Ascendant Plate Gauntlets',  'Ascendant plate gauntlets.',                  1,1,32, 8,16,8,0,0,0,0,10, 7,3,65535,65535,  4096,1,-1,1, 531,'IT63', 0, 0),
(147679,'Ascendant Plate Legplates',  'Ascendant plate leg armor.',                  1,1,48, 8,16,8,0,0,0,0,10,17,4,65535,65535,262144,1,-1,1, 540,'IT63', 0, 0);


-- ── 2. RECIPES ───────────────────────────────────────────────────────────────
INSERT IGNORE INTO tradeskill_recipe
    (id,name,tradeskill,skillneeded,trivial,nofail,replace_container,enabled)
VALUES
(31269,'Bolt of Enchanted Silk',       63,0,155,0,0,1,
(31270,'Ascendant Leather Sheet',      63,0,155,0,0,1,
(31271,'Ascendant Refined Bar (Mail)', 63,0,158,0,0,1,
(31272,'Ascendant Refined Bar (Plate)',63,0,158,0,0,1,
(31273,'Arcane Cloth Padding',         63,0,170,0,0,1,
(31274,'Ascendant Leather Panel',      63,0,170,0,0,1,
(31275,'Mithril Ring',                 63,0,162,0,0,1,
(31276,'Ascendant Chain Bundle',       63,0,175,0,0,1,
(31277,'Mithril Sheet',                63,0,170,0,0,1,
(31278,'Ascendant Plate Section',      63,0,175,0,0,1,
(31279,'Ascendant Cloth Cap',          63,0,188,0,0,1,
(31280,'Ascendant Cloth Robe',         63,0,200,0,0,1,
(31281,'Ascendant Cloth Sleeves',      63,0,188,0,0,1,
(31282,'Ascendant Cloth Bracers',      63,0,185,0,0,1,
(31283,'Ascendant Cloth Gloves',       63,0,185,0,0,1,
(31284,'Ascendant Cloth Trousers',     63,0,193,0,0,1,
(31285,'Ascendant Leather Cap',        63,0,188,0,0,1,
(31286,'Ascendant Leather Vest',       63,0,200,0,0,1,
(31287,'Ascendant Leather Sleeves',    63,0,188,0,0,1,
(31288,'Ascendant Leather Bracers',    63,0,185,0,0,1,
(31289,'Ascendant Leather Gloves',     63,0,185,0,0,1,
(31290,'Ascendant Leather Pants',      63,0,193,0,0,1,
(31291,'Ascendant Mail Coif',          63,0,188,0,0,1,
(31292,'Ascendant Mail Hauberk',       63,0,200,0,0,1,
(31293,'Ascendant Mail Sleeves',       63,0,188,0,0,1,
(31294,'Ascendant Mail Bracers',       63,0,185,0,0,1,
(31295,'Ascendant Mail Gloves',        63,0,185,0,0,1,
(31296,'Ascendant Mail Leggings',      63,0,193,0,0,1,
(31297,'Ascendant Plate Helm',         63,0,188,0,0,1,
(31298,'Ascendant Plate Breastplate',  63,0,200,0,0,1,
(31299,'Ascendant Plate Vambraces',    63,0,188,0,0,1,
(31300,'Ascendant Plate Bracers',      63,0,185,0,0,1,
(31301,'Ascendant Plate Gauntlets',    63,0,185,0,0,1,
(31302,'Ascendant Plate Legplates',    63,0,193,0,0,1;


-- ── 3. RECIPE ENTRIES ────────────────────────────────────────────────────────

-- 31269: 2x Enchanted Fiber Bundle + 1x Enchanted Binding Thread → Bolt of Enchanted Silk
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31269,17,0,0,0, 0, 0),(31269,17909,0,0,0, 0, 0),(31269,17760,0,0,0, 0, 0),(31269,54253,0,0,0, 0, 0),(31269,54258,0,0,0, 0, 0),(31269,66625,0,0,0, 0, 0)
(31269,147636,0,0,2, 0, 0),(31269,147640,0,0,1, 0, 0),(31269,147647,1,0,0, 0, 0);

-- 31270: 2x Pristine Drake Hide + 1x Mystic Tanning Solution → Ascendant Leather Sheet
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31270,17,0,0,0, 0, 0),(31270,17909,0,0,0, 0, 0),(31270,17760,0,0,0, 0, 0),(31270,54253,0,0,0, 0, 0),(31270,54258,0,0,0, 0, 0),(31270,66625,0,0,0, 0, 0)
(31270,147637,0,0,2, 0, 0),(31270,147641,0,0,1, 0, 0),(31270,147649,1,0,0, 0, 0);

-- 31271: 2x Mithril Ore Shard + 1x Prime Celestial Flux → Ascendant Refined Bar
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31271,17,0,0,0, 0, 0),(31271,17909,0,0,0, 0, 0),(31271,17760,0,0,0, 0, 0),(31271,54253,0,0,0, 0, 0),(31271,54258,0,0,0, 0, 0),(31271,66625,0,0,0, 0, 0)
(31271,147638,0,0,2, 0, 0),(31271,147642,0,0,1, 0, 0),(31271,147651,1,0,0, 0, 0);

-- 31272: 2x Adamantite Ore Block + 1x Prime Celestial Flux → Ascendant Refined Bar
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31272,17,0,0,0, 0, 0),(31272,17909,0,0,0, 0, 0),(31272,17760,0,0,0, 0, 0),(31272,54253,0,0,0, 0, 0),(31272,54258,0,0,0, 0, 0),(31272,66625,0,0,0, 0, 0)
(31272,147639,0,0,2, 0, 0),(31272,147642,0,0,1, 0, 0),(31272,147651,1,0,0, 0, 0);

-- 31273: 2x Bolt of Enchanted Silk → Arcane Cloth Padding
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31273,17,0,0,0, 0, 0),(31273,17909,0,0,0, 0, 0),(31273,17760,0,0,0, 0, 0),(31273,54253,0,0,0, 0, 0),(31273,54258,0,0,0, 0, 0),(31273,66625,0,0,0, 0, 0)
(31273,147647,0,0,2, 0, 0),(31273,147648,1,0,0, 0, 0);

-- 31274: 2x Ascendant Leather Sheet → Ascendant Leather Panel
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31274,17,0,0,0, 0, 0),(31274,17909,0,0,0, 0, 0),(31274,17760,0,0,0, 0, 0),(31274,54253,0,0,0, 0, 0),(31274,54258,0,0,0, 0, 0),(31274,66625,0,0,0, 0, 0)
(31274,147649,0,0,2, 0, 0),(31274,147650,1,0,0, 0, 0);

-- 31275: 1x Ascendant Refined Bar → 6x Mithril Ring
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31275,17,0,0,0, 0, 0),(31275,17909,0,0,0, 0, 0),(31275,17760,0,0,0, 0, 0),(31275,54253,0,0,0, 0, 0),(31275,54258,0,0,0, 0, 0),(31275,66625,0,0,0, 0, 0)
(31275,147651,0,0,1, 0, 0),(31275,147652,6,0,0, 0, 0);

-- 31276: 6x Mithril Ring → Ascendant Chain Bundle
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31276,17,0,0,0, 0, 0),(31276,17909,0,0,0, 0, 0),(31276,17760,0,0,0, 0, 0),(31276,54253,0,0,0, 0, 0),(31276,54258,0,0,0, 0, 0),(31276,66625,0,0,0, 0, 0)
(31276,147652,0,0,6, 0, 0),(31276,147653,1,0,0, 0, 0);

-- 31277: 2x Ascendant Refined Bar → Mithril Sheet
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31277,17,0,0,0, 0, 0),(31277,17909,0,0,0, 0, 0),(31277,17760,0,0,0, 0, 0),(31277,54253,0,0,0, 0, 0),(31277,54258,0,0,0, 0, 0),(31277,66625,0,0,0, 0, 0)
(31277,147651,0,0,2, 0, 0),(31277,147654,1,0,0, 0, 0);

-- 31278: 2x Mithril Sheet → Ascendant Plate Section
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31278,17,0,0,0, 0, 0),(31278,17909,0,0,0, 0, 0),(31278,17760,0,0,0, 0, 0),(31278,54253,0,0,0, 0, 0),(31278,54258,0,0,0, 0, 0),(31278,66625,0,0,0, 0, 0)
(31278,147654,0,0,2, 0, 0),(31278,147655,1,0,0, 0, 0);

-- Cloth armor: Nx Arcane Cloth Padding (147648) + Pattern (147643,salvages) + Thread (147640) ────

-- 31279: Ascendant Cloth Cap — 2x Padding
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31279,17,0,0,0, 0, 0),(31279,17909,0,0,0, 0, 0),(31279,17760,0,0,0, 0, 0),(31279,54253,0,0,0, 0, 0),(31279,54258,0,0,0, 0, 0),(31279,66625,0,0,0, 0, 0)
(31279,147648,0,0,2, 0, 0),(31279,147643,0,0,1, 0, 0),(31279,147640,0,0,1, 0, 0),(31279,147656,1,0,0, 0, 0);

-- 31280: Ascendant Cloth Robe — 4x Padding
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31280,17,0,0,0, 0, 0),(31280,17909,0,0,0, 0, 0),(31280,17760,0,0,0, 0, 0),(31280,54253,0,0,0, 0, 0),(31280,54258,0,0,0, 0, 0),(31280,66625,0,0,0, 0, 0)
(31280,147648,0,0,4, 0, 0),(31280,147643,0,0,1, 0, 0),(31280,147640,0,0,1, 0, 0),(31280,147657,1,0,0, 0, 0);

-- 31281: Ascendant Cloth Sleeves — 2x Padding
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31281,17,0,0,0, 0, 0),(31281,17909,0,0,0, 0, 0),(31281,17760,0,0,0, 0, 0),(31281,54253,0,0,0, 0, 0),(31281,54258,0,0,0, 0, 0),(31281,66625,0,0,0, 0, 0)
(31281,147648,0,0,2, 0, 0),(31281,147643,0,0,1, 0, 0),(31281,147640,0,0,1, 0, 0),(31281,147658,1,0,0, 0, 0);

-- 31282: Ascendant Cloth Bracers — 1x Padding
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31282,17,0,0,0, 0, 0),(31282,17909,0,0,0, 0, 0),(31282,17760,0,0,0, 0, 0),(31282,54253,0,0,0, 0, 0),(31282,54258,0,0,0, 0, 0),(31282,66625,0,0,0, 0, 0)
(31282,147648,0,0,1, 0, 0),(31282,147643,0,0,1, 0, 0),(31282,147640,0,0,1, 0, 0),(31282,147659,1,0,0, 0, 0);

-- 31283: Ascendant Cloth Gloves — 1x Padding
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31283,17,0,0,0, 0, 0),(31283,17909,0,0,0, 0, 0),(31283,17760,0,0,0, 0, 0),(31283,54253,0,0,0, 0, 0),(31283,54258,0,0,0, 0, 0),(31283,66625,0,0,0, 0, 0)
(31283,147648,0,0,1, 0, 0),(31283,147643,0,0,1, 0, 0),(31283,147640,0,0,1, 0, 0),(31283,147660,1,0,0, 0, 0);

-- 31284: Ascendant Cloth Trousers — 3x Padding
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31284,17,0,0,0, 0, 0),(31284,17909,0,0,0, 0, 0),(31284,17760,0,0,0, 0, 0),(31284,54253,0,0,0, 0, 0),(31284,54258,0,0,0, 0, 0),(31284,66625,0,0,0, 0, 0)
(31284,147648,0,0,3, 0, 0),(31284,147643,0,0,1, 0, 0),(31284,147640,0,0,1, 0, 0),(31284,147661,1,0,0, 0, 0);

-- Leather armor: Nx Ascendant Leather Panel (147650) + Pattern (147644,salvages) + Solution (147641) ─

-- 31285: Ascendant Leather Cap — 2x Panel
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31285,17,0,0,0, 0, 0),(31285,17909,0,0,0, 0, 0),(31285,17760,0,0,0, 0, 0),(31285,54253,0,0,0, 0, 0),(31285,54258,0,0,0, 0, 0),(31285,66625,0,0,0, 0, 0)
(31285,147650,0,0,2, 0, 0),(31285,147644,0,0,1, 0, 0),(31285,147641,0,0,1, 0, 0),(31285,147662,1,0,0, 0, 0);

-- 31286: Ascendant Leather Vest — 4x Panel
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31286,17,0,0,0, 0, 0),(31286,17909,0,0,0, 0, 0),(31286,17760,0,0,0, 0, 0),(31286,54253,0,0,0, 0, 0),(31286,54258,0,0,0, 0, 0),(31286,66625,0,0,0, 0, 0)
(31286,147650,0,0,4, 0, 0),(31286,147644,0,0,1, 0, 0),(31286,147641,0,0,1, 0, 0),(31286,147663,1,0,0, 0, 0);

-- 31287: Ascendant Leather Sleeves — 2x Panel
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31287,17,0,0,0, 0, 0),(31287,17909,0,0,0, 0, 0),(31287,17760,0,0,0, 0, 0),(31287,54253,0,0,0, 0, 0),(31287,54258,0,0,0, 0, 0),(31287,66625,0,0,0, 0, 0)
(31287,147650,0,0,2, 0, 0),(31287,147644,0,0,1, 0, 0),(31287,147641,0,0,1, 0, 0),(31287,147664,1,0,0, 0, 0);

-- 31288: Ascendant Leather Bracers — 1x Panel
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31288,17,0,0,0, 0, 0),(31288,17909,0,0,0, 0, 0),(31288,17760,0,0,0, 0, 0),(31288,54253,0,0,0, 0, 0),(31288,54258,0,0,0, 0, 0),(31288,66625,0,0,0, 0, 0)
(31288,147650,0,0,1, 0, 0),(31288,147644,0,0,1, 0, 0),(31288,147641,0,0,1, 0, 0),(31288,147665,1,0,0, 0, 0);

-- 31289: Ascendant Leather Gloves — 1x Panel
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31289,17,0,0,0, 0, 0),(31289,17909,0,0,0, 0, 0),(31289,17760,0,0,0, 0, 0),(31289,54253,0,0,0, 0, 0),(31289,54258,0,0,0, 0, 0),(31289,66625,0,0,0, 0, 0)
(31289,147650,0,0,1, 0, 0),(31289,147644,0,0,1, 0, 0),(31289,147641,0,0,1, 0, 0),(31289,147666,1,0,0, 0, 0);

-- 31290: Ascendant Leather Pants — 3x Panel
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31290,17,0,0,0, 0, 0),(31290,17909,0,0,0, 0, 0),(31290,17760,0,0,0, 0, 0),(31290,54253,0,0,0, 0, 0),(31290,54258,0,0,0, 0, 0),(31290,66625,0,0,0, 0, 0)
(31290,147650,0,0,3, 0, 0),(31290,147644,0,0,1, 0, 0),(31290,147641,0,0,1, 0, 0),(31290,147667,1,0,0, 0, 0);

-- Mail armor: Nx Ascendant Chain Bundle (147653) + Pattern (147645,salvages) ────────────────────

-- 31291: Ascendant Mail Coif — 2x Bundle
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31291,17,0,0,0, 0, 0),(31291,17909,0,0,0, 0, 0),(31291,17760,0,0,0, 0, 0),(31291,54253,0,0,0, 0, 0),(31291,54258,0,0,0, 0, 0),(31291,66625,0,0,0, 0, 0)
(31291,147653,0,0,2, 0, 0),(31291,147645,0,0,1, 0, 0),(31291,147668,1,0,0, 0, 0);

-- 31292: Ascendant Mail Hauberk — 4x Bundle
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31292,17,0,0,0, 0, 0),(31292,17909,0,0,0, 0, 0),(31292,17760,0,0,0, 0, 0),(31292,54253,0,0,0, 0, 0),(31292,54258,0,0,0, 0, 0),(31292,66625,0,0,0, 0, 0)
(31292,147653,0,0,4, 0, 0),(31292,147645,0,0,1, 0, 0),(31292,147669,1,0,0, 0, 0);

-- 31293: Ascendant Mail Sleeves — 2x Bundle
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31293,17,0,0,0, 0, 0),(31293,17909,0,0,0, 0, 0),(31293,17760,0,0,0, 0, 0),(31293,54253,0,0,0, 0, 0),(31293,54258,0,0,0, 0, 0),(31293,66625,0,0,0, 0, 0)
(31293,147653,0,0,2, 0, 0),(31293,147645,0,0,1, 0, 0),(31293,147670,1,0,0, 0, 0);

-- 31294: Ascendant Mail Bracers — 1x Bundle
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31294,17,0,0,0, 0, 0),(31294,17909,0,0,0, 0, 0),(31294,17760,0,0,0, 0, 0),(31294,54253,0,0,0, 0, 0),(31294,54258,0,0,0, 0, 0),(31294,66625,0,0,0, 0, 0)
(31294,147653,0,0,1, 0, 0),(31294,147645,0,0,1, 0, 0),(31294,147671,1,0,0, 0, 0);

-- 31295: Ascendant Mail Gloves — 1x Bundle
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31295,17,0,0,0, 0, 0),(31295,17909,0,0,0, 0, 0),(31295,17760,0,0,0, 0, 0),(31295,54253,0,0,0, 0, 0),(31295,54258,0,0,0, 0, 0),(31295,66625,0,0,0, 0, 0)
(31295,147653,0,0,1, 0, 0),(31295,147645,0,0,1, 0, 0),(31295,147672,1,0,0, 0, 0);

-- 31296: Ascendant Mail Leggings — 3x Bundle
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31296,17,0,0,0, 0, 0),(31296,17909,0,0,0, 0, 0),(31296,17760,0,0,0, 0, 0),(31296,54253,0,0,0, 0, 0),(31296,54258,0,0,0, 0, 0),(31296,66625,0,0,0, 0, 0)
(31296,147653,0,0,3, 0, 0),(31296,147645,0,0,1, 0, 0),(31296,147673,1,0,0, 0, 0);

-- Plate armor: Nx Ascendant Plate Section (147655) + Pattern (147646,salvages) ──────────────────

-- 31297: Ascendant Plate Helm — 2x Section
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31297,17,0,0,0, 0, 0),(31297,17909,0,0,0, 0, 0),(31297,17760,0,0,0, 0, 0),(31297,54253,0,0,0, 0, 0),(31297,54258,0,0,0, 0, 0),(31297,66625,0,0,0, 0, 0)
(31297,147655,0,0,2, 0, 0),(31297,147646,0,0,1, 0, 0),(31297,147674,1,0,0, 0, 0);

-- 31298: Ascendant Plate Breastplate — 4x Section
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31298,17,0,0,0, 0, 0),(31298,17909,0,0,0, 0, 0),(31298,17760,0,0,0, 0, 0),(31298,54253,0,0,0, 0, 0),(31298,54258,0,0,0, 0, 0),(31298,66625,0,0,0, 0, 0)
(31298,147655,0,0,4, 0, 0),(31298,147646,0,0,1, 0, 0),(31298,147675,1,0,0, 0, 0);

-- 31299: Ascendant Plate Vambraces — 2x Section
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31299,17,0,0,0, 0, 0),(31299,17909,0,0,0, 0, 0),(31299,17760,0,0,0, 0, 0),(31299,54253,0,0,0, 0, 0),(31299,54258,0,0,0, 0, 0),(31299,66625,0,0,0, 0, 0)
(31299,147655,0,0,2, 0, 0),(31299,147646,0,0,1, 0, 0),(31299,147676,1,0,0, 0, 0);

-- 31300: Ascendant Plate Bracers — 1x Section
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31300,17,0,0,0, 0, 0),(31300,17909,0,0,0, 0, 0),(31300,17760,0,0,0, 0, 0),(31300,54253,0,0,0, 0, 0),(31300,54258,0,0,0, 0, 0),(31300,66625,0,0,0, 0, 0)
(31300,147655,0,0,1, 0, 0),(31300,147646,0,0,1, 0, 0),(31300,147677,1,0,0, 0, 0);

-- 31301: Ascendant Plate Gauntlets — 1x Section
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31301,17,0,0,0, 0, 0),(31301,17909,0,0,0, 0, 0),(31301,17760,0,0,0, 0, 0),(31301,54253,0,0,0, 0, 0),(31301,54258,0,0,0, 0, 0),(31301,66625,0,0,0, 0, 0)
(31301,147655,0,0,1, 0, 0),(31301,147646,0,0,1, 0, 0),(31301,147678,1,0,0, 0, 0);

-- 31302: Ascendant Plate Legplates — 3x Section
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31302,17,0,0,0, 0, 0),(31302,17909,0,0,0, 0, 0),(31302,17760,0,0,0, 0, 0),(31302,54253,0,0,0, 0, 0),(31302,54258,0,0,0, 0, 0),(31302,66625,0,0,0, 0, 0)
(31302,147655,0,0,3, 0, 0),(31302,147646,0,0,1, 0, 0),(31302,147679,1,0,0, 0, 0);
