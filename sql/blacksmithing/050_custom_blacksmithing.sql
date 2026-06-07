-- ============================================================================
-- T1 Weathered — Stat Corrections
-- ============================================================================
-- Leather items (147527-147533): was STA=2/CHA/AGI, correct is DEX=1/AGI=1/CHA=1/INT=1
UPDATE items SET astr=0,asta=0,aagi=1,adex=1,aint=1,awis=0,acha=1
WHERE id BETWEEN 147527 AND 147533;

-- Plate items (147541-147547): was STR=1/STA=1/AGI=1/DEX=1, correct is STR=1/STA=2/AGI=1
UPDATE items SET astr=1,asta=2,aagi=1,adex=0,aint=0,awis=0,acha=0
WHERE id BETWEEN 147541 AND 147547;

-- Cloth Robe visual: Oracle Robe appearance
UPDATE items SET idfile='IT63', material=13 WHERE id=147521;

-- ── T1 missing item ───────────────────────────────────────────────────────────
INSERT IGNORE INTO items
    (id,Name,lore,nodrop,norent,tradeskills,stackable,stacksize,
     icon,itemtype,weight,size,classes,races,slots,magic,loregroup,reclevel)
VALUES
(147509,'Basic Tanning Solution','A basic solution for curing hides.',1,1,1,1,20,845,17,1,1,65535,65535,0,0, 0, 0);

-- ── T1 RECIPES (INSERT IGNORE) ───────────────────────────────────────────────
INSERT IGNORE INTO tradeskill_recipe
    (id,name,tradeskill,skillneeded,trivial,nofail,replace_container,enabled)
