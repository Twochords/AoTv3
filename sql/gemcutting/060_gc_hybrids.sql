-- Gem Cutting: Hybrid Augments — T2, T3, T4
-- No raw drops or intermediates — hybrids combine two polished pure gems of the same tier
-- Recipe: 1x Polished [GemA] + 1x Polished [GemB] + Setting (salvages) → Hybrid Augment
--
-- Item IDs: T2=148218–148225, T3=148226–148233, T4=148234–148241
-- Recipe IDs: T2=31608–31615, T3=31616–31623, T4=31624–31631
-- Trivials: T2=120, T3=160, T4=190
--
-- Hybrid families:
--   Bloodstone    (STR+DEX) = Polished [Pale/Deep/Brilliant] Ruby    + Polished [Pale/Deep/Brilliant] Topaz
--   Carnelian     (STR+STA) = Polished [Pale/Deep/Brilliant] Ruby    + Polished [Pale/Deep/Brilliant] Jasper
--   Tiger's Eye   (DEX+AGI) = Polished [Pale/Deep/Brilliant] Topaz   + Polished [Pale/Deep/Brilliant] Peridot
--   Lapis         (INT+WIS) = Polished [Pale/Deep/Brilliant] Amethyst + Polished [Pale/Deep/Brilliant] Sapphire
--   Sunstone      (WIS+CHA) = Polished [Pale/Deep/Brilliant] Sapphire + Polished [Pale/Deep/Brilliant] Opal
--   Hawk's Eye    (AGI+STA) = Polished [Pale/Deep/Brilliant] Peridot  + Polished [Pale/Deep/Brilliant] Jasper
--   Banded Agate  (FR+CR)   = Polished [Pale/Deep/Brilliant] Citrine  + Polished [Pale/Deep/Brilliant] Moonstone
--   Malachite     (DR+PR)   = Polished [Pale/Deep/Brilliant] Amber    + Polished [Pale/Deep/Brilliant] Obsidian
--
-- Stat values: T2=+1/+1, T3=+2/+2, T4=+4/+4

-- ============================================================
-- T2 HYBRID AUGMENTS (+1/+1)
-- T2 polished IDs: Ruby=148076, Jasper=148080, Topaz=148084, Peridot=148088,
--                  Sapphire=148092, Amethyst=148096, Opal=148100,
--                  Citrine=148108, Moonstone=148112, Obsidian=148116, Amber=148120
-- Setting: Worked Augment Setting (147999)
-- ============================================================
INSERT IGNORE INTO items
  (id, Name, lore, nodrop, norent, stackable,
   weight, size, itemtype, magic,
   astr,asta,adex,aagi,awis,aint,acha,hp,mana,MR,FR,CR,PR,DR,
   augtype, augrestrict, augdistiller,
   icon, idfile, material, sellrate, tradeskills,
   classes, races, slots, reqlevel, reclevel)
VALUES
  (148218,'Reinforced Bloodstone of Combat',    'A bloodstone augment granting bonuses to strength and dexterity.',  0,0,0,0,0,54,1, 1,0,1,0,0,0,0,0,0,0,0,0,0,0, 512,0,0,964,'',0,0,0,65535,65535,2097150,0,0),
  (148219,'Reinforced Carnelian of War',        'A carnelian augment granting bonuses to strength and stamina.',     0,0,0,0,0,54,1, 1,1,0,0,0,0,0,0,0,0,0,0,0,0, 512,0,0,960,'',0,0,0,65535,65535,2097150,0,0),
  (148220,'Reinforced Tiger''s Eye of the Hunt','A tiger''s eye augment granting bonuses to dexterity and agility.', 0,0,0,0,0,54,1, 0,0,1,1,0,0,0,0,0,0,0,0,0,0, 512,0,0,965,'',0,0,0,65535,65535,2097150,0,0),
  (148221,'Reinforced Lapis of Lore',           'A lapis augment granting bonuses to intelligence and wisdom.',      0,0,0,0,0,54,1, 0,0,0,0,1,1,0,0,0,0,0,0,0,0, 512,0,0,962,'',0,0,0,65535,65535,2097150,0,0),
  (148222,'Reinforced Sunstone of the Divine',  'A sunstone augment granting bonuses to wisdom and charisma.',       0,0,0,0,0,54,1, 0,0,0,0,1,0,1,0,0,0,0,0,0,0, 512,0,0,963,'',0,0,0,65535,65535,2097150,0,0),
  (148223,'Reinforced Hawk''s Eye of the Guardian','A hawk''s eye augment granting bonuses to agility and stamina.', 0,0,0,0,0,54,1, 0,1,0,1,0,0,0,0,0,0,0,0,0,0, 512,0,0,958,'',0,0,0,65535,65535,2097150,0,0),
  (148224,'Reinforced Banded Agate of Elements','A banded agate augment granting fire and cold resistance.',         0,0,0,0,0,54,1, 0,0,0,0,0,0,0,0,0,0,1,1,0,0, 512,0,0,967,'',0,0,0,65535,65535,2097150,0,0),
  (148225,'Reinforced Malachite of Nature',     'A malachite augment granting disease and poison resistance.',       0,0,0,0,0,54,1, 0,0,0,0,0,0,0,0,0,0,0,0,1,1, 512,0,0,968,'',0,0,0,65535,65535,2097150,0,0);

