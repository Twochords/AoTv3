-- Gem Cutting: Tier 3 Pure Stat & Resist Augments
-- Item IDs 148122–148169 | Recipes 31536–31571
-- Trivials: Facet=115, Polish=130, Aug=155 | Stat value: +4
-- Shared polish: Superior Gem Polish (147930) | Grindstone: 148008 | Setting: 148009

-- ============================================================
-- RAW DROPS (T3) — "Deep [Gem] Crystal"
-- ============================================================
INSERT IGNORE INTO items
  (id, Name, lore, nodrop, norent, stackable, stacksize,
   weight, size, itemtype, icon, idfile, material,
   price, sellrate, tradeskills, classes, races, slots, reqlevel, reclevel)
VALUES
  (148122,'Deep Ruby Crystal',      'A vivid red crystal from the Catacombs and Hollows.',     0,0,1,20,1,1,17,964,'',0,0,0,1,65535,65535,0,0,0),
  (148126,'Deep Jasper Crystal',    'A vivid brown crystal from the Catacombs and Hollows.',   0,0,1,20,1,1,17,960,'',0,0,0,1,65535,65535,0,0,0),
  (148130,'Deep Topaz Crystal',     'A vivid golden crystal from the Catacombs and Hollows.',  0,0,1,20,1,1,17,965,'',0,0,0,1,65535,65535,0,0,0),
  (148134,'Deep Peridot Crystal',   'A vivid green crystal from the Catacombs and Hollows.',   0,0,1,20,1,1,17,958,'',0,0,0,1,65535,65535,0,0,0),
  (148138,'Deep Sapphire Crystal',  'A vivid blue crystal from the Catacombs and Hollows.',    0,0,1,20,1,1,17,963,'',0,0,0,1,65535,65535,0,0,0),
  (148142,'Deep Amethyst Crystal',  'A vivid purple crystal from the Catacombs and Hollows.',  0,0,1,20,1,1,17,962,'',0,0,0,1,65535,65535,0,0,0),
  (148146,'Deep Opal Crystal',      'A vivid iridescent crystal from the Catacombs and Hollows.',0,0,1,20,1,1,17,959,'',0,0,0,1,65535,65535,0,0,0),
  (148150,'Deep Jade Crystal',      'A vivid green stone from the Catacombs and Hollows.',     0,0,1,20,1,1,17,968,'',0,0,0,1,65535,65535,0,0,0),
  (148154,'Deep Citrine Crystal',   'A vivid orange crystal from the Catacombs and Hollows.',  0,0,1,20,1,1,17,967,'',0,0,0,1,65535,65535,0,0,0),
  (148158,'Deep Moonstone Crystal', 'A vivid glowing crystal from the Catacombs and Hollows.', 0,0,1,20,1,1,17,966,'',0,0,0,1,65535,65535,0,0,0),
  (148162,'Deep Obsidian Crystal',  'A vivid black shard from the Catacombs and Hollows.',     0,0,1,20,1,1,17,1138,'',0,0,0,1,65535,65535,0,0,0),
  (148166,'Deep Amber Crystal',     'A vivid golden crystal from the Catacombs and Hollows.',  0,0,1,20,1,1,17,953,'',0,0,0,1,65535,65535,0,0,0);

-- ============================================================
-- FACETED INTERMEDIATES (T3)
-- ============================================================
INSERT IGNORE INTO items
  (id, Name, lore, nodrop, norent, stackable, stacksize,
   weight, size, itemtype, icon, idfile, material,
   price, sellrate, tradeskills, classes, races, slots, reqlevel, reclevel)