VALUES
(31167,'Bolt of Woven Cloth',         63,0, 25,0, 0, 0),
(31168,'Cured Leather Sheet',         63,0, 25,0, 0, 0),
(31169,'Crude Refined Bar (Mail)',    63,0, 30,0, 0, 0),
(31170,'Crude Refined Bar (Plate)',   63,0, 30,0, 0, 0),
(31171,'Cloth Padding',               63,0, 40,0, 0, 0),
(31172,'Leather Panel',               63,0, 45,0, 0, 0),
(31173,'Small Metal Ring',            63,0, 35,0, 0, 0),
(31174,'Weathered Chain Bundle',      63,0, 55,0, 0, 0),
(31175,'Rough Metal Sheet',           63,0, 40,0, 0, 0),
(31176,'Rough Plate Section',         63,0, 55,0, 0, 0),
(31177,'Weathered Cloth Cap',         63,0, 75,0, 0, 0),
(31178,'Weathered Cloth Robe',        63,0,50,0,0,1,
(31179,'Weathered Cloth Sleeves',     63,0, 75,0, 0, 0),
(31180,'Weathered Cloth Bracers',     63,0, 65,0, 0, 0),
(31181,'Weathered Cloth Gloves',      63,0, 65,0, 0, 0),
(31182,'Weathered Cloth Trousers',    63,0, 85,0, 0, 0),
(31183,'Weathered Leather Cap',       63,0, 75,0, 0, 0),
(31184,'Weathered Leather Vest',      63,0,50,0,0,1,
(31185,'Weathered Leather Sleeves',   63,0, 75,0, 0, 0),
(31186,'Weathered Leather Bracers',   63,0, 65,0, 0, 0),
(31187,'Weathered Leather Gloves',    63,0, 65,0, 0, 0),
(31188,'Weathered Leather Pants',     63,0, 85,0, 0, 0),
(31189,'Weathered Mail Coif',         63,0, 75,0, 0, 0),
(31190,'Weathered Mail Hauberk',      63,0,50,0,0,1,
(31191,'Weathered Mail Sleeves',      63,0, 75,0, 0, 0),
(31192,'Weathered Mail Bracers',      63,0, 65,0, 0, 0),
(31193,'Weathered Mail Gloves',       63,0, 65,0, 0, 0),
(31194,'Weathered Mail Leggings',     63,0, 85,0, 0, 0),
(31195,'Weathered Plate Helm',        63,0, 75,0, 0, 0),
(31196,'Weathered Plate Breastplate', 63,0,50,0,0,1,
(31197,'Weathered Plate Vambraces',   63,0, 75,0, 0, 0),
(31198,'Weathered Plate Bracers',     63,0, 65,0, 0, 0),
(31199,'Weathered Plate Gauntlets',   63,0, 65,0, 0, 0),
(31200,'Weathered Plate Legplates',   63,0, 85,0, 0, 0);

-- ── T1 RECIPE ENTRIES (INSERT IGNORE) ────────────────────────────────────────

INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31167,17,0,0,0, 0, 0),(31167,17909,0,0,0, 0, 0),(31167,17760,0,0,0, 0, 0),(31167,54253,0,0,0, 0, 0),(31167,54258,0,0,0, 0, 0),(31167,66625,0,0,0, 0, 0),
(31167,147500,0,0,2, 0, 0),(31167,147504,0,0,1, 0, 0),(31167,147510,1,0,0, 0, 0);

INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31168,17,0,0,0, 0, 0),(31168,17909,0,0,0, 0, 0),(31168,17760,0,0,0, 0, 0),(31168,54253,0,0,0, 0, 0),(31168,54258,0,0,0, 0, 0),(31168,66625,0,0,0, 0, 0),
(31168,147501,0,0,2, 0, 0),(31168,147509,0,0,1, 0, 0),(31168,147512,1,0,0, 0, 0);

INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31169,17,0,0,0, 0, 0),(31169,17909,0,0,0, 0, 0),(31169,17760,0,0,0, 0, 0),(31169,54253,0,0,0, 0, 0),(31169,54258,0,0,0, 0, 0),(31169,66625,0,0,0, 0, 0),
(31169,147502,0,0,2, 0, 0),(31169,147506,0,0,1, 0, 0),(31169,147514,1,0,0, 0, 0);

INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31170,17,0,0,0, 0, 0),(31170,17909,0,0,0, 0, 0),(31170,17760,0,0,0, 0, 0),(31170,54253,0,0,0, 0, 0),(31170,54258,0,0,0, 0, 0),(31170,66625,0,0,0, 0, 0),
(31170,147503,0,0,2, 0, 0),(31170,147506,0,0,1, 0, 0),(31170,147514,1,0,0, 0, 0);

INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31171,17,0,0,0, 0, 0),(31171,17909,0,0,0, 0, 0),(31171,17760,0,0,0, 0, 0),(31171,54253,0,0,0, 0, 0),(31171,54258,0,0,0, 0, 0),(31171,66625,0,0,0, 0, 0),
(31171,147510,0,0,2, 0, 0),(31171,147511,1,0,0, 0, 0);

INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31172,17,0,0,0, 0, 0),(31172,17909,0,0,0, 0, 0),(31172,17760,0,0,0, 0, 0),(31172,54253,0,0,0, 0, 0),(31172,54258,0,0,0, 0, 0),(31172,66625,0,0,0, 0, 0),
(31172,147512,0,0,2, 0, 0),(31172,147513,1,0,0, 0, 0);

INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31173,17,0,0,0, 0, 0),(31173,17909,0,0,0, 0, 0),(31173,17760,0,0,0, 0, 0),(31173,54253,0,0,0, 0, 0),(31173,54258,0,0,0, 0, 0),(31173,66625,0,0,0, 0, 0),
(31173,147514,0,0,1, 0, 0),(31173,147515,6,0,0, 0, 0);

INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31174,17,0,0,0, 0, 0),(31174,17909,0,0,0, 0, 0),(31174,17760,0,0,0, 0, 0),(31174,54253,0,0,0, 0, 0),(31174,54258,0,0,0, 0, 0),(31174,66625,0,0,0, 0, 0),
(31174,147515,0,0,6, 0, 0),(31174,147516,1,0,0, 0, 0);

INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31175,17,0,0,0, 0, 0),(31175,17909,0,0,0, 0, 0),(31175,17760,0,0,0, 0, 0),(31175,54253,0,0,0, 0, 0),(31175,54258,0,0,0, 0, 0),(31175,66625,0,0,0, 0, 0),
(31175,147514,0,0,2, 0, 0),(31175,147517,1,0,0, 0, 0);

INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31176,17,0,0,0, 0, 0),(31176,17909,0,0,0, 0, 0),(31176,17760,0,0,0, 0, 0),(31176,54253,0,0,0, 0, 0),(31176,54258,0,0,0, 0, 0),(31176,66625,0,0,0, 0, 0),
(31176,147517,0,0,2, 0, 0),(31176,147518,1,0,0, 0, 0);

-- Cloth armor
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31177,17,0,0,0, 0, 0),(31177,17909,0,0,0, 0, 0),(31177,17760,0,0,0, 0, 0),(31177,54253,0,0,0, 0, 0),(31177,54258,0,0,0, 0, 0),(31177,66625,0,0,0, 0, 0),
(31177,147511,0,0,2, 0, 0),(31177,147505,0,0,1, 0, 0),(31177,147504,0,0,1, 0, 0),(31177,147520,1,0,0, 0, 0);
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31178,17,0,0,0, 0, 0),(31178,17909,0,0,0, 0, 0),(31178,17760,0,0,0, 0, 0),(31178,54253,0,0,0, 0, 0),(31178,54258,0,0,0, 0, 0),(31178,66625,0,0,0, 0, 0),
(31178,147511,0,0,4, 0, 0),(31178,147505,0,0,1, 0, 0),(31178,147504,0,0,1, 0, 0),(31178,147521,1,0,0, 0, 0);
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31179,17,0,0,0, 0, 0),(31179,17909,0,0,0, 0, 0),(31179,17760,0,0,0, 0, 0),(31179,54253,0,0,0, 0, 0),(31179,54258,0,0,0, 0, 0),(31179,66625,0,0,0, 0, 0),
(31179,147511,0,0,2, 0, 0),(31179,147505,0,0,1, 0, 0),(31179,147504,0,0,1, 0, 0),(31179,147522,1,0,0, 0, 0);
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31180,17,0,0,0, 0, 0),(31180,17909,0,0,0, 0, 0),(31180,17760,0,0,0, 0, 0),(31180,54253,0,0,0, 0, 0),(31180,54258,0,0,0, 0, 0),(31180,66625,0,0,0, 0, 0),
(31180,147511,0,0,1, 0, 0),(31180,147505,0,0,1, 0, 0),(31180,147504,0,0,1, 0, 0),(31180,147523,1,0,0, 0, 0);
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31181,17,0,0,0, 0, 0),(31181,17909,0,0,0, 0, 0),(31181,17760,0,0,0, 0, 0),(31181,54253,0,0,0, 0, 0),(31181,54258,0,0,0, 0, 0),(31181,66625,0,0,0, 0, 0),
(31181,147511,0,0,1, 0, 0),(31181,147505,0,0,1, 0, 0),(31181,147504,0,0,1, 0, 0),(31181,147524,1,0,0, 0, 0);
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31182,17,0,0,0, 0, 0),(31182,17909,0,0,0, 0, 0),(31182,17760,0,0,0, 0, 0),(31182,54253,0,0,0, 0, 0),(31182,54258,0,0,0, 0, 0),(31182,66625,0,0,0, 0, 0),
(31182,147511,0,0,3, 0, 0),(31182,147505,0,0,1, 0, 0),(31182,147504,0,0,1, 0, 0),(31182,147525,1,0,0, 0, 0);

