-- Gem Cutting: Tier 1 Pure Stat & Resist Augments
-- 12 gem families: Ruby/Jasper/Topaz/Peridot/Sapphire/Amethyst/Opal (stats) + Jade/Citrine/Moonstone/Obsidian/Amber (resists)
-- Each family: raw(+0), faceted(+1), polished(+2), aug(+3) within 4-ID blocks starting at 148026
-- Stat values T1: +1 to single stat or resist
-- Recipes 31464–31499 | Trivials: Facet=25, Polish=40, Aug=60
-- Lootdrops: see 061_gc_new_loot_tables.sql

-- ============================================================
-- RAW DROPS (T1) — nodrop=0 norent=0 tradeskills=1 stackable=20
-- ============================================================
INSERT IGNORE INTO items
  (id, Name, lore, nodrop, norent, stackable, stacksize,
   weight, size, itemtype, icon, idfile, material,
   price, sellrate, tradeskills, classes, races, slots, reqlevel, reclevel)
VALUES
  (148026,'Rough Ruby',        'A rough red gem from Dranik''s Scar.',         0,0,1,20,1,1,17,964,'',0,0,0,1,65535,65535,0,0,0),
  (148030,'Rough Jasper',      'A rough brown gem from Dranik''s Scar.',        0,0,1,20,1,1,17,960,'',0,0,0,1,65535,65535,0,0,0),
  (148034,'Rough Topaz',       'A rough golden gem from Dranik''s Scar.',       0,0,1,20,1,1,17,965,'',0,0,0,1,65535,65535,0,0,0),
  (148038,'Rough Peridot',     'A rough green gem from Dranik''s Scar.',        0,0,1,20,1,1,17,958,'',0,0,0,1,65535,65535,0,0,0),
  (148042,'Rough Sapphire',    'A rough blue gem from Dranik''s Scar.',         0,0,1,20,1,1,17,963,'',0,0,0,1,65535,65535,0,0,0),
  (148046,'Rough Amethyst',    'A rough purple gem from Dranik''s Scar.',       0,0,1,20,1,1,17,962,'',0,0,0,1,65535,65535,0,0,0),
  (148050,'Rough Opal',        'A rough iridescent gem from Dranik''s Scar.',   0,0,1,20,1,1,17,959,'',0,0,0,1,65535,65535,0,0,0),
  (148054,'Rough Jade',        'A rough green stone from Dranik''s Scar.',      0,0,1,20,1,1,17,968,'',0,0,0,1,65535,65535,0,0,0),
  (148058,'Rough Citrine',     'A rough orange gem from Dranik''s Scar.',       0,0,1,20,1,1,17,967,'',0,0,0,1,65535,65535,0,0,0),
  (148062,'Rough Moonstone',   'A rough pale gem from Dranik''s Scar.',         0,0,1,20,1,1,17,966,'',0,0,0,1,65535,65535,0,0,0),
  (148066,'Rough Obsidian',    'A rough black stone from Dranik''s Scar.',      0,0,1,20,1,1,17,1138,'',0,0,0,1,65535,65535,0,0,0),
  (148070,'Rough Amber',       'A rough golden resin from Dranik''s Scar.',     0,0,1,20,1,1,17,953,'',0,0,0,1,65535,65535,0,0,0);

-- ============================================================
-- FACETED INTERMEDIATES (T1)
-- ============================================================
INSERT IGNORE INTO items
  (id, Name, lore, nodrop, norent, stackable, stacksize,
   weight, size, itemtype, icon, idfile, material,
   price, sellrate, tradeskills, classes, races, slots, reqlevel, reclevel)