VALUES
  (148123,'Faceted Deep Ruby',      'A deeply faceted ruby revealing its inner fire.',     0,0,1,20,1,1,17,964,'',0,0,0,0,65535,65535,0,0,0),
  (148127,'Faceted Deep Jasper',    'A deeply faceted jasper revealing its inner warmth.', 0,0,1,20,1,1,17,960,'',0,0,0,0,65535,65535,0,0,0),
  (148131,'Faceted Deep Topaz',     'A deeply faceted topaz revealing its inner gleam.',   0,0,1,20,1,1,17,965,'',0,0,0,0,65535,65535,0,0,0),
  (148135,'Faceted Deep Peridot',   'A deeply faceted peridot revealing its inner light.', 0,0,1,20,1,1,17,958,'',0,0,0,0,65535,65535,0,0,0),
  (148139,'Faceted Deep Sapphire',  'A deeply faceted sapphire revealing its inner depth.',0,0,1,20,1,1,17,963,'',0,0,0,0,65535,65535,0,0,0),
  (148143,'Faceted Deep Amethyst',  'A deeply faceted amethyst revealing its inner hue.',  0,0,1,20,1,1,17,962,'',0,0,0,0,65535,65535,0,0,0),
  (148147,'Faceted Deep Opal',      'A deeply faceted opal revealing its inner shimmer.',  0,0,1,20,1,1,17,959,'',0,0,0,0,65535,65535,0,0,0),
  (148151,'Faceted Deep Jade',      'A deeply faceted jade stone.',                        0,0,1,20,1,1,17,968,'',0,0,0,0,65535,65535,0,0,0),
  (148155,'Faceted Deep Citrine',   'A deeply faceted citrine revealing its inner warmth.',0,0,1,20,1,1,17,967,'',0,0,0,0,65535,65535,0,0,0),
  (148159,'Faceted Deep Moonstone', 'A deeply faceted moonstone with a vivid glow.',       0,0,1,20,1,1,17,966,'',0,0,0,0,65535,65535,0,0,0),
  (148163,'Faceted Deep Obsidian',  'A deeply faceted shard of obsidian.',                 0,0,1,20,1,1,17,1138,'',0,0,0,0,65535,65535,0,0,0),
  (148167,'Faceted Deep Amber',     'A deeply faceted piece of amber.',                    0,0,1,20,1,1,17,953,'',0,0,0,0,65535,65535,0,0,0);

-- ============================================================
-- POLISHED INTERMEDIATES (T3)
-- ============================================================
INSERT IGNORE INTO items
  (id, Name, lore, nodrop, norent, stackable, stacksize,
   weight, size, itemtype, icon, idfile, material,
   price, sellrate, tradeskills, classes, races, slots, reqlevel, reclevel)
VALUES
  (148124,'Polished Deep Ruby',      'A brilliantly polished deep ruby radiating power.',        0,0,1,20,1,1,17,964,'',0,0,0,0,65535,65535,0,0,0),
  (148128,'Polished Deep Jasper',    'A brilliantly polished deep jasper radiating endurance.',   0,0,1,20,1,1,17,960,'',0,0,0,0,65535,65535,0,0,0),
  (148132,'Polished Deep Topaz',     'A brilliantly polished deep topaz radiating precision.',    0,0,1,20,1,1,17,965,'',0,0,0,0,65535,65535,0,0,0),
  (148136,'Polished Deep Peridot',   'A brilliantly polished deep peridot radiating speed.',      0,0,1,20,1,1,17,958,'',0,0,0,0,65535,65535,0,0,0),
  (148140,'Polished Deep Sapphire',  'A brilliantly polished deep sapphire radiating insight.',   0,0,1,20,1,1,17,963,'',0,0,0,0,65535,65535,0,0,0),
  (148144,'Polished Deep Amethyst',  'A brilliantly polished deep amethyst radiating intellect.', 0,0,1,20,1,1,17,962,'',0,0,0,0,65535,65535,0,0,0),
  (148148,'Polished Deep Opal',      'A brilliantly polished deep opal radiating charm.',         0,0,1,20,1,1,17,959,'',0,0,0,0,65535,65535,0,0,0),
  (148152,'Polished Deep Jade',      'A brilliantly polished deep jade radiating warding.',       0,0,1,20,1,1,17,968,'',0,0,0,0,65535,65535,0,0,0),
  (148156,'Polished Deep Citrine',   'A brilliantly polished deep citrine radiating shielding.',  0,0,1,20,1,1,17,967,'',0,0,0,0,65535,65535,0,0,0),
  (148160,'Polished Deep Moonstone', 'A brilliantly polished deep moonstone radiating cold.',     0,0,1,20,1,1,17,966,'',0,0,0,0,65535,65535,0,0,0),
  (148164,'Polished Deep Obsidian',  'A brilliantly polished deep obsidian radiating immunity.',  0,0,1,20,1,1,17,1138,'',0,0,0,0,65535,65535,0,0,0),
  (148168,'Polished Deep Amber',     'A brilliantly polished deep amber radiating purity.',       0,0,1,20,1,1,17,953,'',0,0,0,0,65535,65535,0,0,0);

