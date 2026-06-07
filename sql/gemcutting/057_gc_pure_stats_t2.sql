-- Gem Cutting: Tier 2 Pure Stat & Resist Augments
-- Item IDs 148074–148121 | Recipes 31500–31535
-- Trivials: Facet=75, Polish=90, Aug=115 | Stat value: +2
-- Shared polish: Standard Gem Polish (147901) | Grindstone: 147998 | Setting: 147999

-- ============================================================
-- RAW DROPS (T2) — "Pale [Gem] Chip"
-- ============================================================
INSERT IGNORE INTO items
  (id, Name, lore, nodrop, norent, stackable, stacksize,
   weight, size, itemtype, icon, idfile, material,
   price, sellrate, tradeskills, classes, races, slots, reqlevel, reclevel)
VALUES
  (148074,'Pale Ruby Chip',        'A pale red gem chip from the Bloodfields and Ruined City.',  0,0,1,20,1,1,17,964,'',0,0,0,1,65535,65535,0,0,0),
  (148078,'Pale Jasper Chip',      'A pale brown gem chip from the Bloodfields and Ruined City.',0,0,1,20,1,1,17,960,'',0,0,0,1,65535,65535,0,0,0),
  (148082,'Pale Topaz Chip',       'A pale golden gem chip from the Bloodfields and Ruined City.',0,0,1,20,1,1,17,965,'',0,0,0,1,65535,65535,0,0,0),
  (148086,'Pale Peridot Chip',     'A pale green gem chip from the Bloodfields and Ruined City.',0,0,1,20,1,1,17,958,'',0,0,0,1,65535,65535,0,0,0),
  (148090,'Pale Sapphire Chip',    'A pale blue gem chip from the Bloodfields and Ruined City.', 0,0,1,20,1,1,17,963,'',0,0,0,1,65535,65535,0,0,0),
  (148094,'Pale Amethyst Chip',    'A pale purple gem chip from the Bloodfields and Ruined City.',0,0,1,20,1,1,17,962,'',0,0,0,1,65535,65535,0,0,0),
  (148098,'Pale Opal Chip',        'A pale iridescent gem chip from the Bloodfields and Ruined City.',0,0,1,20,1,1,17,959,'',0,0,0,1,65535,65535,0,0,0),
  (148102,'Pale Jade Chip',        'A pale green stone chip from the Bloodfields and Ruined City.',0,0,1,20,1,1,17,968,'',0,0,0,1,65535,65535,0,0,0),
  (148106,'Pale Citrine Chip',     'A pale orange gem chip from the Bloodfields and Ruined City.',0,0,1,20,1,1,17,967,'',0,0,0,1,65535,65535,0,0,0),
  (148110,'Pale Moonstone Chip',   'A pale glowing gem chip from the Bloodfields and Ruined City.',0,0,1,20,1,1,17,966,'',0,0,0,1,65535,65535,0,0,0),
  (148114,'Pale Obsidian Chip',    'A pale black stone chip from the Bloodfields and Ruined City.',0,0,1,20,1,1,17,1138,'',0,0,0,1,65535,65535,0,0,0),
  (148118,'Pale Amber Chip',       'A pale golden resin chip from the Bloodfields and Ruined City.',0,0,1,20,1,1,17,953,'',0,0,0,1,65535,65535,0,0,0);

-- ============================================================
-- FACETED INTERMEDIATES (T2)
-- ============================================================
INSERT IGNORE INTO items
  (id, Name, lore, nodrop, norent, stackable, stacksize,
   weight, size, itemtype, icon, idfile, material,
   price, sellrate, tradeskills, classes, races, slots, reqlevel, reclevel)
