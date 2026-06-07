-- ============================================================================
-- Tier 3: Tempered — Custom Blacksmithing System
-- ============================================================================
-- Items:   147592–147635
--   Drops/catalysts/patterns: 147592–147602
--   Intermediates:            147603–147611
--   Cloth armor:              147612–147617
--   Leather armor:            147618–147623
--   Mail armor:               147624–147629
--   Plate armor:              147630–147635
-- Recipes: 31235–31268
--   Refinement:    31235–31238
--   Intermediates: 31239–31244
--   Cloth armor:   31245–31250
--   Leather armor: 31251–31256
--   Mail armor:    31257–31262
--   Plate armor:   31263–31268
-- ============================================================================

-- ── 1. ITEMS ─────────────────────────────────────────────────────────────────

INSERT IGNORE INTO items
    (id,Name,lore,nodrop,norent,tradeskills,stackable,stacksize,
     icon,itemtype,weight,size,classes,races,slots,magic,loregroup,reclevel)
VALUES
(147592,'Fine Silk Fibers',          'Delicate fibers spun from fine silk.',        1,1,1,1,20,532,17,1,1,65535,65535,0,0, 0, 0),
(147593,'Supple Drake Hide',         'A supple hide taken from a young drake.',     1,1,1,1,20,533,17,3,1,65535,65535,0,0, 0, 0),
(147594,'Steel-Veined Ore Shard',    'An ore shard shot through with steel.',       1,1,1,1,20,640,17,5,1,65535,65535,0,0, 0, 0),
(147595,'High-Grade Ore Block',      'A dense block of high-grade ore.',            1,1,1,1,20,641,17,8,1,65535,65535,0,0, 0, 0),
(147596,'Strong Silk Thread',        'Tightly twisted thread of strong silk.',      1,1,1,1,20,650,17,1,1,65535,65535,0,0, 0, 0),
(147597,'Superior Tanning Solution', 'A superior solution for tanning drake hide.', 1,1,1,1,20,845,17,1,1,65535,65535,0,0, 0, 0),
(147598,'High-Grade Tempering Flux', 'A high-grade flux for steel metalwork.',      1,1,1,1,20,645,17,1,1,65535,65535,0,0, 0, 0),
(147599,'Tempered Cloth Pattern',    'A precise template for tempered cloth.',      1,1,1,1,20,651,17,1,1,65535,65535,0,0, 0, 0),
(147600,'Tempered Leather Pattern',  'A precise template for tempered leather.',    1,1,1,1,20,651,17,1,1,65535,65535,0,0, 0, 0),
(147601,'Tempered Mail Pattern',     'A precise template for tempered mail.',       1,1,1,1,20,651,17,1,1,65535,65535,0,0, 0, 0),
(147602,'Tempered Plate Pattern',    'A precise template for tempered plate.',      1,1,1,1,20,651,17,1,1,65535,65535,0,0, 0, 0);

INSERT IGNORE INTO items
    (id,Name,lore,nodrop,norent,tradeskills,stackable,stacksize,
     icon,itemtype,weight,size,classes,races,slots,magic,loregroup,reclevel)
VALUES
(147603,'Bolt of Fine Silk',      'Lengths of fine silk ready to be shaped.',      1,1,1,1,10,532,17, 2,2,65535,65535,0,0, 0, 0),
(147604,'Silk-Quilted Pad',       'A thick quilted pad of layered fine silk.',     1,1,1,1,10,532,17, 3,2,65535,65535,0,0, 0, 0),
(147605,'Tempered Leather Sheet', 'A sheet of tempered, heat-treated leather.',    1,1,1,1,10,534,17, 5,2,65535,65535,0,0, 0, 0),
(147606,'Tempered Leather Panel', 'A tempered leather panel ready to stitch.',     1,1,1,1,10,534,17, 7,2,65535,65535,0,0, 0, 0),
(147607,'Steel Alloy Bar',        'A bar of refined steel alloy.',                 1,1,1,1,10,643,17,15,2,65535,65535,0,0, 0, 0),
(147608,'Steel Ring',             'A precision steel ring for chainmail.',         1,1,1,1,20,644,17, 2,1,65535,65535,0,0, 0, 0),
(147609,'Tempered Chain Bundle',  'A bundle of linked steel rings.',               1,1,1,1,10,644,17,10,2,65535,65535,0,0, 0, 0),
(147610,'Steel Metal Sheet',      'A flat sheet of forged steel.',                 1,1,1,1,10,643,17,20,2,65535,65535,0,0, 0, 0),
(147611,'Hardened Plate Section', 'A hardened steel plate section.',               1,1,1,1,10,643,17,30,2,65535,65535,0,0, 0, 0);

