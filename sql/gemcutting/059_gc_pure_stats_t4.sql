-- Gem Cutting: Tier 4 Pure Stat & Resist Augments
-- Item IDs 148170–148217 | Recipes 31572–31607
-- Trivials: Facet=145, Polish=160, Aug=185 | Stat value: +8
-- Shared polish: Prime Gem Polish (147959) | Grindstone: 148018 | Setting: 148019

-- ============================================================
-- RAW DROPS (T4) — "Brilliant [Gem] Core"
-- ============================================================
INSERT IGNORE INTO items
  (id, Name, lore, nodrop, norent, stackable, stacksize,
   weight, size, itemtype, icon, idfile, material,
   price, sellrate, tradeskills, classes, races, slots, reqlevel, reclevel)
VALUES
  (148170,'Brilliant Ruby Core',      'A gem core blazing with red power from the Wall of Slaughter.',        0,0,1,20,1,1,17,964,'',0,0,0,1,65535,65535,0,0,0),
  (148174,'Brilliant Jasper Core',    'A gem core blazing with brown intensity from the Wall of Slaughter.',   0,0,1,20,1,1,17,960,'',0,0,0,1,65535,65535,0,0,0),
  (148178,'Brilliant Topaz Core',     'A gem core blazing with golden focus from the Wall of Slaughter.',      0,0,1,20,1,1,17,965,'',0,0,0,1,65535,65535,0,0,0),
  (148182,'Brilliant Peridot Core',   'A gem core blazing with green speed from the Wall of Slaughter.',       0,0,1,20,1,1,17,958,'',0,0,0,1,65535,65535,0,0,0),
  (148186,'Brilliant Sapphire Core',  'A gem core blazing with blue wisdom from the Wall of Slaughter.',       0,0,1,20,1,1,17,963,'',0,0,0,1,65535,65535,0,0,0),
  (148190,'Brilliant Amethyst Core',  'A gem core blazing with purple intellect from the Wall of Slaughter.',  0,0,1,20,1,1,17,962,'',0,0,0,1,65535,65535,0,0,0),
  (148194,'Brilliant Opal Core',      'A gem core blazing with iridescent charm from the Wall of Slaughter.',  0,0,1,20,1,1,17,959,'',0,0,0,1,65535,65535,0,0,0),
  (148198,'Brilliant Jade Core',      'A stone core blazing with warding power from the Wall of Slaughter.',   0,0,1,20,1,1,17,968,'',0,0,0,1,65535,65535,0,0,0),
  (148202,'Brilliant Citrine Core',   'A gem core blazing with orange shielding from the Wall of Slaughter.',  0,0,1,20,1,1,17,967,'',0,0,0,1,65535,65535,0,0,0),
  (148206,'Brilliant Moonstone Core', 'A gem core blazing with pale cold from the Wall of Slaughter.',         0,0,1,20,1,1,17,966,'',0,0,0,1,65535,65535,0,0,0),
  (148210,'Brilliant Obsidian Core',  'A stone core blazing with dark immunity from the Wall of Slaughter.',   0,0,1,20,1,1,17,1138,'',0,0,0,1,65535,65535,0,0,0),
  (148214,'Brilliant Amber Core',     'A gem core blazing with golden purity from the Wall of Slaughter.',     0,0,1,20,1,1,17,953,'',0,0,0,1,65535,65535,0,0,0);

-- ============================================================
-- FACETED INTERMEDIATES (T4)
-- ============================================================
INSERT IGNORE INTO items
  (id, Name, lore, nodrop, norent, stackable, stacksize,
   weight, size, itemtype, icon, idfile, material,
   price, sellrate, tradeskills, classes, races, slots, reqlevel, reclevel)