-- ============================================================
-- FINISHED AUGMENTS (T3) — +4 to single stat or resist
-- ============================================================
INSERT IGNORE INTO items
  (id, Name, lore, nodrop, norent, stackable,
   weight, size, itemtype, magic,
   astr,asta,adex,aagi,awis,aint,acha,hp,mana,MR,FR,CR,PR,DR,
   augtype, augrestrict, augdistiller,
   icon, idfile, material, sellrate, tradeskills,
   classes, races, slots, reqlevel, reclevel)
VALUES
  (148125,'Tempered Ruby of Might',         'A tempered ruby augment granting a strong bonus to strength.',        0,0,0,0,0,54,1, 4,0,0,0,0,0,0,0,0,0,0,0,0,0, 512,0,0,964,'',0,0,0,65535,65535,2097150,0,0),
  (148129,'Tempered Jasper of Fortitude',   'A tempered jasper augment granting a strong bonus to stamina.',       0,0,0,0,0,54,1, 0,4,0,0,0,0,0,0,0,0,0,0,0,0, 512,0,0,960,'',0,0,0,65535,65535,2097150,0,0),
  (148133,'Tempered Topaz of Precision',    'A tempered topaz augment granting a strong bonus to dexterity.',      0,0,0,0,0,54,1, 0,0,4,0,0,0,0,0,0,0,0,0,0,0, 512,0,0,965,'',0,0,0,65535,65535,2097150,0,0),
  (148137,'Tempered Peridot of Swiftness',  'A tempered peridot augment granting a strong bonus to agility.',      0,0,0,0,0,54,1, 0,0,0,4,0,0,0,0,0,0,0,0,0,0, 512,0,0,958,'',0,0,0,65535,65535,2097150,0,0),
  (148141,'Tempered Sapphire of Insight',   'A tempered sapphire augment granting a strong bonus to wisdom.',      0,0,0,0,0,54,1, 0,0,0,0,4,0,0,0,0,0,0,0,0,0, 512,0,0,963,'',0,0,0,65535,65535,2097150,0,0),
  (148145,'Tempered Amethyst of Intellect', 'A tempered amethyst augment granting a strong bonus to intelligence.',0,0,0,0,0,54,1, 0,0,0,0,0,4,0,0,0,0,0,0,0,0, 512,0,0,962,'',0,0,0,65535,65535,2097150,0,0),
  (148149,'Tempered Opal of Charm',         'A tempered opal augment granting a strong bonus to charisma.',        0,0,0,0,0,54,1, 0,0,0,0,0,0,4,0,0,0,0,0,0,0, 512,0,0,959,'',0,0,0,65535,65535,2097150,0,0),
  (148153,'Tempered Jade of Warding',       'A tempered jade augment granting strong magic resistance.',           0,0,0,0,0,54,1, 0,0,0,0,0,0,0,0,0,4,0,0,0,0, 512,0,0,968,'',0,0,0,65535,65535,2097150,0,0),
  (148157,'Tempered Citrine of Shielding',  'A tempered citrine augment granting strong fire resistance.',          0,0,0,0,0,54,1, 0,0,0,0,0,0,0,0,0,0,4,0,0,0, 512,0,0,967,'',0,0,0,65535,65535,2097150,0,0),
  (148161,'Tempered Moonstone of Endurance','A tempered moonstone augment granting strong cold resistance.',        0,0,0,0,0,54,1, 0,0,0,0,0,0,0,0,0,0,0,4,0,0, 512,0,0,966,'',0,0,0,65535,65535,2097150,0,0),
  (148165,'Tempered Obsidian of Immunity',  'A tempered obsidian augment granting strong poison resistance.',       0,0,0,0,0,54,1, 0,0,0,0,0,0,0,0,0,0,0,0,4,0, 512,0,0,1138,'',0,0,0,65535,65535,2097150,0,0),
  (148169,'Tempered Amber of Purity',       'A tempered amber augment granting strong disease resistance.',         0,0,0,0,0,54,1, 0,0,0,0,0,0,0,0,0,0,0,0,0,4, 512,0,0,953,'',0,0,0,65535,65535,2097150,0,0);

