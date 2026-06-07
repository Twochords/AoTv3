-- ============================================================================
-- Tier 2: Reinforced — Custom Blacksmithing System
-- ============================================================================
-- Items:   147548–147591
--   Drops/catalysts/patterns: 147548–147558
--   Intermediates:            147559–147567
--   Cloth armor:              147568–147573
--   Leather armor:            147574–147579
--   Mail armor:               147580–147585
--   Plate armor:              147586–147591
-- Recipes: 31201–31234
--   Refinement:    31201–31204
--   Intermediates: 31205–31210
--   Cloth armor:   31211–31216
--   Leather armor: 31217–31222
--   Mail armor:    31223–31228
--   Plate armor:   31229–31234
-- ============================================================================

-- ── 1. ITEMS ─────────────────────────────────────────────────────────────────

-- Drop items: raw materials (stacksize=20) + patterns (stacksize=20) + catalysts (stacksize=20)
INSERT IGNORE INTO items
    (id,Name,lore,nodrop,norent,tradeskills,stackable,stacksize,
     icon,itemtype,weight,size,classes,races,slots,magic,loregroup,reclevel)
VALUES
(147548,'Coarse Fiber Bundle',      'A dense bundle of coarse fiber.',            1,1,1,1,20,532,17,1,1,65535,65535,0,0, 0, 0),
(147549,'Thick Animal Pelt',        'A thick pelt stripped from a large beast.',  1,1,1,1,20,533,17,3,1,65535,65535,0,0, 0, 0),
(147550,'Iron-Laced Ore Fragment',  'An ore fragment laced with veins of iron.',  1,1,1,1,20,640,17,5,1,65535,65535,0,0, 0, 0),
(147551,'Dense Iron Ore',           'A dense chunk of iron-rich ore.',            1,1,1,1,20,641,17,8,1,65535,65535,0,0, 0, 0),
(147552,'Coarse Linen Thread',      'Sturdy linen thread for heavier cloth.',     1,1,1,1,20,650,17,1,1,65535,65535,0,0, 0, 0),
(147553,'Moderate Tanning Solution','A stronger tanning agent for thick hides.',  1,1,1,1,20,845,17,1,1,65535,65535,0,0, 0, 0),
(147554,'Standard Tempering Flux',  'A standard flux for iron metalwork.',        1,1,1,1,20,645,17,1,1,65535,65535,0,0, 0, 0),
(147555,'Reinforced Cloth Pattern', 'A sturdy template for reinforced cloth.',    1,1,1,1,20,651,17,1,1,65535,65535,0,0, 0, 0),
(147556,'Reinforced Leather Pattern','A sturdy template for reinforced leather.', 1,1,1,1,20,651,17,1,1,65535,65535,0,0, 0, 0),
(147557,'Reinforced Mail Pattern',  'A sturdy template for reinforced mail.',     1,1,1,1,20,651,17,1,1,65535,65535,0,0, 0, 0),
(147558,'Reinforced Plate Pattern', 'A sturdy template for reinforced plate.',    1,1,1,1,20,651,17,1,1,65535,65535,0,0, 0, 0);

-- Intermediates (stacksize=10 except rings=20)
INSERT IGNORE INTO items
    (id,Name,lore,nodrop,norent,tradeskills,stackable,stacksize,
     icon,itemtype,weight,size,classes,races,slots,magic,loregroup,reclevel)
VALUES
(147559,'Bolt of Coarse Linen',    'Coarse linen cloth ready to be shaped.',     1,1,1,1,10,532,17, 2,2,65535,65535,0,0, 0, 0),
(147560,'Reinforced Cloth Pad',    'A thick pad of layered coarse linen.',        1,1,1,1,10,532,17, 3,2,65535,65535,0,0, 0, 0),
(147561,'Hardened Leather Sheet',  'A sheet of hardened, treated leather.',       1,1,1,1,10,534,17, 5,2,65535,65535,0,0, 0, 0),
(147562,'Reinforced Leather Panel','A reinforced panel ready to stitch.',         1,1,1,1,10,534,17, 7,2,65535,65535,0,0, 0, 0),
(147563,'Tempered Iron Bar',       'A bar of tempered iron.',                     1,1,1,1,10,643,17,15,2,65535,65535,0,0, 0, 0),
(147564,'Iron Ring',               'A sturdy iron ring for chainmail.',           1,1,1,1,20,644,17, 2,1,65535,65535,0,0, 0, 0),
(147565,'Reinforced Chain Bundle', 'A bundle of linked iron rings.',              1,1,1,1,10,644,17,10,2,65535,65535,0,0, 0, 0),
(147566,'Tempered Iron Sheet',     'A flat sheet of tempered iron.',              1,1,1,1,10,643,17,20,2,65535,65535,0,0, 0, 0),
(147567,'Tempered Plate Section',  'A shaped tempered iron plate section.',       1,1,1,1,10,643,17,30,2,65535,65535,0,0, 0, 0);