-- ============================================================
-- T3 HYBRID AUGMENTS (+2/+2)
-- T3 polished IDs: Ruby=148124, Jasper=148128, Topaz=148132, Peridot=148136,
--                  Sapphire=148140, Amethyst=148144, Opal=148148,
--                  Citrine=148156, Moonstone=148160, Obsidian=148164, Amber=148168
-- Setting: Refined Augment Setting (148009)
-- ============================================================
INSERT IGNORE INTO items
  (id, Name, lore, nodrop, norent, stackable,
   weight, size, itemtype, magic,
   astr,asta,adex,aagi,awis,aint,acha,hp,mana,MR,FR,CR,PR,DR,
   augtype, augrestrict, augdistiller,
   icon, idfile, material, sellrate, tradeskills,
   classes, races, slots, reqlevel, reclevel)
VALUES
  (148226,'Tempered Bloodstone of Combat',    'A bloodstone augment granting strong bonuses to strength and dexterity.', 0,0,0,0,0,54,1, 2,0,2,0,0,0,0,0,0,0,0,0,0,0, 512,0,0,964,'',0,0,0,65535,65535,2097150,0,0),
  (148227,'Tempered Carnelian of War',        'A carnelian augment granting strong bonuses to strength and stamina.',    0,0,0,0,0,54,1, 2,2,0,0,0,0,0,0,0,0,0,0,0,0, 512,0,0,960,'',0,0,0,65535,65535,2097150,0,0),
  (148228,'Tempered Tiger''s Eye of the Hunt','A tiger''s eye augment granting strong bonuses to dexterity and agility.',0,0,0,0,0,54,1, 0,0,2,2,0,0,0,0,0,0,0,0,0,0, 512,0,0,965,'',0,0,0,65535,65535,2097150,0,0),
  (148229,'Tempered Lapis of Lore',           'A lapis augment granting strong bonuses to intelligence and wisdom.',     0,0,0,0,0,54,1, 0,0,0,0,2,2,0,0,0,0,0,0,0,0, 512,0,0,962,'',0,0,0,65535,65535,2097150,0,0),
  (148230,'Tempered Sunstone of the Divine',  'A sunstone augment granting strong bonuses to wisdom and charisma.',      0,0,0,0,0,54,1, 0,0,0,0,2,0,2,0,0,0,0,0,0,0, 512,0,0,963,'',0,0,0,65535,65535,2097150,0,0),
  (148231,'Tempered Hawk''s Eye of the Guardian','A hawk''s eye augment granting strong bonuses to agility and stamina.',0,0,0,0,0,54,1, 0,2,0,2,0,0,0,0,0,0,0,0,0,0, 512,0,0,958,'',0,0,0,65535,65535,2097150,0,0),
  (148232,'Tempered Banded Agate of Elements','A banded agate augment granting strong fire and cold resistance.',        0,0,0,0,0,54,1, 0,0,0,0,0,0,0,0,0,0,2,2,0,0, 512,0,0,967,'',0,0,0,65535,65535,2097150,0,0),
  (148233,'Tempered Malachite of Nature',     'A malachite augment granting strong disease and poison resistance.',      0,0,0,0,0,54,1, 0,0,0,0,0,0,0,0,0,0,0,0,2,2, 512,0,0,968,'',0,0,0,65535,65535,2097150,0,0);

-- ============================================================
-- T4 HYBRID AUGMENTS (+4/+4)
-- T4 polished IDs: Ruby=148172, Jasper=148176, Topaz=148180, Peridot=148184,
--                  Sapphire=148188, Amethyst=148192, Opal=148196,
--                  Citrine=148204, Moonstone=148208, Obsidian=148212, Amber=148216
-- Setting: Masterwork Augment Setting (148019)
-- ============================================================
INSERT IGNORE INTO items
  (id, Name, lore, nodrop, norent, stackable,
   weight, size, itemtype, magic,
   astr,asta,adex,aagi,awis,aint,acha,hp,mana,MR,FR,CR,PR,DR,
   augtype, augrestrict, augdistiller,
   icon, idfile, material, sellrate, tradeskills,
   classes, races, slots, reqlevel, reclevel)