VALUES
  (148027,'Faceted Ruby',      'A ruby with rough facets beginning to catch the light.',   0,0,1,20,1,1,17,964,'',0,0,0,0,65535,65535,0,0,0),
  (148031,'Faceted Jasper',    'A jasper with rough facets beginning to catch the light.', 0,0,1,20,1,1,17,960,'',0,0,0,0,65535,65535,0,0,0),
  (148035,'Faceted Topaz',     'A topaz with rough facets beginning to catch the light.',  0,0,1,20,1,1,17,965,'',0,0,0,0,65535,65535,0,0,0),
  (148039,'Faceted Peridot',   'A peridot with rough facets beginning to catch the light.',0,0,1,20,1,1,17,958,'',0,0,0,0,65535,65535,0,0,0),
  (148043,'Faceted Sapphire',  'A sapphire with rough facets beginning to catch the light.',0,0,1,20,1,1,17,963,'',0,0,0,0,65535,65535,0,0,0),
  (148047,'Faceted Amethyst',  'An amethyst with rough facets beginning to catch the light.',0,0,1,20,1,1,17,962,'',0,0,0,0,65535,65535,0,0,0),
  (148051,'Faceted Opal',      'An opal with rough facets beginning to catch the light.',  0,0,1,20,1,1,17,959,'',0,0,0,0,65535,65535,0,0,0),
  (148055,'Faceted Jade',      'A jade stone with rough facets.',                          0,0,1,20,1,1,17,968,'',0,0,0,0,65535,65535,0,0,0),
  (148059,'Faceted Citrine',   'A citrine with rough facets beginning to catch the light.',0,0,1,20,1,1,17,967,'',0,0,0,0,65535,65535,0,0,0),
  (148063,'Faceted Moonstone', 'A moonstone with rough facets beginning to glow.',         0,0,1,20,1,1,17,966,'',0,0,0,0,65535,65535,0,0,0),
  (148067,'Faceted Obsidian',  'A shard of obsidian with rough facets.',                   0,0,1,20,1,1,17,1138,'',0,0,0,0,65535,65535,0,0,0),
  (148071,'Faceted Amber',     'A piece of amber with rough facets.',                      0,0,1,20,1,1,17,953,'',0,0,0,0,65535,65535,0,0,0);

-- ============================================================
-- POLISHED INTERMEDIATES (T1)
-- ============================================================
INSERT IGNORE INTO items
  (id, Name, lore, nodrop, norent, stackable, stacksize,
   weight, size, itemtype, icon, idfile, material,
   price, sellrate, tradeskills, classes, races, slots, reqlevel, reclevel)
VALUES
  (148028,'Polished Ruby',      'A ruby polished to a warm red gleam.',       0,0,1,20,1,1,17,964,'',0,0,0,0,65535,65535,0,0,0),
  (148032,'Polished Jasper',    'A jasper polished to a warm brown gleam.',   0,0,1,20,1,1,17,960,'',0,0,0,0,65535,65535,0,0,0),
  (148036,'Polished Topaz',     'A topaz polished to a golden gleam.',        0,0,1,20,1,1,17,965,'',0,0,0,0,65535,65535,0,0,0),
  (148040,'Polished Peridot',   'A peridot polished to a clear green gleam.', 0,0,1,20,1,1,17,958,'',0,0,0,0,65535,65535,0,0,0),
  (148044,'Polished Sapphire',  'A sapphire polished to a deep blue gleam.',  0,0,1,20,1,1,17,963,'',0,0,0,0,65535,65535,0,0,0),
  (148048,'Polished Amethyst',  'An amethyst polished to a vivid purple gleam.',0,0,1,20,1,1,17,962,'',0,0,0,0,65535,65535,0,0,0),
  (148052,'Polished Opal',      'An opal polished to an iridescent gleam.',   0,0,1,20,1,1,17,959,'',0,0,0,0,65535,65535,0,0,0),
  (148056,'Polished Jade',      'A jade stone polished to a smooth finish.',  0,0,1,20,1,1,17,968,'',0,0,0,0,65535,65535,0,0,0),
  (148060,'Polished Citrine',   'A citrine polished to an orange gleam.',     0,0,1,20,1,1,17,967,'',0,0,0,0,65535,65535,0,0,0),
  (148064,'Polished Moonstone', 'A moonstone polished to a pale gleam.',      0,0,1,20,1,1,17,966,'',0,0,0,0,65535,65535,0,0,0),
  (148068,'Polished Obsidian',  'A shard of obsidian polished to a dark sheen.',0,0,1,20,1,1,17,1138,'',0,0,0,0,65535,65535,0,0,0),
  (148072,'Polished Amber',     'A piece of amber polished to a warm glow.',  0,0,1,20,1,1,17,953,'',0,0,0,0,65535,65535,0,0,0);