-- Reinforced Cloth armor  AC: Robe=8,Cap=4,Sleeves=6,Bracers=4,Gloves=6,Trousers=6 | INT/WIS/CHA/STA=2
INSERT IGNORE INTO items
    (id,Name,lore,nodrop,norent,ac,astr,asta,aagi,adex,aint,awis,acha,
     itemtype,weight,size,classes,races,slots,magic,loregroup,reclevel,icon,idfile,material,color)
VALUES
(147568,'Reinforced Cloth Cap',    'A cap of tightly woven coarse cloth.',        1,1,4,0,2,0,0,2,2,2,10,3,3,65535,65535,     4,1,-1,1, 641,'IT63', 0, 0),
(147569,'Reinforced Cloth Robe',   'A robe woven from reinforced cloth.',         1,1,8,0,2,0,0,2,2,2,10,5,3,65535,65535,131072,1,-1,1, 838,'IT63', 0, 0),
(147570,'Reinforced Cloth Sleeves','Reinforced cloth sleeves.',                   1,1,6,0,2,0,0,2,2,2,10,3,3,65535,65535,   128,1,-1,1, 670,'IT63', 0, 0),
(147571,'Reinforced Cloth Bracers','Coarse cloth bracers.',                       1,1,4,0,2,0,0,2,2,2,10,2,2,65535,65535,  1536,1,-1,1, 638,'IT63', 0, 0),
(147572,'Reinforced Cloth Gloves', 'Coarse cloth gloves.',                        1,1,6,0,2,0,0,2,2,2,10,2,2,65535,65535,  4096,1,-1,1, 517,'IT63', 0, 0),
(147573,'Reinforced Cloth Trousers','Reinforced cloth trousers.',                 1,1,6,0,2,0,0,2,2,2,10,4,3,65535,65535,262144,1,-1,1, 631,'IT63', 0, 0);

-- Reinforced Leather armor  AC: Vest=10,Cap=6,Sleeves=8,Bracers=2,Gloves=6,Pants=8 | DEX/AGI/CHA/INT=2
INSERT IGNORE INTO items
    (id,Name,lore,nodrop,norent,ac,astr,asta,aagi,adex,aint,awis,acha,
     itemtype,weight,size,classes,races,slots,magic,loregroup,reclevel,icon,idfile,material,color)
VALUES
(147574,'Reinforced Leather Cap',    'A cap of hardened leather.',               1,1, 6,0,0,2,2,2,0,2,10,5,3,65535,65535,     4,1,-1,1, 640,'IT63', 0, 0),
(147575,'Reinforced Leather Vest',   'A vest of reinforced leather panels.',     1,1,10,0,0,2,2,2,0,2,10,9,3,65535,65535,131072,1,-1,1, 632,'IT63', 0, 0),
(147576,'Reinforced Leather Sleeves','Reinforced leather sleeves.',              1,1, 8,0,0,2,2,2,0,2,10,5,3,65535,65535,   128,1,-1,1, 634,'IT63', 0, 0),
(147577,'Reinforced Leather Bracers','Reinforced leather bracers.',              1,1, 2,0,0,2,2,2,0,2,10,3,2,65535,65535,  1536,1,-1,1, 637,'IT63', 0, 0),
(147578,'Reinforced Leather Gloves', 'Reinforced leather gloves.',               1,1, 6,0,0,2,2,2,0,2,10,3,2,65535,65535,  4096,1,-1,1, 636,'IT63', 0, 0),
(147579,'Reinforced Leather Pants',  'Reinforced leather trousers.',             1,1, 8,0,0,2,2,2,0,2,10,7,3,65535,65535,262144,1,-1,1, 635,'IT63', 0, 0);