-- ============================================================
-- RECIPES (T3) — Facet=115, Polish=130, Aug=155
-- ============================================================
INSERT IGNORE INTO tradeskill_recipe (id, name, tradeskill, skillneeded, trivial, nofail) VALUES
  (31536,'Faceted Deep Ruby',                      61,0,115,0),(31537,'Polished Deep Ruby',                      61,0,130,0),(31538,'Tempered Ruby of Might',          61,0,155,0),
  (31539,'Faceted Deep Jasper',                    61,0,115,0),(31540,'Polished Deep Jasper',                    61,0,130,0),(31541,'Tempered Jasper of Fortitude',    61,0,155,0),
  (31542,'Faceted Deep Topaz',                     61,0,115,0),(31543,'Polished Deep Topaz',                     61,0,130,0),(31544,'Tempered Topaz of Precision',     61,0,155,0),
  (31545,'Faceted Deep Peridot',                   61,0,115,0),(31546,'Polished Deep Peridot',                   61,0,130,0),(31547,'Tempered Peridot of Swiftness',   61,0,155,0),
  (31548,'Faceted Deep Sapphire',                  61,0,115,0),(31549,'Polished Deep Sapphire',                  61,0,130,0),(31550,'Tempered Sapphire of Insight',    61,0,155,0),
  (31551,'Faceted Deep Amethyst',                  61,0,115,0),(31552,'Polished Deep Amethyst',                  61,0,130,0),(31553,'Tempered Amethyst of Intellect',  61,0,155,0),
  (31554,'Faceted Deep Opal',                      61,0,115,0),(31555,'Polished Deep Opal',                      61,0,130,0),(31556,'Tempered Opal of Charm',           61,0,155,0),
  (31557,'Faceted Deep Jade',                      61,0,115,0),(31558,'Polished Deep Jade',                      61,0,130,0),(31559,'Tempered Jade of Warding',         61,0,155,0),
  (31560,'Faceted Deep Citrine',                   61,0,115,0),(31561,'Polished Deep Citrine',                   61,0,130,0),(31562,'Tempered Citrine of Shielding',   61,0,155,0),
  (31563,'Faceted Deep Moonstone',                 61,0,115,0),(31564,'Polished Deep Moonstone',                 61,0,130,0),(31565,'Tempered Moonstone of Endurance', 61,0,155,0),
  (31566,'Faceted Deep Obsidian',                  61,0,115,0),(31567,'Polished Deep Obsidian',                  61,0,130,0),(31568,'Tempered Obsidian of Immunity',   61,0,155,0),
  (31569,'Faceted Deep Amber',                     61,0,115,0),(31570,'Polished Deep Amber',                     61,0,130,0),(31571,'Tempered Amber of Purity',         61,0,155,0);