VALUES
  (148171,'Faceted Brilliant Ruby',      'A brilliantly faceted ruby with a captivating inner fire.',     0,0,1,20,1,1,17,964,'',0,0,0,0,65535,65535,0,0,0),
  (148175,'Faceted Brilliant Jasper',    'A brilliantly faceted jasper with a captivating inner warmth.', 0,0,1,20,1,1,17,960,'',0,0,0,0,65535,65535,0,0,0),
  (148179,'Faceted Brilliant Topaz',     'A brilliantly faceted topaz with a captivating golden gleam.',  0,0,1,20,1,1,17,965,'',0,0,0,0,65535,65535,0,0,0),
  (148183,'Faceted Brilliant Peridot',   'A brilliantly faceted peridot with a captivating green light.', 0,0,1,20,1,1,17,958,'',0,0,0,0,65535,65535,0,0,0),
  (148187,'Faceted Brilliant Sapphire',  'A brilliantly faceted sapphire with a captivating blue depth.', 0,0,1,20,1,1,17,963,'',0,0,0,0,65535,65535,0,0,0),
  (148191,'Faceted Brilliant Amethyst',  'A brilliantly faceted amethyst with a captivating purple hue.', 0,0,1,20,1,1,17,962,'',0,0,0,0,65535,65535,0,0,0),
  (148195,'Faceted Brilliant Opal',      'A brilliantly faceted opal with a captivating shimmer.',        0,0,1,20,1,1,17,959,'',0,0,0,0,65535,65535,0,0,0),
  (148199,'Faceted Brilliant Jade',      'A brilliantly faceted jade stone.',                              0,0,1,20,1,1,17,968,'',0,0,0,0,65535,65535,0,0,0),
  (148203,'Faceted Brilliant Citrine',   'A brilliantly faceted citrine with a captivating orange gleam.',0,0,1,20,1,1,17,967,'',0,0,0,0,65535,65535,0,0,0),
  (148207,'Faceted Brilliant Moonstone', 'A brilliantly faceted moonstone radiating pale power.',          0,0,1,20,1,1,17,966,'',0,0,0,0,65535,65535,0,0,0),
  (148211,'Faceted Brilliant Obsidian',  'A brilliantly faceted shard of obsidian.',                       0,0,1,20,1,1,17,1138,'',0,0,0,0,65535,65535,0,0,0),
  (148215,'Faceted Brilliant Amber',     'A brilliantly faceted piece of amber.',                          0,0,1,20,1,1,17,953,'',0,0,0,0,65535,65535,0,0,0);

-- ============================================================
-- POLISHED INTERMEDIATES (T4)
-- ============================================================
INSERT IGNORE INTO items
  (id, Name, lore, nodrop, norent, stackable, stacksize,
   weight, size, itemtype, icon, idfile, material,
   price, sellrate, tradeskills, classes, races, slots, reqlevel, reclevel)
VALUES
  (148172,'Polished Brilliant Ruby',      'A flawlessly polished ruby radiating intense strength.',       0,0,1,20,1,1,17,964,'',0,0,0,0,65535,65535,0,0,0),
  (148176,'Polished Brilliant Jasper',    'A flawlessly polished jasper radiating intense endurance.',    0,0,1,20,1,1,17,960,'',0,0,0,0,65535,65535,0,0,0),
  (148180,'Polished Brilliant Topaz',     'A flawlessly polished topaz radiating intense precision.',     0,0,1,20,1,1,17,965,'',0,0,0,0,65535,65535,0,0,0),
  (148184,'Polished Brilliant Peridot',   'A flawlessly polished peridot radiating intense speed.',       0,0,1,20,1,1,17,958,'',0,0,0,0,65535,65535,0,0,0),
  (148188,'Polished Brilliant Sapphire',  'A flawlessly polished sapphire radiating intense insight.',    0,0,1,20,1,1,17,963,'',0,0,0,0,65535,65535,0,0,0),
  (148192,'Polished Brilliant Amethyst',  'A flawlessly polished amethyst radiating intense intellect.',  0,0,1,20,1,1,17,962,'',0,0,0,0,65535,65535,0,0,0),
  (148196,'Polished Brilliant Opal',      'A flawlessly polished opal radiating intense charm.',          0,0,1,20,1,1,17,959,'',0,0,0,0,65535,65535,0,0,0),
  (148200,'Polished Brilliant Jade',      'A flawlessly polished jade radiating intense warding.',        0,0,1,20,1,1,17,968,'',0,0,0,0,65535,65535,0,0,0),
  (148204,'Polished Brilliant Citrine',   'A flawlessly polished citrine radiating intense shielding.',   0,0,1,20,1,1,17,967,'',0,0,0,0,65535,65535,0,0,0),
  (148208,'Polished Brilliant Moonstone', 'A flawlessly polished moonstone radiating intense cold.',      0,0,1,20,1,1,17,966,'',0,0,0,0,65535,65535,0,0,0),
  (148212,'Polished Brilliant Obsidian',  'A flawlessly polished obsidian radiating intense immunity.',   0,0,1,20,1,1,17,1138,'',0,0,0,0,65535,65535,0,0,0),
  (148216,'Polished Brilliant Amber',     'A flawlessly polished amber radiating intense purity.',        0,0,1,20,1,1,17,953,'',0,0,0,0,65535,65535,0,0,0);