-- Reinforced Mail armor  AC: Hauberk=14,Coif=8,Sleeves=8,Bracers=4,Gloves=8,Leggings=8 | STR/DEX/WIS/INT=2
INSERT IGNORE INTO items
    (id,Name,lore,nodrop,norent,ac,astr,asta,aagi,adex,aint,awis,acha,
     itemtype,weight,size,classes,races,slots,magic,loregroup,reclevel,icon,idfile,material,color)
VALUES
(147580,'Reinforced Mail Coif',    'A coif of iron chain rings.',                 1,1, 8,2,0,0,2,2,2,0,10, 8,3,65535,65535,     4,1,-1,1, 625,'IT63', 0, 0),
(147581,'Reinforced Mail Hauberk', 'A hauberk of interlocked iron chain.',        1,1,14,2,0,0,2,2,2,0,10,15,3,65535,65535,131072,1,-1,1, 538,'IT63', 0, 0),
(147582,'Reinforced Mail Sleeves', 'Iron chain sleeves.',                         1,1, 8,2,0,0,2,2,2,0,10, 8,3,65535,65535,   128,1,-1,1, 543,'IT63', 0, 0),
(147583,'Reinforced Mail Bracers', 'Iron chain bracers.',                         1,1, 4,2,0,0,2,2,2,0,10, 5,2,65535,65535,  1536,1,-1,1, 620,'IT63', 0, 0),
(147584,'Reinforced Mail Gloves',  'Iron chain gloves.',                          1,1, 8,2,0,0,2,2,2,0,10, 5,2,65535,65535,  4096,1,-1,1, 526,'IT63', 0, 0),
(147585,'Reinforced Mail Leggings','Iron chain leggings.',                        1,1, 8,2,0,0,2,2,2,0,10,12,3,65535,65535,262144,1,-1,1, 540,'IT63', 0, 0);

-- Reinforced Plate armor  AC: Breastplate=16,Helm=8,Vambraces=12,Bracers=4,Gauntlets=8,Legplates=12 | STR=2,STA=4,AGI=2
INSERT IGNORE INTO items
    (id,Name,lore,nodrop,norent,ac,astr,asta,aagi,adex,aint,awis,acha,
     itemtype,weight,size,classes,races,slots,magic,loregroup,reclevel,icon,idfile,material,color)
VALUES
(147586,'Reinforced Plate Helm',       'A reinforced plate helm.',                1,1, 8,2,4,2,0,0,0,0,10,12,4,65535,65535,     4,1,-1,1, 550,'IT63', 0, 0),
(147587,'Reinforced Plate Breastplate','A reinforced plate breastplate.',         1,1,16,2,4,2,0,0,0,0,10,22,4,65535,65535,131072,1,-1,1, 624,'IT63', 0, 0),
(147588,'Reinforced Plate Vambraces',  'Reinforced plate arm guards.',            1,1,12,2,4,2,0,0,0,0,10,12,4,65535,65535,   128,1,-1,1, 622,'IT63', 0, 0),
(147589,'Reinforced Plate Bracers',    'Reinforced plate wrist guards.',          1,1, 4,2,4,2,0,0,0,0,10, 7,3,65535,65535,  1536,1,-1,1, 516,'IT63', 0, 0),
(147590,'Reinforced Plate Gauntlets',  'Heavy reinforced gauntlets.',             1,1, 8,2,4,2,0,0,0,0,10, 7,3,65535,65535,  4096,1,-1,1, 531,'IT63', 0, 0),
(147591,'Reinforced Plate Legplates',  'Reinforced plate leg armor.',             1,1,12,2,4,2,0,0,0,0,10,17,4,65535,65535,262144,1,-1,1, 540,'IT63', 0, 0);


-- ── 2. RECIPES ───────────────────────────────────────────────────────────────
INSERT IGNORE INTO tradeskill_recipe
    (id,name,tradeskill,skillneeded,trivial,nofail,replace_container,enabled)