-- Tempered Cloth  AC: Robe=16,Cap=8,Sleeves=12,Bracers=8,Gloves=12,Trousers=12 | INT/WIS/CHA/STA=4
INSERT IGNORE INTO items
    (id,Name,lore,nodrop,norent,ac,astr,asta,aagi,adex,aint,awis,acha,
     itemtype,weight,size,classes,races,slots,magic,loregroup,reclevel,icon,idfile,material,color)
VALUES
(147612,'Tempered Cloth Cap',    'A cap woven from fine silk cloth.',               1,1, 8,0,4,0,0,4,4,4,10,3,3,65535,65535,     4,1,-1,1, 641,'IT63', 0, 0),
(147613,'Tempered Cloth Robe',   'A robe of finely tempered silk cloth.',           1,1,16,0,4,0,0,4,4,4,10,5,3,65535,65535,131072,1,-1,1, 838,'IT63', 0, 0),
(147614,'Tempered Cloth Sleeves','Tempered silk cloth sleeves.',                    1,1,12,0,4,0,0,4,4,4,10,3,3,65535,65535,   128,1,-1,1, 670,'IT63', 0, 0),
(147615,'Tempered Cloth Bracers','Tempered silk cloth bracers.',                    1,1, 8,0,4,0,0,4,4,4,10,2,2,65535,65535,  1536,1,-1,1, 638,'IT63', 0, 0),
(147616,'Tempered Cloth Gloves', 'Fine silk cloth gloves.',                         1,1,12,0,4,0,0,4,4,4,10,2,2,65535,65535,  4096,1,-1,1, 517,'IT63', 0, 0),
(147617,'Tempered Cloth Trousers','Tempered silk cloth trousers.',                  1,1,12,0,4,0,0,4,4,4,10,4,3,65535,65535,262144,1,-1,1, 631,'IT63', 0, 0);

-- Tempered Leather  AC: Vest=20,Cap=12,Sleeves=16,Bracers=4,Gloves=12,Pants=16 | DEX/AGI/CHA/INT=4
INSERT IGNORE INTO items
    (id,Name,lore,nodrop,norent,ac,astr,asta,aagi,adex,aint,awis,acha,
     itemtype,weight,size,classes,races,slots,magic,loregroup,reclevel,icon,idfile,material,color)
VALUES
(147618,'Tempered Leather Cap',    'A cap of tempered drake leather.',              1,1,12,0,0,4,4,4,0,4,10,5,3,65535,65535,     4,1,-1,1, 640,'IT63', 0, 0),
(147619,'Tempered Leather Vest',   'A vest of tempered leather panels.',            1,1,20,0,0,4,4,4,0,4,10,9,3,65535,65535,131072,1,-1,1, 632,'IT63', 0, 0),
(147620,'Tempered Leather Sleeves','Tempered leather sleeves.',                     1,1,16,0,0,4,4,4,0,4,10,5,3,65535,65535,   128,1,-1,1, 634,'IT63', 0, 0),
(147621,'Tempered Leather Bracers','Tempered leather bracers.',                     1,1, 4,0,0,4,4,4,0,4,10,3,2,65535,65535,  1536,1,-1,1, 637,'IT63', 0, 0),
(147622,'Tempered Leather Gloves', 'Tempered leather gloves.',                      1,1,12,0,0,4,4,4,0,4,10,3,2,65535,65535,  4096,1,-1,1, 636,'IT63', 0, 0),
(147623,'Tempered Leather Pants',  'Tempered leather trousers.',                    1,1,16,0,0,4,4,4,0,4,10,7,3,65535,65535,262144,1,-1,1, 635,'IT63', 0, 0);