-- Leather armor (uses 147505 as shared pattern, 147509 as tanning solution)
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31183,17,0,0,0, 0, 0),(31183,17909,0,0,0, 0, 0),(31183,17760,0,0,0, 0, 0),(31183,54253,0,0,0, 0, 0),(31183,54258,0,0,0, 0, 0),(31183,66625,0,0,0, 0, 0),
(31183,147513,0,0,2, 0, 0),(31183,147505,0,0,1, 0, 0),(31183,147509,0,0,1, 0, 0),(31183,147527,1,0,0, 0, 0);
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31184,17,0,0,0, 0, 0),(31184,17909,0,0,0, 0, 0),(31184,17760,0,0,0, 0, 0),(31184,54253,0,0,0, 0, 0),(31184,54258,0,0,0, 0, 0),(31184,66625,0,0,0, 0, 0),
(31184,147513,0,0,4, 0, 0),(31184,147505,0,0,1, 0, 0),(31184,147509,0,0,1, 0, 0),(31184,147528,1,0,0, 0, 0);
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31185,17,0,0,0, 0, 0),(31185,17909,0,0,0, 0, 0),(31185,17760,0,0,0, 0, 0),(31185,54253,0,0,0, 0, 0),(31185,54258,0,0,0, 0, 0),(31185,66625,0,0,0, 0, 0),
(31185,147513,0,0,2, 0, 0),(31185,147505,0,0,1, 0, 0),(31185,147509,0,0,1, 0, 0),(31185,147529,1,0,0, 0, 0);
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31186,17,0,0,0, 0, 0),(31186,17909,0,0,0, 0, 0),(31186,17760,0,0,0, 0, 0),(31186,54253,0,0,0, 0, 0),(31186,54258,0,0,0, 0, 0),(31186,66625,0,0,0, 0, 0),
(31186,147513,0,0,1, 0, 0),(31186,147505,0,0,1, 0, 0),(31186,147509,0,0,1, 0, 0),(31186,147530,1,0,0, 0, 0);
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31187,17,0,0,0, 0, 0),(31187,17909,0,0,0, 0, 0),(31187,17760,0,0,0, 0, 0),(31187,54253,0,0,0, 0, 0),(31187,54258,0,0,0, 0, 0),(31187,66625,0,0,0, 0, 0),
(31187,147513,0,0,1, 0, 0),(31187,147505,0,0,1, 0, 0),(31187,147509,0,0,1, 0, 0),(31187,147531,1,0,0, 0, 0);
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31188,17,0,0,0, 0, 0),(31188,17909,0,0,0, 0, 0),(31188,17760,0,0,0, 0, 0),(31188,54253,0,0,0, 0, 0),(31188,54258,0,0,0, 0, 0),(31188,66625,0,0,0, 0, 0),
(31188,147513,0,0,3, 0, 0),(31188,147505,0,0,1, 0, 0),(31188,147509,0,0,1, 0, 0),(31188,147532,1,0,0, 0, 0);

-- Mail armor
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31189,17,0,0,0, 0, 0),(31189,17909,0,0,0, 0, 0),(31189,17760,0,0,0, 0, 0),(31189,54253,0,0,0, 0, 0),(31189,54258,0,0,0, 0, 0),(31189,66625,0,0,0, 0, 0),
(31189,147516,0,0,2, 0, 0),(31189,147505,0,0,1, 0, 0),(31189,147534,1,0,0, 0, 0);
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31190,17,0,0,0, 0, 0),(31190,17909,0,0,0, 0, 0),(31190,17760,0,0,0, 0, 0),(31190,54253,0,0,0, 0, 0),(31190,54258,0,0,0, 0, 0),(31190,66625,0,0,0, 0, 0),
(31190,147516,0,0,4, 0, 0),(31190,147505,0,0,1, 0, 0),(31190,147535,1,0,0, 0, 0);
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31191,17,0,0,0, 0, 0),(31191,17909,0,0,0, 0, 0),(31191,17760,0,0,0, 0, 0),(31191,54253,0,0,0, 0, 0),(31191,54258,0,0,0, 0, 0),(31191,66625,0,0,0, 0, 0),
(31191,147516,0,0,2, 0, 0),(31191,147505,0,0,1, 0, 0),(31191,147536,1,0,0, 0, 0);
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31192,17,0,0,0, 0, 0),(31192,17909,0,0,0, 0, 0),(31192,17760,0,0,0, 0, 0),(31192,54253,0,0,0, 0, 0),(31192,54258,0,0,0, 0, 0),(31192,66625,0,0,0, 0, 0),
(31192,147516,0,0,1, 0, 0),(31192,147505,0,0,1, 0, 0),(31192,147537,1,0,0, 0, 0);
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31193,17,0,0,0, 0, 0),(31193,17909,0,0,0, 0, 0),(31193,17760,0,0,0, 0, 0),(31193,54253,0,0,0, 0, 0),(31193,54258,0,0,0, 0, 0),(31193,66625,0,0,0, 0, 0),
(31193,147516,0,0,1, 0, 0),(31193,147505,0,0,1, 0, 0),(31193,147538,1,0,0, 0, 0);
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31194,17,0,0,0, 0, 0),(31194,17909,0,0,0, 0, 0),(31194,17760,0,0,0, 0, 0),(31194,54253,0,0,0, 0, 0),(31194,54258,0,0,0, 0, 0),(31194,66625,0,0,0, 0, 0),
(31194,147516,0,0,3, 0, 0),(31194,147505,0,0,1, 0, 0),(31194,147539,1,0,0, 0, 0);