VALUES
(31201,'Bolt of Coarse Linen',          63,0, 75,0, 0, 0),
(31202,'Hardened Leather Sheet',        63,0, 75,0, 0, 0),
(31203,'Tempered Iron Bar (Mail)',       63,0, 80,0, 0, 0),
(31204,'Tempered Iron Bar (Plate)',      63,0, 80,0, 0, 0),
(31205,'Reinforced Cloth Pad',          63,0, 90,0, 0, 0),
(31206,'Reinforced Leather Panel',      63,0, 95,0, 0, 0),
(31207,'Iron Ring',                     63,0, 85,0, 0, 0),
(31208,'Reinforced Chain Bundle',       63,0,75,0,0,1,
(31209,'Tempered Iron Sheet',           63,0, 90,0, 0, 0),
(31210,'Tempered Plate Section',        63,0,75,0,0,1,
(31211,'Reinforced Cloth Cap',          63,0,88,0,0,1,
(31212,'Reinforced Cloth Robe',         63,0,100,0,0,1,
(31213,'Reinforced Cloth Sleeves',      63,0,88,0,0,1,
(31214,'Reinforced Cloth Bracers',      63,0,85,0,0,1,
(31215,'Reinforced Cloth Gloves',       63,0,85,0,0,1,
(31216,'Reinforced Cloth Trousers',     63,0,92,0,0,1,
(31217,'Reinforced Leather Cap',        63,0,88,0,0,1,
(31218,'Reinforced Leather Vest',       63,0,100,0,0,1,
(31219,'Reinforced Leather Sleeves',    63,0,88,0,0,1,
(31220,'Reinforced Leather Bracers',    63,0,85,0,0,1,
(31221,'Reinforced Leather Gloves',     63,0,85,0,0,1,
(31222,'Reinforced Leather Pants',      63,0,92,0,0,1,
(31223,'Reinforced Mail Coif',          63,0,88,0,0,1,
(31224,'Reinforced Mail Hauberk',       63,0,100,0,0,1,
(31225,'Reinforced Mail Sleeves',       63,0,88,0,0,1,
(31226,'Reinforced Mail Bracers',       63,0,85,0,0,1,
(31227,'Reinforced Mail Gloves',        63,0,85,0,0,1,
(31228,'Reinforced Mail Leggings',      63,0,92,0,0,1,
(31229,'Reinforced Plate Helm',         63,0,88,0,0,1,
(31230,'Reinforced Plate Breastplate',  63,0,100,0,0,1,
(31231,'Reinforced Plate Vambraces',    63,0,88,0,0,1,
(31232,'Reinforced Plate Bracers',      63,0,85,0,0,1,
(31233,'Reinforced Plate Gauntlets',    63,0,85,0,0,1,
(31234,'Reinforced Plate Legplates',    63,0,92,0,0,1;


-- ── 3. RECIPE ENTRIES ────────────────────────────────────────────────────────

-- Refinement ──────────────────────────────────────────────────────────────────

-- 31201: 2x Coarse Fiber Bundle + 1x Coarse Linen Thread → Bolt of Coarse Linen
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31201,17,0,0,0, 0, 0),(31201,17909,0,0,0, 0, 0),(31201,17760,0,0,0, 0, 0),(31201,54253,0,0,0, 0, 0),(31201,54258,0,0,0, 0, 0),(31201,66625,0,0,0, 0, 0)
(31201,147548,0,0,2, 0, 0),(31201,147552,0,0,1, 0, 0),(31201,147559,1,0,0, 0, 0);

-- 31202: 2x Thick Animal Pelt + 1x Moderate Tanning Solution → Hardened Leather Sheet
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31202,17,0,0,0, 0, 0),(31202,17909,0,0,0, 0, 0),(31202,17760,0,0,0, 0, 0),(31202,54253,0,0,0, 0, 0),(31202,54258,0,0,0, 0, 0),(31202,66625,0,0,0, 0, 0)
(31202,147549,0,0,2, 0, 0),(31202,147553,0,0,1, 0, 0),(31202,147561,1,0,0, 0, 0);

-- 31203: 2x Iron-Laced Ore Fragment + 1x Standard Tempering Flux → Tempered Iron Bar
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31203,17,0,0,0, 0, 0),(31203,17909,0,0,0, 0, 0),(31203,17760,0,0,0, 0, 0),(31203,54253,0,0,0, 0, 0),(31203,54258,0,0,0, 0, 0),(31203,66625,0,0,0, 0, 0)
(31203,147550,0,0,2, 0, 0),(31203,147554,0,0,1, 0, 0),(31203,147563,1,0,0, 0, 0);

-- 31204: 2x Dense Iron Ore + 1x Standard Tempering Flux → Tempered Iron Bar
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31204,17,0,0,0, 0, 0),(31204,17909,0,0,0, 0, 0),(31204,17760,0,0,0, 0, 0),(31204,54253,0,0,0, 0, 0),(31204,54258,0,0,0, 0, 0),(31204,66625,0,0,0, 0, 0)
(31204,147551,0,0,2, 0, 0),(31204,147554,0,0,1, 0, 0),(31204,147563,1,0,0, 0, 0);

-- Intermediates ───────────────────────────────────────────────────────────────

-- 31205: 2x Bolt of Coarse Linen → Reinforced Cloth Pad
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31205,17,0,0,0, 0, 0),(31205,17909,0,0,0, 0, 0),(31205,17760,0,0,0, 0, 0),(31205,54253,0,0,0, 0, 0),(31205,54258,0,0,0, 0, 0),(31205,66625,0,0,0, 0, 0)
(31205,147559,0,0,2, 0, 0),(31205,147560,1,0,0, 0, 0);

-- 31206: 2x Hardened Leather Sheet → Reinforced Leather Panel
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31206,17,0,0,0, 0, 0),(31206,17909,0,0,0, 0, 0),(31206,17760,0,0,0, 0, 0),(31206,54253,0,0,0, 0, 0),(31206,54258,0,0,0, 0, 0),(31206,66625,0,0,0, 0, 0)
(31206,147561,0,0,2, 0, 0),(31206,147562,1,0,0, 0, 0);

-- 31207: 1x Tempered Iron Bar → 6x Iron Ring
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31207,17,0,0,0, 0, 0),(31207,17909,0,0,0, 0, 0),(31207,17760,0,0,0, 0, 0),(31207,54253,0,0,0, 0, 0),(31207,54258,0,0,0, 0, 0),(31207,66625,0,0,0, 0, 0)
(31207,147563,0,0,1, 0, 0),(31207,147564,6,0,0, 0, 0);

-- 31208: 6x Iron Ring → Reinforced Chain Bundle
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31208,17,0,0,0, 0, 0),(31208,17909,0,0,0, 0, 0),(31208,17760,0,0,0, 0, 0),(31208,54253,0,0,0, 0, 0),(31208,54258,0,0,0, 0, 0),(31208,66625,0,0,0, 0, 0)
(31208,147564,0,0,6, 0, 0),(31208,147565,1,0,0, 0, 0);

-- 31209: 2x Tempered Iron Bar → Tempered Iron Sheet
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31209,17,0,0,0, 0, 0),(31209,17909,0,0,0, 0, 0),(31209,17760,0,0,0, 0, 0),(31209,54253,0,0,0, 0, 0),(31209,54258,0,0,0, 0, 0),(31209,66625,0,0,0, 0, 0)
(31209,147563,0,0,2, 0, 0),(31209,147566,1,0,0, 0, 0);

-- 31210: 2x Tempered Iron Sheet → Tempered Plate Section
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31210,17,0,0,0, 0, 0),(31210,17909,0,0,0, 0, 0),(31210,17760,0,0,0, 0, 0),(31210,54253,0,0,0, 0, 0),(31210,54258,0,0,0, 0, 0),(31210,66625,0,0,0, 0, 0)
(31210,147566,0,0,2, 0, 0),(31210,147567,1,0,0, 0, 0);

-- Cloth armor: Nx Reinforced Cloth Pad (147560) + Pattern (147555,salvages) + Thread (147552) ────

-- 31211: Reinforced Cloth Cap — 2x Pad
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31211,17,0,0,0, 0, 0),(31211,17909,0,0,0, 0, 0),(31211,17760,0,0,0, 0, 0),(31211,54253,0,0,0, 0, 0),(31211,54258,0,0,0, 0, 0),(31211,66625,0,0,0, 0, 0)
(31211,147560,0,0,2, 0, 0),(31211,147555,0,0,1, 0, 0),(31211,147552,0,0,1, 0, 0),(31211,147568,1,0,0, 0, 0);

-- 31212: Reinforced Cloth Robe — 4x Pad
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31212,17,0,0,0, 0, 0),(31212,17909,0,0,0, 0, 0),(31212,17760,0,0,0, 0, 0),(31212,54253,0,0,0, 0, 0),(31212,54258,0,0,0, 0, 0),(31212,66625,0,0,0, 0, 0)
(31212,147560,0,0,4, 0, 0),(31212,147555,0,0,1, 0, 0),(31212,147552,0,0,1, 0, 0),(31212,147569,1,0,0, 0, 0);

-- 31213: Reinforced Cloth Sleeves — 2x Pad
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31213,17,0,0,0, 0, 0),(31213,17909,0,0,0, 0, 0),(31213,17760,0,0,0, 0, 0),(31213,54253,0,0,0, 0, 0),(31213,54258,0,0,0, 0, 0),(31213,66625,0,0,0, 0, 0)
(31213,147560,0,0,2, 0, 0),(31213,147555,0,0,1, 0, 0),(31213,147552,0,0,1, 0, 0),(31213,147570,1,0,0, 0, 0);

-- 31214: Reinforced Cloth Bracers — 1x Pad
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31214,17,0,0,0, 0, 0),(31214,17909,0,0,0, 0, 0),(31214,17760,0,0,0, 0, 0),(31214,54253,0,0,0, 0, 0),(31214,54258,0,0,0, 0, 0),(31214,66625,0,0,0, 0, 0)
(31214,147560,0,0,1, 0, 0),(31214,147555,0,0,1, 0, 0),(31214,147552,0,0,1, 0, 0),(31214,147571,1,0,0, 0, 0);

-- 31215: Reinforced Cloth Gloves — 1x Pad
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31215,17,0,0,0, 0, 0),(31215,17909,0,0,0, 0, 0),(31215,17760,0,0,0, 0, 0),(31215,54253,0,0,0, 0, 0),(31215,54258,0,0,0, 0, 0),(31215,66625,0,0,0, 0, 0)
(31215,147560,0,0,1, 0, 0),(31215,147555,0,0,1, 0, 0),(31215,147552,0,0,1, 0, 0),(31215,147572,1,0,0, 0, 0);

-- 31216: Reinforced Cloth Trousers — 3x Pad
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31216,17,0,0,0, 0, 0),(31216,17909,0,0,0, 0, 0),(31216,17760,0,0,0, 0, 0),(31216,54253,0,0,0, 0, 0),(31216,54258,0,0,0, 0, 0),(31216,66625,0,0,0, 0, 0)
(31216,147560,0,0,3, 0, 0),(31216,147555,0,0,1, 0, 0),(31216,147552,0,0,1, 0, 0),(31216,147573,1,0,0, 0, 0);

-- Leather armor: Nx Reinforced Leather Panel (147562) + Pattern (147556,salvages) + Solution (147553) ──

-- 31217: Reinforced Leather Cap — 2x Panel
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31217,17,0,0,0, 0, 0),(31217,17909,0,0,0, 0, 0),(31217,17760,0,0,0, 0, 0),(31217,54253,0,0,0, 0, 0),(31217,54258,0,0,0, 0, 0),(31217,66625,0,0,0, 0, 0)
(31217,147562,0,0,2, 0, 0),(31217,147556,0,0,1, 0, 0),(31217,147553,0,0,1, 0, 0),(31217,147574,1,0,0, 0, 0);

-- 31218: Reinforced Leather Vest — 4x Panel
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31218,17,0,0,0, 0, 0),(31218,17909,0,0,0, 0, 0),(31218,17760,0,0,0, 0, 0),(31218,54253,0,0,0, 0, 0),(31218,54258,0,0,0, 0, 0),(31218,66625,0,0,0, 0, 0)
(31218,147562,0,0,4, 0, 0),(31218,147556,0,0,1, 0, 0),(31218,147553,0,0,1, 0, 0),(31218,147575,1,0,0, 0, 0);

-- 31219: Reinforced Leather Sleeves — 2x Panel
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31219,17,0,0,0, 0, 0),(31219,17909,0,0,0, 0, 0),(31219,17760,0,0,0, 0, 0),(31219,54253,0,0,0, 0, 0),(31219,54258,0,0,0, 0, 0),(31219,66625,0,0,0, 0, 0)
(31219,147562,0,0,2, 0, 0),(31219,147556,0,0,1, 0, 0),(31219,147553,0,0,1, 0, 0),(31219,147576,1,0,0, 0, 0);

-- 31220: Reinforced Leather Bracers — 1x Panel
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31220,17,0,0,0, 0, 0),(31220,17909,0,0,0, 0, 0),(31220,17760,0,0,0, 0, 0),(31220,54253,0,0,0, 0, 0),(31220,54258,0,0,0, 0, 0),(31220,66625,0,0,0, 0, 0)
(31220,147562,0,0,1, 0, 0),(31220,147556,0,0,1, 0, 0),(31220,147553,0,0,1, 0, 0),(31220,147577,1,0,0, 0, 0);

-- 31221: Reinforced Leather Gloves — 1x Panel
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31221,17,0,0,0, 0, 0),(31221,17909,0,0,0, 0, 0),(31221,17760,0,0,0, 0, 0),(31221,54253,0,0,0, 0, 0),(31221,54258,0,0,0, 0, 0),(31221,66625,0,0,0, 0, 0)
(31221,147562,0,0,1, 0, 0),(31221,147556,0,0,1, 0, 0),(31221,147553,0,0,1, 0, 0),(31221,147578,1,0,0, 0, 0);

-- 31222: Reinforced Leather Pants — 3x Panel
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31222,17,0,0,0, 0, 0),(31222,17909,0,0,0, 0, 0),(31222,17760,0,0,0, 0, 0),(31222,54253,0,0,0, 0, 0),(31222,54258,0,0,0, 0, 0),(31222,66625,0,0,0, 0, 0)
(31222,147562,0,0,3, 0, 0),(31222,147556,0,0,1, 0, 0),(31222,147553,0,0,1, 0, 0),(31222,147579,1,0,0, 0, 0);

-- Mail armor: Nx Reinforced Chain Bundle (147565) + Pattern (147557,salvages) ───────────────────

-- 31223: Reinforced Mail Coif — 2x Bundle
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31223,17,0,0,0, 0, 0),(31223,17909,0,0,0, 0, 0),(31223,17760,0,0,0, 0, 0),(31223,54253,0,0,0, 0, 0),(31223,54258,0,0,0, 0, 0),(31223,66625,0,0,0, 0, 0)
(31223,147565,0,0,2, 0, 0),(31223,147557,0,0,1, 0, 0),(31223,147580,1,0,0, 0, 0);

-- 31224: Reinforced Mail Hauberk — 4x Bundle
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31224,17,0,0,0, 0, 0),(31224,17909,0,0,0, 0, 0),(31224,17760,0,0,0, 0, 0),(31224,54253,0,0,0, 0, 0),(31224,54258,0,0,0, 0, 0),(31224,66625,0,0,0, 0, 0)
(31224,147565,0,0,4, 0, 0),(31224,147557,0,0,1, 0, 0),(31224,147581,1,0,0, 0, 0);

-- 31225: Reinforced Mail Sleeves — 2x Bundle
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31225,17,0,0,0, 0, 0),(31225,17909,0,0,0, 0, 0),(31225,17760,0,0,0, 0, 0),(31225,54253,0,0,0, 0, 0),(31225,54258,0,0,0, 0, 0),(31225,66625,0,0,0, 0, 0)
(31225,147565,0,0,2, 0, 0),(31225,147557,0,0,1, 0, 0),(31225,147582,1,0,0, 0, 0);

-- 31226: Reinforced Mail Bracers — 1x Bundle
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31226,17,0,0,0, 0, 0),(31226,17909,0,0,0, 0, 0),(31226,17760,0,0,0, 0, 0),(31226,54253,0,0,0, 0, 0),(31226,54258,0,0,0, 0, 0),(31226,66625,0,0,0, 0, 0)
(31226,147565,0,0,1, 0, 0),(31226,147557,0,0,1, 0, 0),(31226,147583,1,0,0, 0, 0);