-- ============================================================
-- FINISHED AUGMENTS (T1) — itemtype=54, augtype=512, augrestrict=0, slots=2097150
-- Column order for stats: astr,asta,adex,aagi,awis,aint,acha,hp,mana,MR,FR,CR,PR,DR
-- ============================================================
INSERT IGNORE INTO items
  (id, Name, lore, nodrop, norent, stackable,
   weight, size, itemtype, magic,
   astr,asta,adex,aagi,awis,aint,acha,hp,mana,MR,FR,CR,PR,DR,
   augtype, augrestrict, augdistiller,
   icon, idfile, material, sellrate, tradeskills,
   classes, races, slots, reqlevel, reclevel)
VALUES
  (148029,'Weathered Ruby of Might',      'A ruby augment granting a bonus to strength.',         0,0,0,0,0,54,1, 1,0,0,0,0,0,0,0,0,0,0,0,0,0, 512,0,0,964,'',0,0,0,65535,65535,2097150,0,0),
  (148033,'Weathered Jasper of Fortitude','A jasper augment granting a bonus to stamina.',        0,0,0,0,0,54,1, 0,1,0,0,0,0,0,0,0,0,0,0,0,0, 512,0,0,960,'',0,0,0,65535,65535,2097150,0,0),
  (148037,'Weathered Topaz of Precision', 'A topaz augment granting a bonus to dexterity.',       0,0,0,0,0,54,1, 0,0,1,0,0,0,0,0,0,0,0,0,0,0, 512,0,0,965,'',0,0,0,65535,65535,2097150,0,0),
  (148041,'Weathered Peridot of Swiftness','A peridot augment granting a bonus to agility.',      0,0,0,0,0,54,1, 0,0,0,1,0,0,0,0,0,0,0,0,0,0, 512,0,0,958,'',0,0,0,65535,65535,2097150,0,0),
  (148045,'Weathered Sapphire of Insight','A sapphire augment granting a bonus to wisdom.',       0,0,0,0,0,54,1, 0,0,0,0,1,0,0,0,0,0,0,0,0,0, 512,0,0,963,'',0,0,0,65535,65535,2097150,0,0),
  (148049,'Weathered Amethyst of Intellect','An amethyst augment granting a bonus to intelligence.',0,0,0,0,0,54,1, 0,0,0,0,0,1,0,0,0,0,0,0,0,0, 512,0,0,962,'',0,0,0,65535,65535,2097150,0,0),
  (148053,'Weathered Opal of Charm',      'An opal augment granting a bonus to charisma.',        0,0,0,0,0,54,1, 0,0,0,0,0,0,1,0,0,0,0,0,0,0, 512,0,0,959,'',0,0,0,65535,65535,2097150,0,0),
  (148057,'Weathered Jade of Warding',    'A jade augment granting magic resistance.',            0,0,0,0,0,54,1, 0,0,0,0,0,0,0,0,0,1,0,0,0,0, 512,0,0,968,'',0,0,0,65535,65535,2097150,0,0),
  (148061,'Weathered Citrine of Shielding','A citrine augment granting fire resistance.',         0,0,0,0,0,54,1, 0,0,0,0,0,0,0,0,0,0,1,0,0,0, 512,0,0,967,'',0,0,0,65535,65535,2097150,0,0),
  (148065,'Weathered Moonstone of Endurance','A moonstone augment granting cold resistance.',     0,0,0,0,0,54,1, 0,0,0,0,0,0,0,0,0,0,0,1,0,0, 512,0,0,966,'',0,0,0,65535,65535,2097150,0,0),
  (148069,'Weathered Obsidian of Immunity','An obsidian augment granting poison resistance.',     0,0,0,0,0,54,1, 0,0,0,0,0,0,0,0,0,0,0,0,1,0, 512,0,0,1138,'',0,0,0,65535,65535,2097150,0,0),
  (148073,'Weathered Amber of Purity',    'An amber augment granting disease resistance.',        0,0,0,0,0,54,1, 0,0,0,0,0,0,0,0,0,0,0,0,0,1, 512,0,0,953,'',0,0,0,65535,65535,2097150,0,0);