-- Plate armor
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31195,17,0,0,0, 0, 0),(31195,17909,0,0,0, 0, 0),(31195,17760,0,0,0, 0, 0),(31195,54253,0,0,0, 0, 0),(31195,54258,0,0,0, 0, 0),(31195,66625,0,0,0, 0, 0),
(31195,147518,0,0,2, 0, 0),(31195,147505,0,0,1, 0, 0),(31195,147541,1,0,0, 0, 0);
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31196,17,0,0,0, 0, 0),(31196,17909,0,0,0, 0, 0),(31196,17760,0,0,0, 0, 0),(31196,54253,0,0,0, 0, 0),(31196,54258,0,0,0, 0, 0),(31196,66625,0,0,0, 0, 0),
(31196,147518,0,0,4, 0, 0),(31196,147505,0,0,1, 0, 0),(31196,147542,1,0,0, 0, 0);
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31197,17,0,0,0, 0, 0),(31197,17909,0,0,0, 0, 0),(31197,17760,0,0,0, 0, 0),(31197,54253,0,0,0, 0, 0),(31197,54258,0,0,0, 0, 0),(31197,66625,0,0,0, 0, 0),
(31197,147518,0,0,2, 0, 0),(31197,147505,0,0,1, 0, 0),(31197,147543,1,0,0, 0, 0);
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31198,17,0,0,0, 0, 0),(31198,17909,0,0,0, 0, 0),(31198,17760,0,0,0, 0, 0),(31198,54253,0,0,0, 0, 0),(31198,54258,0,0,0, 0, 0),(31198,66625,0,0,0, 0, 0),
(31198,147518,0,0,1, 0, 0),(31198,147505,0,0,1, 0, 0),(31198,147544,1,0,0, 0, 0);
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31199,17,0,0,0, 0, 0),(31199,17909,0,0,0, 0, 0),(31199,17760,0,0,0, 0, 0),(31199,54253,0,0,0, 0, 0),(31199,54258,0,0,0, 0, 0),(31199,66625,0,0,0, 0, 0),
(31199,147518,0,0,1, 0, 0),(31199,147505,0,0,1, 0, 0),(31199,147545,1,0,0, 0, 0);
INSERT IGNORE INTO tradeskill_recipe_entries (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
(31200,17,0,0,0, 0, 0),(31200,17909,0,0,0, 0, 0),(31200,17760,0,0,0, 0, 0),(31200,54253,0,0,0, 0, 0),(31200,54258,0,0,0, 0, 0),(31200,66625,0,0,0, 0, 0),
(31200,147518,0,0,3, 0, 0),(31200,147505,0,0,1, 0, 0),(31200,147546,1,0,0, 0, 0);