VALUES
  (148075,'Faceted Pale Ruby',      'A faceted pale ruby showing its growing depth.',     0,0,1,20,1,1,17,964,'',0,0,0,0,65535,65535,0,0,0),
  (148079,'Faceted Pale Jasper',    'A faceted pale jasper showing its growing warmth.',  0,0,1,20,1,1,17,960,'',0,0,0,0,65535,65535,0,0,0),
  (148083,'Faceted Pale Topaz',     'A faceted pale topaz showing its growing gleam.',    0,0,1,20,1,1,17,965,'',0,0,0,0,65535,65535,0,0,0),
  (148087,'Faceted Pale Peridot',   'A faceted pale peridot showing its growing clarity.',0,0,1,20,1,1,17,958,'',0,0,0,0,65535,65535,0,0,0),
  (148091,'Faceted Pale Sapphire',  'A faceted pale sapphire showing its growing depth.', 0,0,1,20,1,1,17,963,'',0,0,0,0,65535,65535,0,0,0),
  (148095,'Faceted Pale Amethyst',  'A faceted pale amethyst showing its growing hue.',   0,0,1,20,1,1,17,962,'',0,0,0,0,65535,65535,0,0,0),
  (148099,'Faceted Pale Opal',      'A faceted pale opal showing its growing shimmer.',   0,0,1,20,1,1,17,959,'',0,0,0,0,65535,65535,0,0,0),
  (148103,'Faceted Pale Jade',      'A faceted pale jade stone.',                         0,0,1,20,1,1,17,968,'',0,0,0,0,65535,65535,0,0,0),
  (148107,'Faceted Pale Citrine',   'A faceted pale citrine showing its growing warmth.', 0,0,1,20,1,1,17,967,'',0,0,0,0,65535,65535,0,0,0),
  (148111,'Faceted Pale Moonstone', 'A faceted pale moonstone beginning to glow.',        0,0,1,20,1,1,17,966,'',0,0,0,0,65535,65535,0,0,0),
  (148115,'Faceted Pale Obsidian',  'A faceted shard of pale obsidian.',                  0,0,1,20,1,1,17,1138,'',0,0,0,0,65535,65535,0,0,0),
  (148119,'Faceted Pale Amber',     'A faceted piece of pale amber.',                     0,0,1,20,1,1,17,953,'',0,0,0,0,65535,65535,0,0,0);

-- ============================================================
-- POLISHED INTERMEDIATES (T2)
-- ============================================================
INSERT IGNORE INTO items
  (id, Name, lore, nodrop, norent, stackable, stacksize,
   weight, size, itemtype, icon, idfile, material,
   price, sellrate, tradeskills, classes, races, slots, reqlevel, reclevel)
VALUES
  (148076,'Polished Pale Ruby',      'A polished pale ruby with a strengthening red gleam.',     0,0,1,20,1,1,17,964,'',0,0,0,0,65535,65535,0,0,0),
  (148080,'Polished Pale Jasper',    'A polished pale jasper with a solid brown gleam.',         0,0,1,20,1,1,17,960,'',0,0,0,0,65535,65535,0,0,0),
  (148084,'Polished Pale Topaz',     'A polished pale topaz with a focused golden gleam.',       0,0,1,20,1,1,17,965,'',0,0,0,0,65535,65535,0,0,0),
  (148088,'Polished Pale Peridot',   'A polished pale peridot with a swift green gleam.',        0,0,1,20,1,1,17,958,'',0,0,0,0,65535,65535,0,0,0),
  (148092,'Polished Pale Sapphire',  'A polished pale sapphire with a knowing blue gleam.',      0,0,1,20,1,1,17,963,'',0,0,0,0,65535,65535,0,0,0),
  (148096,'Polished Pale Amethyst',  'A polished pale amethyst with a sharp purple gleam.',      0,0,1,20,1,1,17,962,'',0,0,0,0,65535,65535,0,0,0),
  (148100,'Polished Pale Opal',      'A polished pale opal with a charming iridescent gleam.',   0,0,1,20,1,1,17,959,'',0,0,0,0,65535,65535,0,0,0),
  (148104,'Polished Pale Jade',      'A polished pale jade with a warding green gleam.',         0,0,1,20,1,1,17,968,'',0,0,0,0,65535,65535,0,0,0),
  (148108,'Polished Pale Citrine',   'A polished pale citrine with a shielding orange gleam.',   0,0,1,20,1,1,17,967,'',0,0,0,0,65535,65535,0,0,0),
  (148112,'Polished Pale Moonstone', 'A polished pale moonstone with a cool gleam.',             0,0,1,20,1,1,17,966,'',0,0,0,0,65535,65535,0,0,0),
  (148116,'Polished Pale Obsidian',  'A polished pale obsidian with a dark sheen.',              0,0,1,20,1,1,17,1138,'',0,0,0,0,65535,65535,0,0,0),
  (148120,'Polished Pale Amber',     'A polished piece of pale amber with a warm glow.',         0,0,1,20,1,1,17,953,'',0,0,0,0,65535,65535,0,0,0);