-- ============================================================
-- RECIPES (T1) — tradeskill=61, trivials: Facet=25, Polish=40, Aug=60
-- ============================================================
INSERT IGNORE INTO tradeskill_recipe (id, name, tradeskill, skillneeded, trivial, nofail) VALUES
  (31464,'Faceted Ruby',                    61,0,25,0),(31465,'Polished Ruby',                    61,0,40,0),(31466,'Weathered Ruby of Might',          61,0,60,0),
  (31467,'Faceted Jasper',                  61,0,25,0),(31468,'Polished Jasper',                  61,0,40,0),(31469,'Weathered Jasper of Fortitude',    61,0,60,0),
  (31470,'Faceted Topaz',                   61,0,25,0),(31471,'Polished Topaz',                   61,0,40,0),(31472,'Weathered Topaz of Precision',     61,0,60,0),
  (31473,'Faceted Peridot',                 61,0,25,0),(31474,'Polished Peridot',                 61,0,40,0),(31475,'Weathered Peridot of Swiftness',   61,0,60,0),
  (31476,'Faceted Sapphire',                61,0,25,0),(31477,'Polished Sapphire',                61,0,40,0),(31478,'Weathered Sapphire of Insight',    61,0,60,0),
  (31479,'Faceted Amethyst',                61,0,25,0),(31480,'Polished Amethyst',                61,0,40,0),(31481,'Weathered Amethyst of Intellect',  61,0,60,0),
  (31482,'Faceted Opal',                    61,0,25,0),(31483,'Polished Opal',                    61,0,40,0),(31484,'Weathered Opal of Charm',           61,0,60,0),
  (31485,'Faceted Jade',                    61,0,25,0),(31486,'Polished Jade',                    61,0,40,0),(31487,'Weathered Jade of Warding',         61,0,60,0),
  (31488,'Faceted Citrine',                 61,0,25,0),(31489,'Polished Citrine',                 61,0,40,0),(31490,'Weathered Citrine of Shielding',   61,0,60,0),
  (31491,'Faceted Moonstone',               61,0,25,0),(31492,'Polished Moonstone',               61,0,40,0),(31493,'Weathered Moonstone of Endurance', 61,0,60,0),
  (31494,'Faceted Obsidian',                61,0,25,0),(31495,'Polished Obsidian',                61,0,40,0),(31496,'Weathered Obsidian of Immunity',   61,0,60,0),
  (31497,'Faceted Amber',                   61,0,25,0),(31498,'Polished Amber',                   61,0,40,0),(31499,'Weathered Amber of Purity',         61,0,60,0);