-- ============================================================
-- RECIPE ENTRIES (T3)
-- Facet:  2x crystal + 1x Superior Gem Grindstone (148008) → faceted
-- Polish: 2x faceted + 1x Superior Gem Polish (147930) → polished
-- Aug:    1x polished + 1x Refined Augment Setting (148009, salvages) → aug
-- ============================================================
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31536,147985,0,0,0,0,1),(31536,148123,1,0,0,0,0),(31536,148122,0,0,2,0,0),(31536,148008,0,0,1,0,0),
  (31537,147985,0,0,0,0,1),(31537,148124,1,0,0,0,0),(31537,148123,0,0,2,0,0),(31537,147930,0,0,1,0,0),
  (31538,147985,0,0,0,0,1),(31538,148125,1,0,0,0,0),(31538,148124,0,0,1,0,0),(31538,148009,0,0,1,1,0),
  (31539,147985,0,0,0,0,1),(31539,148127,1,0,0,0,0),(31539,148126,0,0,2,0,0),(31539,148008,0,0,1,0,0),
  (31540,147985,0,0,0,0,1),(31540,148128,1,0,0,0,0),(31540,148127,0,0,2,0,0),(31540,147930,0,0,1,0,0),
  (31541,147985,0,0,0,0,1),(31541,148129,1,0,0,0,0),(31541,148128,0,0,1,0,0),(31541,148009,0,0,1,1,0),
  (31542,147985,0,0,0,0,1),(31542,148131,1,0,0,0,0),(31542,148130,0,0,2,0,0),(31542,148008,0,0,1,0,0),
  (31543,147985,0,0,0,0,1),(31543,148132,1,0,0,0,0),(31543,148131,0,0,2,0,0),(31543,147930,0,0,1,0,0),
  (31544,147985,0,0,0,0,1),(31544,148133,1,0,0,0,0),(31544,148132,0,0,1,0,0),(31544,148009,0,0,1,1,0),
  (31545,147985,0,0,0,0,1),(31545,148135,1,0,0,0,0),(31545,148134,0,0,2,0,0),(31545,148008,0,0,1,0,0),
  (31546,147985,0,0,0,0,1),(31546,148136,1,0,0,0,0),(31546,148135,0,0,2,0,0),(31546,147930,0,0,1,0,0),
  (31547,147985,0,0,0,0,1),(31547,148137,1,0,0,0,0),(31547,148136,0,0,1,0,0),(31547,148009,0,0,1,1,0),
  (31548,147985,0,0,0,0,1),(31548,148139,1,0,0,0,0),(31548,148138,0,0,2,0,0),(31548,148008,0,0,1,0,0),
  (31549,147985,0,0,0,0,1),(31549,148140,1,0,0,0,0),(31549,148139,0,0,2,0,0),(31549,147930,0,0,1,0,0),
  (31550,147985,0,0,0,0,1),(31550,148141,1,0,0,0,0),(31550,148140,0,0,1,0,0),(31550,148009,0,0,1,1,0),
  (31551,147985,0,0,0,0,1),(31551,148143,1,0,0,0,0),(31551,148142,0,0,2,0,0),(31551,148008,0,0,1,0,0),
  (31552,147985,0,0,0,0,1),(31552,148144,1,0,0,0,0),(31552,148143,0,0,2,0,0),(31552,147930,0,0,1,0,0),
  (31553,147985,0,0,0,0,1),(31553,148145,1,0,0,0,0),(31553,148144,0,0,1,0,0),(31553,148009,0,0,1,1,0),
  (31554,147985,0,0,0,0,1),(31554,148147,1,0,0,0,0),(31554,148146,0,0,2,0,0),(31554,148008,0,0,1,0,0),
  (31555,147985,0,0,0,0,1),(31555,148148,1,0,0,0,0),(31555,148147,0,0,2,0,0),(31555,147930,0,0,1,0,0),
  (31556,147985,0,0,0,0,1),(31556,148149,1,0,0,0,0),(31556,148148,0,0,1,0,0),(31556,148009,0,0,1,1,0),
  (31557,147985,0,0,0,0,1),(31557,148151,1,0,0,0,0),(31557,148150,0,0,2,0,0),(31557,148008,0,0,1,0,0),
  (31558,147985,0,0,0,0,1),(31558,148152,1,0,0,0,0),(31558,148151,0,0,2,0,0),(31558,147930,0,0,1,0,0),
  (31559,147985,0,0,0,0,1),(31559,148153,1,0,0,0,0),(31559,148152,0,0,1,0,0),(31559,148009,0,0,1,1,0),
  (31560,147985,0,0,0,0,1),(31560,148155,1,0,0,0,0),(31560,148154,0,0,2,0,0),(31560,148008,0,0,1,0,0),
  (31561,147985,0,0,0,0,1),(31561,148156,1,0,0,0,0),(31561,148155,0,0,2,0,0),(31561,147930,0,0,1,0,0),
  (31562,147985,0,0,0,0,1),(31562,148157,1,0,0,0,0),(31562,148156,0,0,1,0,0),(31562,148009,0,0,1,1,0),
  (31563,147985,0,0,0,0,1),(31563,148159,1,0,0,0,0),(31563,148158,0,0,2,0,0),(31563,148008,0,0,1,0,0),
  (31564,147985,0,0,0,0,1),(31564,148160,1,0,0,0,0),(31564,148159,0,0,2,0,0),(31564,147930,0,0,1,0,0),
  (31565,147985,0,0,0,0,1),(31565,148161,1,0,0,0,0),(31565,148160,0,0,1,0,0),(31565,148009,0,0,1,1,0),
  (31566,147985,0,0,0,0,1),(31566,148163,1,0,0,0,0),(31566,148162,0,0,2,0,0),(31566,148008,0,0,1,0,0),
  (31567,147985,0,0,0,0,1),(31567,148164,1,0,0,0,0),(31567,148163,0,0,2,0,0),(31567,147930,0,0,1,0,0),
  (31568,147985,0,0,0,0,1),(31568,148165,1,0,0,0,0),(31568,148164,0,0,1,0,0),(31568,148009,0,0,1,1,0),
  (31569,147985,0,0,0,0,1),(31569,148167,1,0,0,0,0),(31569,148166,0,0,2,0,0),(31569,148008,0,0,1,0,0),
  (31570,147985,0,0,0,0,1),(31570,148168,1,0,0,0,0),(31570,148167,0,0,2,0,0),(31570,147930,0,0,1,0,0),
  (31571,147985,0,0,0,0,1),(31571,148169,1,0,0,0,0),(31571,148168,0,0,1,0,0),(31571,148009,0,0,1,1,0);