-- Tempered Mail  AC: Hauberk=28,Coif=16,Sleeves=16,Bracers=8,Gloves=16,Leggings=16 | STR/DEX/WIS/INT=4
INSERT IGNORE INTO items
    (id,Name,lore,nodrop,norent,ac,astr,asta,aagi,adex,aint,awis,acha,
     itemtype,weight,size,classes,races,slots,magic,loregroup,reclevel,icon,idfile,material,color)
VALUES
(147624,'Tempered Mail Coif',    'A coif of tempered steel rings.',                 1,1,16,4,0,0,4,4,4,0,10, 8,3,65535,65535,     4,1,-1,1, 625,'IT63', 0, 0),
(147625,'Tempered Mail Hauberk', 'A hauberk of tempered steel chain.',              1,1,28,4,0,0,4,4,4,0,10,15,3,65535,65535,131072,1,-1,1, 538,'IT63', 0, 0),
(147626,'Tempered Mail Sleeves', 'Tempered steel chain sleeves.',                   1,1,16,4,0,0,4,4,4,0,10, 8,3,65535,65535,   128,1,-1,1, 543,'IT63', 0, 0),
(147627,'Tempered Mail Bracers', 'Tempered steel chain bracers.',                   1,1, 8,4,0,0,4,4,4,0,10, 5,2,65535,65535,  1536,1,-1,1, 620,'IT63', 0, 0),
(147628,'Tempered Mail Gloves',  'Tempered steel chain gloves.',                    1,1,16,4,0,0,4,4,4,0,10, 5,2,65535,65535,  4096,1,-1,1, 526,'IT63', 0, 0),
(147629,'Tempered Mail Leggings','Tempered steel chain leggings.',                  1,1,16,4,0,0,4,4,4,0,10,12,3,65535,65535,262144,1,-1,1, 540,'IT63', 0, 0);

-- Tempered Plate  AC: Breastplate=32,Helm=16,Vambraces=24,Bracers=8,Gauntlets=16,Legplates=24 | STR=4,STA=8,AGI=4
INSERT IGNORE INTO items
    (id,Name,lore,nodrop,norent,ac,astr,asta,aagi,adex,aint,awis,acha,
     itemtype,weight,size,classes,races,slots,magic,loregroup,reclevel,icon,idfile,material,color)
VALUES
(147630,'Tempered Plate Helm',       'A precisely forged plate helm.',              1,1,16,4,8,4,0,0,0,0,10,12,4,65535,65535,     4,1,-1,1, 550,'IT63', 0, 0),
(147631,'Tempered Plate Breastplate','A precisely forged plate breastplate.',       1,1,32,4,8,4,0,0,0,0,10,22,4,65535,65535,131072,1,-1,1, 624,'IT63', 0, 0),
(147632,'Tempered Plate Vambraces',  'Tempered plate arm guards.',                  1,1,24,4,8,4,0,0,0,0,10,12,4,65535,65535,   128,1,-1,1, 622,'IT63', 0, 0),
(147633,'Tempered Plate Bracers',    'Tempered plate wrist guards.',                1,1, 8,4,8,4,0,0,0,0,10, 7,3,65535,65535,  1536,1,-1,1, 516,'IT63', 0, 0),
(147634,'Tempered Plate Gauntlets',  'Precisely forged plate gauntlets.',           1,1,16,4,8,4,0,0,0,0,10, 7,3,65535,65535,  4096,1,-1,1, 531,'IT63', 0, 0),
(147635,'Tempered Plate Legplates',  'Tempered plate leg armor.',                   1,1,24,4,8,4,0,0,0,0,10,17,4,65535,65535,262144,1,-1,1, 540,'IT63', 0, 0);


-- ── 2. RECIPES ───────────────────────────────────────────────────────────────
INSERT IGNORE INTO tradeskill_recipe
    (id,name,tradeskill,skillneeded,trivial,nofail,replace_container,enabled)