-- ============================================================
-- FINISHED AUGMENTS (T2) — +2 to single stat or resist
-- ============================================================
INSERT IGNORE INTO items
  (id, Name, lore, nodrop, norent, stackable,
   weight, size, itemtype, magic,
   astr,asta,adex,aagi,awis,aint,acha,hp,mana,MR,FR,CR,PR,DR,
   augtype, augrestrict, augdistiller,
   icon, idfile, material, sellrate, tradeskills,
   classes, races, slots, reqlevel, reclevel)
VALUES
  (148077,'Reinforced Ruby of Might',       'A reinforced ruby augment granting a solid bonus to strength.',        0,0,0,0,0,54,1, 2,0,0,0,0,0,0,0,0,0,0,0,0,0, 512,0,0,964,'',0,0,0,65535,65535,2097150,0,0),
  (148081,'Reinforced Jasper of Fortitude', 'A reinforced jasper augment granting a solid bonus to stamina.',       0,0,0,0,0,54,1, 0,2,0,0,0,0,0,0,0,0,0,0,0,0, 512,0,0,960,'',0,0,0,65535,65535,2097150,0,0),
  (148085,'Reinforced Topaz of Precision',  'A reinforced topaz augment granting a solid bonus to dexterity.',      0,0,0,0,0,54,1, 0,0,2,0,0,0,0,0,0,0,0,0,0,0, 512,0,0,965,'',0,0,0,65535,65535,2097150,0,0),
  (148089,'Reinforced Peridot of Swiftness','A reinforced peridot augment granting a solid bonus to agility.',      0,0,0,0,0,54,1, 0,0,0,2,0,0,0,0,0,0,0,0,0,0, 512,0,0,958,'',0,0,0,65535,65535,2097150,0,0),
  (148093,'Reinforced Sapphire of Insight', 'A reinforced sapphire augment granting a solid bonus to wisdom.',      0,0,0,0,0,54,1, 0,0,0,0,2,0,0,0,0,0,0,0,0,0, 512,0,0,963,'',0,0,0,65535,65535,2097150,0,0),
  (148097,'Reinforced Amethyst of Intellect','A reinforced amethyst augment granting a solid bonus to intelligence.',0,0,0,0,0,54,1, 0,0,0,0,0,2,0,0,0,0,0,0,0,0, 512,0,0,962,'',0,0,0,65535,65535,2097150,0,0),
  (148101,'Reinforced Opal of Charm',       'A reinforced opal augment granting a solid bonus to charisma.',        0,0,0,0,0,54,1, 0,0,0,0,0,0,2,0,0,0,0,0,0,0, 512,0,0,959,'',0,0,0,65535,65535,2097150,0,0),
  (148105,'Reinforced Jade of Warding',     'A reinforced jade augment granting solid magic resistance.',           0,0,0,0,0,54,1, 0,0,0,0,0,0,0,0,0,2,0,0,0,0, 512,0,0,968,'',0,0,0,65535,65535,2097150,0,0),
  (148109,'Reinforced Citrine of Shielding','A reinforced citrine augment granting solid fire resistance.',          0,0,0,0,0,54,1, 0,0,0,0,0,0,0,0,0,0,2,0,0,0, 512,0,0,967,'',0,0,0,65535,65535,2097150,0,0),
  (148113,'Reinforced Moonstone of Endurance','A reinforced moonstone augment granting solid cold resistance.',      0,0,0,0,0,54,1, 0,0,0,0,0,0,0,0,0,0,0,2,0,0, 512,0,0,966,'',0,0,0,65535,65535,2097150,0,0),
  (148117,'Reinforced Obsidian of Immunity','A reinforced obsidian augment granting solid poison resistance.',       0,0,0,0,0,54,1, 0,0,0,0,0,0,0,0,0,0,0,0,2,0, 512,0,0,1138,'',0,0,0,65535,65535,2097150,0,0),
  (148121,'Reinforced Amber of Purity',     'A reinforced amber augment granting solid disease resistance.',         0,0,0,0,0,54,1, 0,0,0,0,0,0,0,0,0,0,0,0,0,2, 512,0,0,953,'',0,0,0,65535,65535,2097150,0,0);