-- ============================================================
-- RECIPE ENTRIES (T1)
-- Facet:  2x raw + 1x Minor Gem Grindstone (147988) → faceted
-- Polish: 2x faceted + 1x Minor Gem Polish (147875) → polished
-- Aug:    1x polished + 1x Crude Augment Setting (147989, salvages) → aug
-- ============================================================
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  -- 31464 Faceted Ruby
  (31464,147985,0,0,0,0,1),(31464,148027,1,0,0,0,0),(31464,148026,0,0,2,0,0),(31464,147988,0,0,1,0,0),
  -- 31465 Polished Ruby
  (31465,147985,0,0,0,0,1),(31465,148028,1,0,0,0,0),(31465,148027,0,0,2,0,0),(31465,147875,0,0,1,0,0),
  -- 31466 Weathered Ruby of Might
  (31466,147985,0,0,0,0,1),(31466,148029,1,0,0,0,0),(31466,148028,0,0,1,0,0),(31466,147989,0,0,1,1,0),
  -- 31467 Faceted Jasper
  (31467,147985,0,0,0,0,1),(31467,148031,1,0,0,0,0),(31467,148030,0,0,2,0,0),(31467,147988,0,0,1,0,0),
  -- 31468 Polished Jasper
  (31468,147985,0,0,0,0,1),(31468,148032,1,0,0,0,0),(31468,148031,0,0,2,0,0),(31468,147875,0,0,1,0,0),
  -- 31469 Weathered Jasper of Fortitude
  (31469,147985,0,0,0,0,1),(31469,148033,1,0,0,0,0),(31469,148032,0,0,1,0,0),(31469,147989,0,0,1,1,0),
  -- 31470 Faceted Topaz
  (31470,147985,0,0,0,0,1),(31470,148035,1,0,0,0,0),(31470,148034,0,0,2,0,0),(31470,147988,0,0,1,0,0),
  -- 31471 Polished Topaz
  (31471,147985,0,0,0,0,1),(31471,148036,1,0,0,0,0),(31471,148035,0,0,2,0,0),(31471,147875,0,0,1,0,0),
  -- 31472 Weathered Topaz of Precision
  (31472,147985,0,0,0,0,1),(31472,148037,1,0,0,0,0),(31472,148036,0,0,1,0,0),(31472,147989,0,0,1,1,0),
  -- 31473 Faceted Peridot
  (31473,147985,0,0,0,0,1),(31473,148039,1,0,0,0,0),(31473,148038,0,0,2,0,0),(31473,147988,0,0,1,0,0),
  -- 31474 Polished Peridot
  (31474,147985,0,0,0,0,1),(31474,148040,1,0,0,0,0),(31474,148039,0,0,2,0,0),(31474,147875,0,0,1,0,0),
  -- 31475 Weathered Peridot of Swiftness
  (31475,147985,0,0,0,0,1),(31475,148041,1,0,0,0,0),(31475,148040,0,0,1,0,0),(31475,147989,0,0,1,1,0),
  -- 31476 Faceted Sapphire
  (31476,147985,0,0,0,0,1),(31476,148043,1,0,0,0,0),(31476,148042,0,0,2,0,0),(31476,147988,0,0,1,0,0),
  -- 31477 Polished Sapphire
  (31477,147985,0,0,0,0,1),(31477,148044,1,0,0,0,0),(31477,148043,0,0,2,0,0),(31477,147875,0,0,1,0,0),
  -- 31478 Weathered Sapphire of Insight
  (31478,147985,0,0,0,0,1),(31478,148045,1,0,0,0,0),(31478,148044,0,0,1,0,0),(31478,147989,0,0,1,1,0),
  -- 31479 Faceted Amethyst
  (31479,147985,0,0,0,0,1),(31479,148047,1,0,0,0,0),(31479,148046,0,0,2,0,0),(31479,147988,0,0,1,0,0),
  -- 31480 Polished Amethyst
  (31480,147985,0,0,0,0,1),(31480,148048,1,0,0,0,0),(31480,148047,0,0,2,0,0),(31480,147875,0,0,1,0,0),
  -- 31481 Weathered Amethyst of Intellect
  (31481,147985,0,0,0,0,1),(31481,148049,1,0,0,0,0),(31481,148048,0,0,1,0,0),(31481,147989,0,0,1,1,0),
  -- 31482 Faceted Opal
  (31482,147985,0,0,0,0,1),(31482,148051,1,0,0,0,0),(31482,148050,0,0,2,0,0),(31482,147988,0,0,1,0,0),
  -- 31483 Polished Opal
  (31483,147985,0,0,0,0,1),(31483,148052,1,0,0,0,0),(31483,148051,0,0,2,0,0),(31483,147875,0,0,1,0,0),
  -- 31484 Weathered Opal of Charm
  (31484,147985,0,0,0,0,1),(31484,148053,1,0,0,0,0),(31484,148052,0,0,1,0,0),(31484,147989,0,0,1,1,0),
  -- 31485 Faceted Jade
  (31485,147985,0,0,0,0,1),(31485,148055,1,0,0,0,0),(31485,148054,0,0,2,0,0),(31485,147988,0,0,1,0,0),
  -- 31486 Polished Jade
  (31486,147985,0,0,0,0,1),(31486,148056,1,0,0,0,0),(31486,148055,0,0,2,0,0),(31486,147875,0,0,1,0,0),
  -- 31487 Weathered Jade of Warding
  (31487,147985,0,0,0,0,1),(31487,148057,1,0,0,0,0),(31487,148056,0,0,1,0,0),(31487,147989,0,0,1,1,0),
  -- 31488 Faceted Citrine
  (31488,147985,0,0,0,0,1),(31488,148059,1,0,0,0,0),(31488,148058,0,0,2,0,0),(31488,147988,0,0,1,0,0),
  -- 31489 Polished Citrine
  (31489,147985,0,0,0,0,1),(31489,148060,1,0,0,0,0),(31489,148059,0,0,2,0,0),(31489,147875,0,0,1,0,0),
  -- 31490 Weathered Citrine of Shielding
  (31490,147985,0,0,0,0,1),(31490,148061,1,0,0,0,0),(31490,148060,0,0,1,0,0),(31490,147989,0,0,1,1,0),
  -- 31491 Faceted Moonstone
  (31491,147985,0,0,0,0,1),(31491,148063,1,0,0,0,0),(31491,148062,0,0,2,0,0),(31491,147988,0,0,1,0,0),
  -- 31492 Polished Moonstone
  (31492,147985,0,0,0,0,1),(31492,148064,1,0,0,0,0),(31492,148063,0,0,2,0,0),(31492,147875,0,0,1,0,0),
  -- 31493 Weathered Moonstone of Endurance
  (31493,147985,0,0,0,0,1),(31493,148065,1,0,0,0,0),(31493,148064,0,0,1,0,0),(31493,147989,0,0,1,1,0),
  -- 31494 Faceted Obsidian
  (31494,147985,0,0,0,0,1),(31494,148067,1,0,0,0,0),(31494,148066,0,0,2,0,0),(31494,147988,0,0,1,0,0),
  -- 31495 Polished Obsidian
  (31495,147985,0,0,0,0,1),(31495,148068,1,0,0,0,0),(31495,148067,0,0,2,0,0),(31495,147875,0,0,1,0,0),
  -- 31496 Weathered Obsidian of Immunity
  (31496,147985,0,0,0,0,1),(31496,148069,1,0,0,0,0),(31496,148068,0,0,1,0,0),(31496,147989,0,0,1,1,0),
  -- 31497 Faceted Amber
  (31497,147985,0,0,0,0,1),(31497,148071,1,0,0,0,0),(31497,148070,0,0,2,0,0),(31497,147988,0,0,1,0,0),
  -- 31498 Polished Amber
  (31498,147985,0,0,0,0,1),(31498,148072,1,0,0,0,0),(31498,148071,0,0,2,0,0),(31498,147875,0,0,1,0,0),
  -- 31499 Weathered Amber of Purity
  (31499,147985,0,0,0,0,1),(31499,148073,1,0,0,0,0),(31499,148072,0,0,1,0,0),(31499,147989,0,0,1,1,0);