VALUES
(31235,'Bolt of Fine Silk',            63,0,105,0,0,1,
(31236,'Tempered Leather Sheet',       63,0,105,0,0,1,
(31237,'Steel Alloy Bar (Mail)',        63,0,108,0,0,1,
(31238,'Steel Alloy Bar (Plate)',       63,0,108,0,0,1,
(31239,'Silk-Quilted Pad',             63,0,120,0,0,1,
(31240,'Tempered Leather Panel',       63,0,120,0,0,1,
(31241,'Steel Ring',                   63,0,112,0,0,1,
(31242,'Tempered Chain Bundle',        63,0,125,0,0,1,
(31243,'Steel Metal Sheet',            63,0,120,0,0,1,
(31244,'Hardened Plate Section',       63,0,125,0,0,1,
(31245,'Tempered Cloth Cap',           63,0,138,0,0,1,
(31246,'Tempered Cloth Robe',          63,0,150,0,0,1,
(31247,'Tempered Cloth Sleeves',       63,0,138,0,0,1,
(31248,'Tempered Cloth Bracers',       63,0,135,0,0,1,
(31249,'Tempered Cloth Gloves',        63,0,135,0,0,1,
(31250,'Tempered Cloth Trousers',      63,0,142,0,0,1,
(31251,'Tempered Leather Cap',         63,0,138,0,0,1,
(31252,'Tempered Leather Vest',        63,0,150,0,0,1,
(31253,'Tempered Leather Sleeves',     63,0,138,0,0,1,
(31254,'Tempered Leather Bracers',     63,0,135,0,0,1,
(31255,'Tempered Leather Gloves',      63,0,135,0,0,1,
(31256,'Tempered Leather Pants',       63,0,142,0,0,1,
(31257,'Tempered Mail Coif',           63,0,138,0,0,1,
(31258,'Tempered Mail Hauberk',        63,0,150,0,0,1,
(31259,'Tempered Mail Sleeves',        63,0,138,0,0,1,
(31260,'Tempered Mail Bracers',        63,0,135,0,0,1,
(31261,'Tempered Mail Gloves',         63,0,135,0,0,1,
(31262,'Tempered Mail Leggings',       63,0,142,0,0,1,
(31263,'Tempered Plate Helm',          63,0,138,0,0,1,
(31264,'Tempered Plate Breastplate',   63,0,150,0,0,1,
(31265,'Tempered Plate Vambraces',     63,0,138,0,0,1,
(31266,'Tempered Plate Bracers',       63,0,135,0,0,1,
(31267,'Tempered Plate Gauntlets',     63,0,135,0,0,1,
(31268,'Tempered Plate Legplates',     63,0,142,0,0,1;


-- ── 3. RECIPE ENTRIES ────────────────────────────────────────────────────────

-- 31235: 2x Fine Silk Fibers + 1x Strong Silk Thread → Bolt of Fine Silk
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31235,17,0,0,0, 0, 0),(31235,17909,0,0,0, 0, 0),(31235,17760,0,0,0, 0, 0),(31235,54253,0,0,0, 0, 0),(31235,54258,0,0,0, 0, 0),(31235,66625,0,0,0, 0, 0)
(31235,147592,0,0,2, 0, 0),(31235,147596,0,0,1, 0, 0),(31235,147603,1,0,0, 0, 0);

-- 31236: 2x Supple Drake Hide + 1x Superior Tanning Solution → Tempered Leather Sheet
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31236,17,0,0,0, 0, 0),(31236,17909,0,0,0, 0, 0),(31236,17760,0,0,0, 0, 0),(31236,54253,0,0,0, 0, 0),(31236,54258,0,0,0, 0, 0),(31236,66625,0,0,0, 0, 0)
(31236,147593,0,0,2, 0, 0),(31236,147597,0,0,1, 0, 0),(31236,147605,1,0,0, 0, 0);

-- 31237: 2x Steel-Veined Ore Shard + 1x High-Grade Tempering Flux → Steel Alloy Bar
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31237,17,0,0,0, 0, 0),(31237,17909,0,0,0, 0, 0),(31237,17760,0,0,0, 0, 0),(31237,54253,0,0,0, 0, 0),(31237,54258,0,0,0, 0, 0),(31237,66625,0,0,0, 0, 0)
(31237,147594,0,0,2, 0, 0),(31237,147598,0,0,1, 0, 0),(31237,147607,1,0,0, 0, 0);

-- 31238: 2x High-Grade Ore Block + 1x High-Grade Tempering Flux → Steel Alloy Bar
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31238,17,0,0,0, 0, 0),(31238,17909,0,0,0, 0, 0),(31238,17760,0,0,0, 0, 0),(31238,54253,0,0,0, 0, 0),(31238,54258,0,0,0, 0, 0),(31238,66625,0,0,0, 0, 0)
(31238,147595,0,0,2, 0, 0),(31238,147598,0,0,1, 0, 0),(31238,147607,1,0,0, 0, 0);

-- 31239: 2x Bolt of Fine Silk → Silk-Quilted Pad
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31239,17,0,0,0, 0, 0),(31239,17909,0,0,0, 0, 0),(31239,17760,0,0,0, 0, 0),(31239,54253,0,0,0, 0, 0),(31239,54258,0,0,0, 0, 0),(31239,66625,0,0,0, 0, 0)
(31239,147603,0,0,2, 0, 0),(31239,147604,1,0,0, 0, 0);

-- 31240: 2x Tempered Leather Sheet → Tempered Leather Panel
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31240,17,0,0,0, 0, 0),(31240,17909,0,0,0, 0, 0),(31240,17760,0,0,0, 0, 0),(31240,54253,0,0,0, 0, 0),(31240,54258,0,0,0, 0, 0),(31240,66625,0,0,0, 0, 0)
(31240,147605,0,0,2, 0, 0),(31240,147606,1,0,0, 0, 0);

-- 31241: 1x Steel Alloy Bar → 6x Steel Ring
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31241,17,0,0,0, 0, 0),(31241,17909,0,0,0, 0, 0),(31241,17760,0,0,0, 0, 0),(31241,54253,0,0,0, 0, 0),(31241,54258,0,0,0, 0, 0),(31241,66625,0,0,0, 0, 0)
(31241,147607,0,0,1, 0, 0),(31241,147608,6,0,0, 0, 0);

-- 31242: 6x Steel Ring → Tempered Chain Bundle
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31242,17,0,0,0, 0, 0),(31242,17909,0,0,0, 0, 0),(31242,17760,0,0,0, 0, 0),(31242,54253,0,0,0, 0, 0),(31242,54258,0,0,0, 0, 0),(31242,66625,0,0,0, 0, 0)
(31242,147608,0,0,6, 0, 0),(31242,147609,1,0,0, 0, 0);

-- 31243: 2x Steel Alloy Bar → Steel Metal Sheet
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31243,17,0,0,0, 0, 0),(31243,17909,0,0,0, 0, 0),(31243,17760,0,0,0, 0, 0),(31243,54253,0,0,0, 0, 0),(31243,54258,0,0,0, 0, 0),(31243,66625,0,0,0, 0, 0)
(31243,147607,0,0,2, 0, 0),(31243,147610,1,0,0, 0, 0);

-- 31244: 2x Steel Metal Sheet → Hardened Plate Section
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31244,17,0,0,0, 0, 0),(31244,17909,0,0,0, 0, 0),(31244,17760,0,0,0, 0, 0),(31244,54253,0,0,0, 0, 0),(31244,54258,0,0,0, 0, 0),(31244,66625,0,0,0, 0, 0)
(31244,147610,0,0,2, 0, 0),(31244,147611,1,0,0, 0, 0);

-- Cloth armor: Nx Silk-Quilted Pad (147604) + Pattern (147599,salvages) + Thread (147596) ────────

-- 31245: Tempered Cloth Cap — 2x Pad
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31245,17,0,0,0, 0, 0),(31245,17909,0,0,0, 0, 0),(31245,17760,0,0,0, 0, 0),(31245,54253,0,0,0, 0, 0),(31245,54258,0,0,0, 0, 0),(31245,66625,0,0,0, 0, 0)
(31245,147604,0,0,2, 0, 0),(31245,147599,0,0,1, 0, 0),(31245,147596,0,0,1, 0, 0),(31245,147612,1,0,0, 0, 0);

-- 31246: Tempered Cloth Robe — 4x Pad
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31246,17,0,0,0, 0, 0),(31246,17909,0,0,0, 0, 0),(31246,17760,0,0,0, 0, 0),(31246,54253,0,0,0, 0, 0),(31246,54258,0,0,0, 0, 0),(31246,66625,0,0,0, 0, 0)
(31246,147604,0,0,4, 0, 0),(31246,147599,0,0,1, 0, 0),(31246,147596,0,0,1, 0, 0),(31246,147613,1,0,0, 0, 0);

-- 31247: Tempered Cloth Sleeves — 2x Pad
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31247,17,0,0,0, 0, 0),(31247,17909,0,0,0, 0, 0),(31247,17760,0,0,0, 0, 0),(31247,54253,0,0,0, 0, 0),(31247,54258,0,0,0, 0, 0),(31247,66625,0,0,0, 0, 0)
(31247,147604,0,0,2, 0, 0),(31247,147599,0,0,1, 0, 0),(31247,147596,0,0,1, 0, 0),(31247,147614,1,0,0, 0, 0);

-- 31248: Tempered Cloth Bracers — 1x Pad
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31248,17,0,0,0, 0, 0),(31248,17909,0,0,0, 0, 0),(31248,17760,0,0,0, 0, 0),(31248,54253,0,0,0, 0, 0),(31248,54258,0,0,0, 0, 0),(31248,66625,0,0,0, 0, 0)
(31248,147604,0,0,1, 0, 0),(31248,147599,0,0,1, 0, 0),(31248,147596,0,0,1, 0, 0),(31248,147615,1,0,0, 0, 0);

-- 31249: Tempered Cloth Gloves — 1x Pad
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31249,17,0,0,0, 0, 0),(31249,17909,0,0,0, 0, 0),(31249,17760,0,0,0, 0, 0),(31249,54253,0,0,0, 0, 0),(31249,54258,0,0,0, 0, 0),(31249,66625,0,0,0, 0, 0)
(31249,147604,0,0,1, 0, 0),(31249,147599,0,0,1, 0, 0),(31249,147596,0,0,1, 0, 0),(31249,147616,1,0,0, 0, 0);

-- 31250: Tempered Cloth Trousers — 3x Pad
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31250,17,0,0,0, 0, 0),(31250,17909,0,0,0, 0, 0),(31250,17760,0,0,0, 0, 0),(31250,54253,0,0,0, 0, 0),(31250,54258,0,0,0, 0, 0),(31250,66625,0,0,0, 0, 0)
(31250,147604,0,0,3, 0, 0),(31250,147599,0,0,1, 0, 0),(31250,147596,0,0,1, 0, 0),(31250,147617,1,0,0, 0, 0);

-- Leather armor: Nx Tempered Leather Panel (147606) + Pattern (147600,salvages) + Solution (147597) ─

-- 31251: Tempered Leather Cap — 2x Panel
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31251,17,0,0,0, 0, 0),(31251,17909,0,0,0, 0, 0),(31251,17760,0,0,0, 0, 0),(31251,54253,0,0,0, 0, 0),(31251,54258,0,0,0, 0, 0),(31251,66625,0,0,0, 0, 0)
(31251,147606,0,0,2, 0, 0),(31251,147600,0,0,1, 0, 0),(31251,147597,0,0,1, 0, 0),(31251,147618,1,0,0, 0, 0);

-- 31252: Tempered Leather Vest — 4x Panel
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31252,17,0,0,0, 0, 0),(31252,17909,0,0,0, 0, 0),(31252,17760,0,0,0, 0, 0),(31252,54253,0,0,0, 0, 0),(31252,54258,0,0,0, 0, 0),(31252,66625,0,0,0, 0, 0)
(31252,147606,0,0,4, 0, 0),(31252,147600,0,0,1, 0, 0),(31252,147597,0,0,1, 0, 0),(31252,147619,1,0,0, 0, 0);

-- 31253: Tempered Leather Sleeves — 2x Panel
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31253,17,0,0,0, 0, 0),(31253,17909,0,0,0, 0, 0),(31253,17760,0,0,0, 0, 0),(31253,54253,0,0,0, 0, 0),(31253,54258,0,0,0, 0, 0),(31253,66625,0,0,0, 0, 0)
(31253,147606,0,0,2, 0, 0),(31253,147600,0,0,1, 0, 0),(31253,147597,0,0,1, 0, 0),(31253,147620,1,0,0, 0, 0);

-- 31254: Tempered Leather Bracers — 1x Panel
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31254,17,0,0,0, 0, 0),(31254,17909,0,0,0, 0, 0),(31254,17760,0,0,0, 0, 0),(31254,54253,0,0,0, 0, 0),(31254,54258,0,0,0, 0, 0),(31254,66625,0,0,0, 0, 0)
(31254,147606,0,0,1, 0, 0),(31254,147600,0,0,1, 0, 0),(31254,147597,0,0,1, 0, 0),(31254,147621,1,0,0, 0, 0);

-- 31255: Tempered Leather Gloves — 1x Panel
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31255,17,0,0,0, 0, 0),(31255,17909,0,0,0, 0, 0),(31255,17760,0,0,0, 0, 0),(31255,54253,0,0,0, 0, 0),(31255,54258,0,0,0, 0, 0),(31255,66625,0,0,0, 0, 0)
(31255,147606,0,0,1, 0, 0),(31255,147600,0,0,1, 0, 0),(31255,147597,0,0,1, 0, 0),(31255,147622,1,0,0, 0, 0);

-- 31256: Tempered Leather Pants — 3x Panel
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31256,17,0,0,0, 0, 0),(31256,17909,0,0,0, 0, 0),(31256,17760,0,0,0, 0, 0),(31256,54253,0,0,0, 0, 0),(31256,54258,0,0,0, 0, 0),(31256,66625,0,0,0, 0, 0)
(31256,147606,0,0,3, 0, 0),(31256,147600,0,0,1, 0, 0),(31256,147597,0,0,1, 0, 0),(31256,147623,1,0,0, 0, 0);

-- Mail armor: Nx Tempered Chain Bundle (147609) + Pattern (147601,salvages) ──────────────────────

-- 31257: Tempered Mail Coif — 2x Bundle
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31257,17,0,0,0, 0, 0),(31257,17909,0,0,0, 0, 0),(31257,17760,0,0,0, 0, 0),(31257,54253,0,0,0, 0, 0),(31257,54258,0,0,0, 0, 0),(31257,66625,0,0,0, 0, 0)
(31257,147609,0,0,2, 0, 0),(31257,147601,0,0,1, 0, 0),(31257,147624,1,0,0, 0, 0);

-- 31258: Tempered Mail Hauberk — 4x Bundle
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31258,17,0,0,0, 0, 0),(31258,17909,0,0,0, 0, 0),(31258,17760,0,0,0, 0, 0),(31258,54253,0,0,0, 0, 0),(31258,54258,0,0,0, 0, 0),(31258,66625,0,0,0, 0, 0)
(31258,147609,0,0,4, 0, 0),(31258,147601,0,0,1, 0, 0),(31258,147625,1,0,0, 0, 0);

-- 31259: Tempered Mail Sleeves — 2x Bundle
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31259,17,0,0,0, 0, 0),(31259,17909,0,0,0, 0, 0),(31259,17760,0,0,0, 0, 0),(31259,54253,0,0,0, 0, 0),(31259,54258,0,0,0, 0, 0),(31259,66625,0,0,0, 0, 0)
(31259,147609,0,0,2, 0, 0),(31259,147601,0,0,1, 0, 0),(31259,147626,1,0,0, 0, 0);

-- 31260: Tempered Mail Bracers — 1x Bundle
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31260,17,0,0,0, 0, 0),(31260,17909,0,0,0, 0, 0),(31260,17760,0,0,0, 0, 0),(31260,54253,0,0,0, 0, 0),(31260,54258,0,0,0, 0, 0),(31260,66625,0,0,0, 0, 0)
(31260,147609,0,0,1, 0, 0),(31260,147601,0,0,1, 0, 0),(31260,147627,1,0,0, 0, 0);

-- 31261: Tempered Mail Gloves — 1x Bundle
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31261,17,0,0,0, 0, 0),(31261,17909,0,0,0, 0, 0),(31261,17760,0,0,0, 0, 0),(31261,54253,0,0,0, 0, 0),(31261,54258,0,0,0, 0, 0),(31261,66625,0,0,0, 0, 0)
(31261,147609,0,0,1, 0, 0),(31261,147601,0,0,1, 0, 0),(31261,147628,1,0,0, 0, 0);

-- 31262: Tempered Mail Leggings — 3x Bundle
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31262,17,0,0,0, 0, 0),(31262,17909,0,0,0, 0, 0),(31262,17760,0,0,0, 0, 0),(31262,54253,0,0,0, 0, 0),(31262,54258,0,0,0, 0, 0),(31262,66625,0,0,0, 0, 0)
(31262,147609,0,0,3, 0, 0),(31262,147601,0,0,1, 0, 0),(31262,147629,1,0,0, 0, 0);

-- Plate armor: Nx Hardened Plate Section (147611) + Pattern (147602,salvages) ────────────────────

-- 31263: Tempered Plate Helm — 2x Section
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31263,17,0,0,0, 0, 0),(31263,17909,0,0,0, 0, 0),(31263,17760,0,0,0, 0, 0),(31263,54253,0,0,0, 0, 0),(31263,54258,0,0,0, 0, 0),(31263,66625,0,0,0, 0, 0)
(31263,147611,0,0,2, 0, 0),(31263,147602,0,0,1, 0, 0),(31263,147630,1,0,0, 0, 0);

-- 31264: Tempered Plate Breastplate — 4x Section
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31264,17,0,0,0, 0, 0),(31264,17909,0,0,0, 0, 0),(31264,17760,0,0,0, 0, 0),(31264,54253,0,0,0, 0, 0),(31264,54258,0,0,0, 0, 0),(31264,66625,0,0,0, 0, 0)
(31264,147611,0,0,4, 0, 0),(31264,147602,0,0,1, 0, 0),(31264,147631,1,0,0, 0, 0);

-- 31265: Tempered Plate Vambraces — 2x Section
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31265,17,0,0,0, 0, 0),(31265,17909,0,0,0, 0, 0),(31265,17760,0,0,0, 0, 0),(31265,54253,0,0,0, 0, 0),(31265,54258,0,0,0, 0, 0),(31265,66625,0,0,0, 0, 0)
(31265,147611,0,0,2, 0, 0),(31265,147602,0,0,1, 0, 0),(31265,147632,1,0,0, 0, 0);

-- 31266: Tempered Plate Bracers — 1x Section
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31266,17,0,0,0, 0, 0),(31266,17909,0,0,0, 0, 0),(31266,17760,0,0,0, 0, 0),(31266,54253,0,0,0, 0, 0),(31266,54258,0,0,0, 0, 0),(31266,66625,0,0,0, 0, 0)
(31266,147611,0,0,1, 0, 0),(31266,147602,0,0,1, 0, 0),(31266,147633,1,0,0, 0, 0);

-- 31267: Tempered Plate Gauntlets — 1x Section
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31267,17,0,0,0, 0, 0),(31267,17909,0,0,0, 0, 0),(31267,17760,0,0,0, 0, 0),(31267,54253,0,0,0, 0, 0),(31267,54258,0,0,0, 0, 0),(31267,66625,0,0,0, 0, 0)
(31267,147611,0,0,1, 0, 0),(31267,147602,0,0,1, 0, 0),(31267,147634,1,0,0, 0, 0);

-- 31268: Tempered Plate Legplates — 3x Section
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31268,17,0,0,0, 0, 0),(31268,17909,0,0,0, 0, 0),(31268,17760,0,0,0, 0, 0),(31268,54253,0,0,0, 0, 0),(31268,54258,0,0,0, 0, 0),(31268,66625,0,0,0, 0, 0)
(31268,147611,0,0,3, 0, 0),(31268,147602,0,0,1, 0, 0),(31268,147635,1,0,0, 0, 0);