-- ============================================================
-- RECIPES (T2) — Facet=75, Polish=90, Aug=115
-- ============================================================
INSERT IGNORE INTO tradeskill_recipe (id, name, tradeskill, skillneeded, trivial, nofail) VALUES
  (31500,'Faceted Pale Ruby',                      61,0,75,0),(31501,'Polished Pale Ruby',                      61,0,90,0),(31502,'Reinforced Ruby of Might',         61,0,115,0),
  (31503,'Faceted Pale Jasper',                    61,0,75,0),(31504,'Polished Pale Jasper',                    61,0,90,0),(31505,'Reinforced Jasper of Fortitude',   61,0,115,0),
  (31506,'Faceted Pale Topaz',                     61,0,75,0),(31507,'Polished Pale Topaz',                     61,0,90,0),(31508,'Reinforced Topaz of Precision',    61,0,115,0),
  (31509,'Faceted Pale Peridot',                   61,0,75,0),(31510,'Polished Pale Peridot',                   61,0,90,0),(31511,'Reinforced Peridot of Swiftness',  61,0,115,0),
  (31512,'Faceted Pale Sapphire',                  61,0,75,0),(31513,'Polished Pale Sapphire',                  61,0,90,0),(31514,'Reinforced Sapphire of Insight',   61,0,115,0),
  (31515,'Faceted Pale Amethyst',                  61,0,75,0),(31516,'Polished Pale Amethyst',                  61,0,90,0),(31517,'Reinforced Amethyst of Intellect', 61,0,115,0),
  (31518,'Faceted Pale Opal',                      61,0,75,0),(31519,'Polished Pale Opal',                      61,0,90,0),(31520,'Reinforced Opal of Charm',          61,0,115,0),
  (31521,'Faceted Pale Jade',                      61,0,75,0),(31522,'Polished Pale Jade',                      61,0,90,0),(31523,'Reinforced Jade of Warding',        61,0,115,0),
  (31524,'Faceted Pale Citrine',                   61,0,75,0),(31525,'Polished Pale Citrine',                   61,0,90,0),(31526,'Reinforced Citrine of Shielding',   61,0,115,0),
  (31527,'Faceted Pale Moonstone',                 61,0,75,0),(31528,'Polished Pale Moonstone',                 61,0,90,0),(31529,'Reinforced Moonstone of Endurance', 61,0,115,0),
  (31530,'Faceted Pale Obsidian',                  61,0,75,0),(31531,'Polished Pale Obsidian',                  61,0,90,0),(31532,'Reinforced Obsidian of Immunity',   61,0,115,0),
  (31533,'Faceted Pale Amber',                     61,0,75,0),(31534,'Polished Pale Amber',                     61,0,90,0),(31535,'Reinforced Amber of Purity',         61,0,115,0);