-- ============================================================
-- FINISHED AUGMENTS (T4) — +8 to single stat or resist
-- ============================================================
INSERT IGNORE INTO items
  (id, Name, lore, nodrop, norent, stackable,
   weight, size, itemtype, magic,
   astr,asta,adex,aagi,awis,aint,acha,hp,mana,MR,FR,CR,PR,DR,
   augtype, augrestrict, augdistiller,
   icon, idfile, material, sellrate, tradeskills,
   classes, races, slots, reqlevel, reclevel)
VALUES
  (148173,'Ascendant Ruby of Might',         'A flawless ruby augment granting a powerful bonus to strength.',        0,0,0,0,0,54,1, 8,0,0,0,0,0,0,0,0,0,0,0,0,0, 512,0,0,964,'',0,0,0,65535,65535,2097150,0,0),
  (148177,'Ascendant Jasper of Fortitude',   'A flawless jasper augment granting a powerful bonus to stamina.',       0,0,0,0,0,54,1, 0,8,0,0,0,0,0,0,0,0,0,0,0,0, 512,0,0,960,'',0,0,0,65535,65535,2097150,0,0),
  (148181,'Ascendant Topaz of Precision',    'A flawless topaz augment granting a powerful bonus to dexterity.',      0,0,0,0,0,54,1, 0,0,8,0,0,0,0,0,0,0,0,0,0,0, 512,0,0,965,'',0,0,0,65535,65535,2097150,0,0),
  (148185,'Ascendant Peridot of Swiftness',  'A flawless peridot augment granting a powerful bonus to agility.',      0,0,0,0,0,54,1, 0,0,0,8,0,0,0,0,0,0,0,0,0,0, 512,0,0,958,'',0,0,0,65535,65535,2097150,0,0),
  (148189,'Ascendant Sapphire of Insight',   'A flawless sapphire augment granting a powerful bonus to wisdom.',      0,0,0,0,0,54,1, 0,0,0,0,8,0,0,0,0,0,0,0,0,0, 512,0,0,963,'',0,0,0,65535,65535,2097150,0,0),
  (148193,'Ascendant Amethyst of Intellect', 'A flawless amethyst augment granting a powerful bonus to intelligence.',0,0,0,0,0,54,1, 0,0,0,0,0,8,0,0,0,0,0,0,0,0, 512,0,0,962,'',0,0,0,65535,65535,2097150,0,0),
  (148197,'Ascendant Opal of Charm',         'A flawless opal augment granting a powerful bonus to charisma.',        0,0,0,0,0,54,1, 0,0,0,0,0,0,8,0,0,0,0,0,0,0, 512,0,0,959,'',0,0,0,65535,65535,2097150,0,0),
  (148201,'Ascendant Jade of Warding',       'A flawless jade augment granting powerful magic resistance.',           0,0,0,0,0,54,1, 0,0,0,0,0,0,0,0,0,8,0,0,0,0, 512,0,0,968,'',0,0,0,65535,65535,2097150,0,0),
  (148205,'Ascendant Citrine of Shielding',  'A flawless citrine augment granting powerful fire resistance.',          0,0,0,0,0,54,1, 0,0,0,0,0,0,0,0,0,0,8,0,0,0, 512,0,0,967,'',0,0,0,65535,65535,2097150,0,0),
  (148209,'Ascendant Moonstone of Endurance','A flawless moonstone augment granting powerful cold resistance.',        0,0,0,0,0,54,1, 0,0,0,0,0,0,0,0,0,0,0,8,0,0, 512,0,0,966,'',0,0,0,65535,65535,2097150,0,0),
  (148213,'Ascendant Obsidian of Immunity',  'A flawless obsidian augment granting powerful poison resistance.',       0,0,0,0,0,54,1, 0,0,0,0,0,0,0,0,0,0,0,0,8,0, 512,0,0,1138,'',0,0,0,65535,65535,2097150,0,0),
  (148217,'Ascendant Amber of Purity',       'A flawless amber augment granting powerful disease resistance.',         0,0,0,0,0,54,1, 0,0,0,0,0,0,0,0,0,0,0,0,0,8, 512,0,0,953,'',0,0,0,65535,65535,2097150,0,0);