-- 31227: Reinforced Mail Gloves — 1x Bundle
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31227,17,0,0,0, 0, 0),(31227,17909,0,0,0, 0, 0),(31227,17760,0,0,0, 0, 0),(31227,54253,0,0,0, 0, 0),(31227,54258,0,0,0, 0, 0),(31227,66625,0,0,0, 0, 0)
(31227,147565,0,0,1, 0, 0),(31227,147557,0,0,1, 0, 0),(31227,147584,1,0,0, 0, 0);

-- 31228: Reinforced Mail Leggings — 3x Bundle
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31228,17,0,0,0, 0, 0),(31228,17909,0,0,0, 0, 0),(31228,17760,0,0,0, 0, 0),(31228,54253,0,0,0, 0, 0),(31228,54258,0,0,0, 0, 0),(31228,66625,0,0,0, 0, 0)
(31228,147565,0,0,3, 0, 0),(31228,147557,0,0,1, 0, 0),(31228,147585,1,0,0, 0, 0);

-- Plate armor: Nx Tempered Plate Section (147567) + Pattern (147558,salvages) ───────────────────

-- 31229: Reinforced Plate Helm — 2x Section
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31229,17,0,0,0, 0, 0),(31229,17909,0,0,0, 0, 0),(31229,17760,0,0,0, 0, 0),(31229,54253,0,0,0, 0, 0),(31229,54258,0,0,0, 0, 0),(31229,66625,0,0,0, 0, 0)
(31229,147567,0,0,2, 0, 0),(31229,147558,0,0,1, 0, 0),(31229,147586,1,0,0, 0, 0);