-- ============================================================
-- RECIPE ENTRIES (T2)
-- Facet:  2x pale chip + 1x Standard Gem Grindstone (147998) → faceted
-- Polish: 2x faceted + 1x Standard Gem Polish (147901) → polished
-- Aug:    1x polished + 1x Worked Augment Setting (147999, salvages) → aug
-- ============================================================
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31500,147985,0,0,0,0,1),(31500,148075,1,0,0,0,0),(31500,148074,0,0,2,0,0),(31500,147998,0,0,1,0,0),
  (31501,147985,0,0,0,0,1),(31501,148076,1,0,0,0,0),(31501,148075,0,0,2,0,0),(31501,147901,0,0,1,0,0),
  (31502,147985,0,0,0,0,1),(31502,148077,1,0,0,0,0),(31502,148076,0,0,1,0,0),(31502,147999,0,0,1,1,0),
  (31503,147985,0,0,0,0,1),(31503,148079,1,0,0,0,0),(31503,148078,0,0,2,0,0),(31503,147998,0,0,1,0,0),
  (31504,147985,0,0,0,0,1),(31504,148080,1,0,0,0,0),(31504,148079,0,0,2,0,0),(31504,147901,0,0,1,0,0),
  (31505,147985,0,0,0,0,1),(31505,148081,1,0,0,0,0),(31505,148080,0,0,1,0,0),(31505,147999,0,0,1,1,0),
  (31506,147985,0,0,0,0,1),(31506,148083,1,0,0,0,0),(31506,148082,0,0,2,0,0),(31506,147998,0,0,1,0,0),
  (31507,147985,0,0,0,0,1),(31507,148084,1,0,0,0,0),(31507,148083,0,0,2,0,0),(31507,147901,0,0,1,0,0),
  (31508,147985,0,0,0,0,1),(31508,148085,1,0,0,0,0),(31508,148084,0,0,1,0,0),(31508,147999,0,0,1,1,0),
  (31509,147985,0,0,0,0,1),(31509,148087,1,0,0,0,0),(31509,148086,0,0,2,0,0),(31509,147998,0,0,1,0,0),
  (31510,147985,0,0,0,0,1),(31510,148088,1,0,0,0,0),(31510,148087,0,0,2,0,0),(31510,147901,0,0,1,0,0),
  (31511,147985,0,0,0,0,1),(31511,148089,1,0,0,0,0),(31511,148088,0,0,1,0,0),(31511,147999,0,0,1,1,0),
  (31512,147985,0,0,0,0,1),(31512,148091,1,0,0,0,0),(31512,148090,0,0,2,0,0),(31512,147998,0,0,1,0,0),
  (31513,147985,0,0,0,0,1),(31513,148092,1,0,0,0,0),(31513,148091,0,0,2,0,0),(31513,147901,0,0,1,0,0),
  (31514,147985,0,0,0,0,1),(31514,148093,1,0,0,0,0),(31514,148092,0,0,1,0,0),(31514,147999,0,0,1,1,0),
  (31515,147985,0,0,0,0,1),(31515,148095,1,0,0,0,0),(31515,148094,0,0,2,0,0),(31515,147998,0,0,1,0,0),
  (31516,147985,0,0,0,0,1),(31516,148096,1,0,0,0,0),(31516,148095,0,0,2,0,0),(31516,147901,0,0,1,0,0),
  (31517,147985,0,0,0,0,1),(31517,148097,1,0,0,0,0),(31517,148096,0,0,1,0,0),(31517,147999,0,0,1,1,0),
  (31518,147985,0,0,0,0,1),(31518,148099,1,0,0,0,0),(31518,148098,0,0,2,0,0),(31518,147998,0,0,1,0,0),
  (31519,147985,0,0,0,0,1),(31519,148100,1,0,0,0,0),(31519,148099,0,0,2,0,0),(31519,147901,0,0,1,0,0),
  (31520,147985,0,0,0,0,1),(31520,148101,1,0,0,0,0),(31520,148100,0,0,1,0,0),(31520,147999,0,0,1,1,0),
  (31521,147985,0,0,0,0,1),(31521,148103,1,0,0,0,0),(31521,148102,0,0,2,0,0),(31521,147998,0,0,1,0,0),
  (31522,147985,0,0,0,0,1),(31522,148104,1,0,0,0,0),(31522,148103,0,0,2,0,0),(31522,147901,0,0,1,0,0),
  (31523,147985,0,0,0,0,1),(31523,148105,1,0,0,0,0),(31523,148104,0,0,1,0,0),(31523,147999,0,0,1,1,0),
  (31524,147985,0,0,0,0,1),(31524,148107,1,0,0,0,0),(31524,148106,0,0,2,0,0),(31524,147998,0,0,1,0,0),
  (31525,147985,0,0,0,0,1),(31525,148108,1,0,0,0,0),(31525,148107,0,0,2,0,0),(31525,147901,0,0,1,0,0),
  (31526,147985,0,0,0,0,1),(31526,148109,1,0,0,0,0),(31526,148108,0,0,1,0,0),(31526,147999,0,0,1,1,0),
  (31527,147985,0,0,0,0,1),(31527,148111,1,0,0,0,0),(31527,148110,0,0,2,0,0),(31527,147998,0,0,1,0,0),
  (31528,147985,0,0,0,0,1),(31528,148112,1,0,0,0,0),(31528,148111,0,0,2,0,0),(31528,147901,0,0,1,0,0),
  (31529,147985,0,0,0,0,1),(31529,148113,1,0,0,0,0),(31529,148112,0,0,1,0,0),(31529,147999,0,0,1,1,0),
  (31530,147985,0,0,0,0,1),(31530,148115,1,0,0,0,0),(31530,148114,0,0,2,0,0),(31530,147998,0,0,1,0,0),
  (31531,147985,0,0,0,0,1),(31531,148116,1,0,0,0,0),(31531,148115,0,0,2,0,0),(31531,147901,0,0,1,0,0),
  (31532,147985,0,0,0,0,1),(31532,148117,1,0,0,0,0),(31532,148116,0,0,1,0,0),(31532,147999,0,0,1,1,0),
  (31533,147985,0,0,0,0,1),(31533,148119,1,0,0,0,0),(31533,148118,0,0,2,0,0),(31533,147998,0,0,1,0,0),
  (31534,147985,0,0,0,0,1),(31534,148120,1,0,0,0,0),(31534,148119,0,0,2,0,0),(31534,147901,0,0,1,0,0),
  (31535,147985,0,0,0,0,1),(31535,148121,1,0,0,0,0),(31535,148120,0,0,1,0,0),(31535,147999,0,0,1,1,0);