-- ============================================================
-- RECIPES (T4) — Facet=145, Polish=160, Aug=185
-- ============================================================
INSERT IGNORE INTO tradeskill_recipe (id, name, tradeskill, skillneeded, trivial, nofail) VALUES
  (31572,'Faceted Brilliant Ruby',                      61,0,145,0),(31573,'Polished Brilliant Ruby',                      61,0,160,0),(31574,'Ascendant Ruby of Might',          61,0,185,0),
  (31575,'Faceted Brilliant Jasper',                    61,0,145,0),(31576,'Polished Brilliant Jasper',                    61,0,160,0),(31577,'Ascendant Jasper of Fortitude',    61,0,185,0),
  (31578,'Faceted Brilliant Topaz',                     61,0,145,0),(31579,'Polished Brilliant Topaz',                     61,0,160,0),(31580,'Ascendant Topaz of Precision',     61,0,185,0),
  (31581,'Faceted Brilliant Peridot',                   61,0,145,0),(31582,'Polished Brilliant Peridot',                   61,0,160,0),(31583,'Ascendant Peridot of Swiftness',   61,0,185,0),
  (31584,'Faceted Brilliant Sapphire',                  61,0,145,0),(31585,'Polished Brilliant Sapphire',                  61,0,160,0),(31586,'Ascendant Sapphire of Insight',    61,0,185,0),
  (31587,'Faceted Brilliant Amethyst',                  61,0,145,0),(31588,'Polished Brilliant Amethyst',                  61,0,160,0),(31589,'Ascendant Amethyst of Intellect',  61,0,185,0),
  (31590,'Faceted Brilliant Opal',                      61,0,145,0),(31591,'Polished Brilliant Opal',                      61,0,160,0),(31592,'Ascendant Opal of Charm',           61,0,185,0),
  (31593,'Faceted Brilliant Jade',                      61,0,145,0),(31594,'Polished Brilliant Jade',                      61,0,160,0),(31595,'Ascendant Jade of Warding',         61,0,185,0),
  (31596,'Faceted Brilliant Citrine',                   61,0,145,0),(31597,'Polished Brilliant Citrine',                   61,0,160,0),(31598,'Ascendant Citrine of Shielding',   61,0,185,0),
  (31599,'Faceted Brilliant Moonstone',                 61,0,145,0),(31600,'Polished Brilliant Moonstone',                 61,0,160,0),(31601,'Ascendant Moonstone of Endurance', 61,0,185,0),
  (31602,'Faceted Brilliant Obsidian',                  61,0,145,0),(31603,'Polished Brilliant Obsidian',                  61,0,160,0),(31604,'Ascendant Obsidian of Immunity',   61,0,185,0),
  (31605,'Faceted Brilliant Amber',                     61,0,145,0),(31606,'Polished Brilliant Amber',                     61,0,160,0),(31607,'Ascendant Amber of Purity',         61,0,185,0);