VALUES
  (148234,'Ascendant Bloodstone of Combat',    'A bloodstone augment granting powerful bonuses to strength and dexterity.', 0,0,0,0,0,54,1, 4,0,4,0,0,0,0,0,0,0,0,0,0,0, 512,0,0,964,'',0,0,0,65535,65535,2097150,0,0),
  (148235,'Ascendant Carnelian of War',        'A carnelian augment granting powerful bonuses to strength and stamina.',    0,0,0,0,0,54,1, 4,4,0,0,0,0,0,0,0,0,0,0,0,0, 512,0,0,960,'',0,0,0,65535,65535,2097150,0,0),
  (148236,'Ascendant Tiger''s Eye of the Hunt','A tiger''s eye augment granting powerful bonuses to dexterity and agility.',0,0,0,0,0,54,1, 0,0,4,4,0,0,0,0,0,0,0,0,0,0, 512,0,0,965,'',0,0,0,65535,65535,2097150,0,0),
  (148237,'Ascendant Lapis of Lore',           'A lapis augment granting powerful bonuses to intelligence and wisdom.',     0,0,0,0,0,54,1, 0,0,0,0,4,4,0,0,0,0,0,0,0,0, 512,0,0,962,'',0,0,0,65535,65535,2097150,0,0),
  (148238,'Ascendant Sunstone of the Divine',  'A sunstone augment granting powerful bonuses to wisdom and charisma.',      0,0,0,0,0,54,1, 0,0,0,0,4,0,4,0,0,0,0,0,0,0, 512,0,0,963,'',0,0,0,65535,65535,2097150,0,0),
  (148239,'Ascendant Hawk''s Eye of the Guardian','A hawk''s eye augment granting powerful bonuses to agility and stamina.',0,0,0,0,0,54,1, 0,4,0,4,0,0,0,0,0,0,0,0,0,0, 512,0,0,958,'',0,0,0,65535,65535,2097150,0,0),
  (148240,'Ascendant Banded Agate of Elements','A banded agate augment granting powerful fire and cold resistance.',        0,0,0,0,0,54,1, 0,0,0,0,0,0,0,0,0,0,4,4,0,0, 512,0,0,967,'',0,0,0,65535,65535,2097150,0,0),
  (148241,'Ascendant Malachite of Nature',     'A malachite augment granting powerful disease and poison resistance.',      0,0,0,0,0,54,1, 0,0,0,0,0,0,0,0,0,0,0,0,4,4, 512,0,0,968,'',0,0,0,65535,65535,2097150,0,0);

-- ============================================================
-- RECIPES (T2 hybrids trivial=120, T3=160, T4=190)
-- ============================================================
INSERT IGNORE INTO tradeskill_recipe (id, name, tradeskill, skillneeded, trivial, nofail) VALUES
  (31608,'Reinforced Bloodstone of Combat',         61,0,120,0),
  (31609,'Reinforced Carnelian of War',             61,0,120,0),
  (31610,'Reinforced Tiger''s Eye of the Hunt',     61,0,120,0),
  (31611,'Reinforced Lapis of Lore',                61,0,120,0),
  (31612,'Reinforced Sunstone of the Divine',       61,0,120,0),
  (31613,'Reinforced Hawk''s Eye of the Guardian',  61,0,120,0),
  (31614,'Reinforced Banded Agate of Elements',     61,0,120,0),
  (31615,'Reinforced Malachite of Nature',          61,0,120,0),
  (31616,'Tempered Bloodstone of Combat',           61,0,160,0),
  (31617,'Tempered Carnelian of War',               61,0,160,0),
  (31618,'Tempered Tiger''s Eye of the Hunt',       61,0,160,0),
  (31619,'Tempered Lapis of Lore',                  61,0,160,0),
  (31620,'Tempered Sunstone of the Divine',         61,0,160,0),
  (31621,'Tempered Hawk''s Eye of the Guardian',    61,0,160,0),
  (31622,'Tempered Banded Agate of Elements',       61,0,160,0),
  (31623,'Tempered Malachite of Nature',            61,0,160,0),
  (31624,'Ascendant Bloodstone of Combat',          61,0,190,0),
  (31625,'Ascendant Carnelian of War',              61,0,190,0),
  (31626,'Ascendant Tiger''s Eye of the Hunt',      61,0,190,0),
  (31627,'Ascendant Lapis of Lore',                 61,0,190,0),
  (31628,'Ascendant Sunstone of the Divine',        61,0,190,0),
  (31629,'Ascendant Hawk''s Eye of the Guardian',   61,0,190,0),
  (31630,'Ascendant Banded Agate of Elements',      61,0,190,0),
  (31631,'Ascendant Malachite of Nature',           61,0,190,0);