-- 31230: Reinforced Plate Breastplate — 4x Section
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31230,17,0,0,0, 0, 0),(31230,17909,0,0,0, 0, 0),(31230,17760,0,0,0, 0, 0),(31230,54253,0,0,0, 0, 0),(31230,54258,0,0,0, 0, 0),(31230,66625,0,0,0, 0, 0)
(31230,147567,0,0,4, 0, 0),(31230,147558,0,0,1, 0, 0),(31230,147587,1,0,0, 0, 0);

-- 31231: Reinforced Plate Vambraces — 2x Section
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31231,17,0,0,0, 0, 0),(31231,17909,0,0,0, 0, 0),(31231,17760,0,0,0, 0, 0),(31231,54253,0,0,0, 0, 0),(31231,54258,0,0,0, 0, 0),(31231,66625,0,0,0, 0, 0)
(31231,147567,0,0,2, 0, 0),(31231,147558,0,0,1, 0, 0),(31231,147588,1,0,0, 0, 0);

-- 31232: Reinforced Plate Bracers — 1x Section
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31232,17,0,0,0, 0, 0),(31232,17909,0,0,0, 0, 0),(31232,17760,0,0,0, 0, 0),(31232,54253,0,0,0, 0, 0),(31232,54258,0,0,0, 0, 0),(31232,66625,0,0,0, 0, 0)
(31232,147567,0,0,1, 0, 0),(31232,147558,0,0,1, 0, 0),(31232,147589,1,0,0, 0, 0);

-- 31233: Reinforced Plate Gauntlets — 1x Section
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31233,17,0,0,0, 0, 0),(31233,17909,0,0,0, 0, 0),(31233,17760,0,0,0, 0, 0),(31233,54253,0,0,0, 0, 0),(31233,54258,0,0,0, 0, 0),(31233,66625,0,0,0, 0, 0)
(31233,147567,0,0,1, 0, 0),(31233,147558,0,0,1, 0, 0),(31233,147590,1,0,0, 0, 0);

-- 31234: Reinforced Plate Legplates — 3x Section
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31234,17,0,0,0, 0, 0),(31234,17909,0,0,0, 0, 0),(31234,17760,0,0,0, 0, 0),(31234,54253,0,0,0, 0, 0),(31234,54258,0,0,0, 0, 0),(31234,66625,0,0,0, 0, 0)
(31234,147567,0,0,3, 0, 0),(31234,147558,0,0,1, 0, 0),(31234,147591,1,0,0, 0, 0);