-- ============================================================
-- RECIPE ENTRIES (T4)
-- Facet:  2x core + 1x Master's Gem Grindstone (148018) → faceted
-- Polish: 2x faceted + 1x Prime Gem Polish (147959) → polished
-- Aug:    1x polished + 1x Masterwork Augment Setting (148019, salvages) → aug
-- ============================================================
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  (31572,147985,0,0,0,0,1),(31572,148171,1,0,0,0,0),(31572,148170,0,0,2,0,0),(31572,148018,0,0,1,0,0),
  (31573,147985,0,0,0,0,1),(31573,148172,1,0,0,0,0),(31573,148171,0,0,2,0,0),(31573,147959,0,0,1,0,0),
  (31574,147985,0,0,0,0,1),(31574,148173,1,0,0,0,0),(31574,148172,0,0,1,0,0),(31574,148019,0,0,1,1,0),
  (31575,147985,0,0,0,0,1),(31575,148175,1,0,0,0,0),(31575,148174,0,0,2,0,0),(31575,148018,0,0,1,0,0),
  (31576,147985,0,0,0,0,1),(31576,148176,1,0,0,0,0),(31576,148175,0,0,2,0,0),(31576,147959,0,0,1,0,0),
  (31577,147985,0,0,0,0,1),(31577,148177,1,0,0,0,0),(31577,148176,0,0,1,0,0),(31577,148019,0,0,1,1,0),
  (31578,147985,0,0,0,0,1),(31578,148179,1,0,0,0,0),(31578,148178,0,0,2,0,0),(31578,148018,0,0,1,0,0),
  (31579,147985,0,0,0,0,1),(31579,148180,1,0,0,0,0),(31579,148179,0,0,2,0,0),(31579,147959,0,0,1,0,0),
  (31580,147985,0,0,0,0,1),(31580,148181,1,0,0,0,0),(31580,148180,0,0,1,0,0),(31580,148019,0,0,1,1,0),
  (31581,147985,0,0,0,0,1),(31581,148183,1,0,0,0,0),(31581,148182,0,0,2,0,0),(31581,148018,0,0,1,0,0),
  (31582,147985,0,0,0,0,1),(31582,148184,1,0,0,0,0),(31582,148183,0,0,2,0,0),(31582,147959,0,0,1,0,0),
  (31583,147985,0,0,0,0,1),(31583,148185,1,0,0,0,0),(31583,148184,0,0,1,0,0),(31583,148019,0,0,1,1,0),
  (31584,147985,0,0,0,0,1),(31584,148187,1,0,0,0,0),(31584,148186,0,0,2,0,0),(31584,148018,0,0,1,0,0),
  (31585,147985,0,0,0,0,1),(31585,148188,1,0,0,0,0),(31585,148187,0,0,2,0,0),(31585,147959,0,0,1,0,0),
  (31586,147985,0,0,0,0,1),(31586,148189,1,0,0,0,0),(31586,148188,0,0,1,0,0),(31586,148019,0,0,1,1,0),
  (31587,147985,0,0,0,0,1),(31587,148191,1,0,0,0,0),(31587,148190,0,0,2,0,0),(31587,148018,0,0,1,0,0),
  (31588,147985,0,0,0,0,1),(31588,148192,1,0,0,0,0),(31588,148191,0,0,2,0,0),(31588,147959,0,0,1,0,0),
  (31589,147985,0,0,0,0,1),(31589,148193,1,0,0,0,0),(31589,148192,0,0,1,0,0),(31589,148019,0,0,1,1,0),
  (31590,147985,0,0,0,0,1),(31590,148195,1,0,0,0,0),(31590,148194,0,0,2,0,0),(31590,148018,0,0,1,0,0),
  (31591,147985,0,0,0,0,1),(31591,148196,1,0,0,0,0),(31591,148195,0,0,2,0,0),(31591,147959,0,0,1,0,0),
  (31592,147985,0,0,0,0,1),(31592,148197,1,0,0,0,0),(31592,148196,0,0,1,0,0),(31592,148019,0,0,1,1,0),
  (31593,147985,0,0,0,0,1),(31593,148199,1,0,0,0,0),(31593,148198,0,0,2,0,0),(31593,148018,0,0,1,0,0),
  (31594,147985,0,0,0,0,1),(31594,148200,1,0,0,0,0),(31594,148199,0,0,2,0,0),(31594,147959,0,0,1,0,0),
  (31595,147985,0,0,0,0,1),(31595,148201,1,0,0,0,0),(31595,148200,0,0,1,0,0),(31595,148019,0,0,1,1,0),
  (31596,147985,0,0,0,0,1),(31596,148203,1,0,0,0,0),(31596,148202,0,0,2,0,0),(31596,148018,0,0,1,0,0),
  (31597,147985,0,0,0,0,1),(31597,148204,1,0,0,0,0),(31597,148203,0,0,2,0,0),(31597,147959,0,0,1,0,0),
  (31598,147985,0,0,0,0,1),(31598,148205,1,0,0,0,0),(31598,148204,0,0,1,0,0),(31598,148019,0,0,1,1,0),
  (31599,147985,0,0,0,0,1),(31599,148207,1,0,0,0,0),(31599,148206,0,0,2,0,0),(31599,148018,0,0,1,0,0),
  (31600,147985,0,0,0,0,1),(31600,148208,1,0,0,0,0),(31600,148207,0,0,2,0,0),(31600,147959,0,0,1,0,0),
  (31601,147985,0,0,0,0,1),(31601,148209,1,0,0,0,0),(31601,148208,0,0,1,0,0),(31601,148019,0,0,1,1,0),
  (31602,147985,0,0,0,0,1),(31602,148211,1,0,0,0,0),(31602,148210,0,0,2,0,0),(31602,148018,0,0,1,0,0),
  (31603,147985,0,0,0,0,1),(31603,148212,1,0,0,0,0),(31603,148211,0,0,2,0,0),(31603,147959,0,0,1,0,0),
  (31604,147985,0,0,0,0,1),(31604,148213,1,0,0,0,0),(31604,148212,0,0,1,0,0),(31604,148019,0,0,1,1,0),
  (31605,147985,0,0,0,0,1),(31605,148215,1,0,0,0,0),(31605,148214,0,0,2,0,0),(31605,148018,0,0,1,0,0),
  (31606,147985,0,0,0,0,1),(31606,148216,1,0,0,0,0),(31606,148215,0,0,2,0,0),(31606,147959,0,0,1,0,0),
  (31607,147985,0,0,0,0,1),(31607,148217,1,0,0,0,0),(31607,148216,0,0,1,0,0),(31607,148019,0,0,1,1,0);