-- ============================================================
-- RECIPE ENTRIES — all hybrids: 1x PolishedA + 1x PolishedB + Setting (salvages)
-- ============================================================
INSERT IGNORE INTO tradeskill_recipe_entries
  (recipe_id,item_id,successcount,failcount,componentcount,salvagecount,iscontainer) VALUES
  -- T2 Bloodstone (STR+DEX): Polished Pale Ruby (148076) + Polished Pale Topaz (148084) + Worked Setting (147999)
  (31608,147985,0,0,0,0,1),(31608,148218,1,0,0,0,0),(31608,148076,0,0,1,0,0),(31608,148084,0,0,1,0,0),(31608,147999,0,0,1,1,0),
  -- T2 Carnelian (STR+STA): Polished Pale Ruby (148076) + Polished Pale Jasper (148080)
  (31609,147985,0,0,0,0,1),(31609,148219,1,0,0,0,0),(31609,148076,0,0,1,0,0),(31609,148080,0,0,1,0,0),(31609,147999,0,0,1,1,0),
  -- T2 Tiger's Eye (DEX+AGI): Polished Pale Topaz (148084) + Polished Pale Peridot (148088)
  (31610,147985,0,0,0,0,1),(31610,148220,1,0,0,0,0),(31610,148084,0,0,1,0,0),(31610,148088,0,0,1,0,0),(31610,147999,0,0,1,1,0),
  -- T2 Lapis (INT+WIS): Polished Pale Amethyst (148096) + Polished Pale Sapphire (148092)
  (31611,147985,0,0,0,0,1),(31611,148221,1,0,0,0,0),(31611,148096,0,0,1,0,0),(31611,148092,0,0,1,0,0),(31611,147999,0,0,1,1,0),
  -- T2 Sunstone (WIS+CHA): Polished Pale Sapphire (148092) + Polished Pale Opal (148100)
  (31612,147985,0,0,0,0,1),(31612,148222,1,0,0,0,0),(31612,148092,0,0,1,0,0),(31612,148100,0,0,1,0,0),(31612,147999,0,0,1,1,0),
  -- T2 Hawk's Eye (AGI+STA): Polished Pale Peridot (148088) + Polished Pale Jasper (148080)
  (31613,147985,0,0,0,0,1),(31613,148223,1,0,0,0,0),(31613,148088,0,0,1,0,0),(31613,148080,0,0,1,0,0),(31613,147999,0,0,1,1,0),
  -- T2 Banded Agate (FR+CR): Polished Pale Citrine (148108) + Polished Pale Moonstone (148112)
  (31614,147985,0,0,0,0,1),(31614,148224,1,0,0,0,0),(31614,148108,0,0,1,0,0),(31614,148112,0,0,1,0,0),(31614,147999,0,0,1,1,0),
  -- T2 Malachite (DR+PR): Polished Pale Amber (148120) + Polished Pale Obsidian (148116)
  (31615,147985,0,0,0,0,1),(31615,148225,1,0,0,0,0),(31615,148120,0,0,1,0,0),(31615,148116,0,0,1,0,0),(31615,147999,0,0,1,1,0),

  -- T3 Bloodstone: Polished Deep Ruby (148124) + Polished Deep Topaz (148132) + Refined Setting (148009)
  (31616,147985,0,0,0,0,1),(31616,148226,1,0,0,0,0),(31616,148124,0,0,1,0,0),(31616,148132,0,0,1,0,0),(31616,148009,0,0,1,1,0),
  -- T3 Carnelian: Polished Deep Ruby (148124) + Polished Deep Jasper (148128)
  (31617,147985,0,0,0,0,1),(31617,148227,1,0,0,0,0),(31617,148124,0,0,1,0,0),(31617,148128,0,0,1,0,0),(31617,148009,0,0,1,1,0),
  -- T3 Tiger's Eye: Polished Deep Topaz (148132) + Polished Deep Peridot (148136)
  (31618,147985,0,0,0,0,1),(31618,148228,1,0,0,0,0),(31618,148132,0,0,1,0,0),(31618,148136,0,0,1,0,0),(31618,148009,0,0,1,1,0),
  -- T3 Lapis: Polished Deep Amethyst (148144) + Polished Deep Sapphire (148140)
  (31619,147985,0,0,0,0,1),(31619,148229,1,0,0,0,0),(31619,148144,0,0,1,0,0),(31619,148140,0,0,1,0,0),(31619,148009,0,0,1,1,0),
  -- T3 Sunstone: Polished Deep Sapphire (148140) + Polished Deep Opal (148148)
  (31620,147985,0,0,0,0,1),(31620,148230,1,0,0,0,0),(31620,148140,0,0,1,0,0),(31620,148148,0,0,1,0,0),(31620,148009,0,0,1,1,0),
  -- T3 Hawk's Eye: Polished Deep Peridot (148136) + Polished Deep Jasper (148128)
  (31621,147985,0,0,0,0,1),(31621,148231,1,0,0,0,0),(31621,148136,0,0,1,0,0),(31621,148128,0,0,1,0,0),(31621,148009,0,0,1,1,0),
  -- T3 Banded Agate: Polished Deep Citrine (148156) + Polished Deep Moonstone (148160)
  (31622,147985,0,0,0,0,1),(31622,148232,1,0,0,0,0),(31622,148156,0,0,1,0,0),(31622,148160,0,0,1,0,0),(31622,148009,0,0,1,1,0),
  -- T3 Malachite: Polished Deep Amber (148168) + Polished Deep Obsidian (148164)
  (31623,147985,0,0,0,0,1),(31623,148233,1,0,0,0,0),(31623,148168,0,0,1,0,0),(31623,148164,0,0,1,0,0),(31623,148009,0,0,1,1,0),

  -- T4 Bloodstone: Polished Brilliant Ruby (148172) + Polished Brilliant Topaz (148180) + Masterwork Setting (148019)
  (31624,147985,0,0,0,0,1),(31624,148234,1,0,0,0,0),(31624,148172,0,0,1,0,0),(31624,148180,0,0,1,0,0),(31624,148019,0,0,1,1,0),
  -- T4 Carnelian: Polished Brilliant Ruby (148172) + Polished Brilliant Jasper (148176)
  (31625,147985,0,0,0,0,1),(31625,148235,1,0,0,0,0),(31625,148172,0,0,1,0,0),(31625,148176,0,0,1,0,0),(31625,148019,0,0,1,1,0),
  -- T4 Tiger's Eye: Polished Brilliant Topaz (148180) + Polished Brilliant Peridot (148184)
  (31626,147985,0,0,0,0,1),(31626,148236,1,0,0,0,0),(31626,148180,0,0,1,0,0),(31626,148184,0,0,1,0,0),(31626,148019,0,0,1,1,0),
  -- T4 Lapis: Polished Brilliant Amethyst (148192) + Polished Brilliant Sapphire (148188)
  (31627,147985,0,0,0,0,1),(31627,148237,1,0,0,0,0),(31627,148192,0,0,1,0,0),(31627,148188,0,0,1,0,0),(31627,148019,0,0,1,1,0),
  -- T4 Sunstone: Polished Brilliant Sapphire (148188) + Polished Brilliant Opal (148196)
  (31628,147985,0,0,0,0,1),(31628,148238,1,0,0,0,0),(31628,148188,0,0,1,0,0),(31628,148196,0,0,1,0,0),(31628,148019,0,0,1,1,0),
  -- T4 Hawk's Eye: Polished Brilliant Peridot (148184) + Polished Brilliant Jasper (148176)
  (31629,147985,0,0,0,0,1),(31629,148239,1,0,0,0,0),(31629,148184,0,0,1,0,0),(31629,148176,0,0,1,0,0),(31629,148019,0,0,1,1,0),
  -- T4 Banded Agate: Polished Brilliant Citrine (148204) + Polished Brilliant Moonstone (148208)
  (31630,147985,0,0,0,0,1),(31630,148240,1,0,0,0,0),(31630,148204,0,0,1,0,0),(31630,148208,0,0,1,0,0),(31630,148019,0,0,1,1,0),
  -- T4 Malachite: Polished Brilliant Amber (148216) + Polished Brilliant Obsidian (148212)
  (31631,147985,0,0,0,0,1),(31631,148241,1,0,0,0,0),(31631,148216,0,0,1,0,0),(31631,148212,0,0,1,0,0),(31631,148019,0,0,1,1,0);
