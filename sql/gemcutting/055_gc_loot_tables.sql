-- Gem Cutting Loot Table Integration — All Tiers
--
-- Raw gem drops are added as independent lootdrop groups appended to the
-- existing armor/weapon smithing loottables. NPCs roll each group independently,
-- so gem drops do not replace or reduce other crafting drop chances.
--
-- Drop rate: 15% per gem type (raw material only — no intermediates or augments drop)
--
-- Zone-to-loottable mapping:
--   T1 (111003): Dranik's Scar, Nobles' Causeway
--   T2 (111004): Bloodfields, Ruined City of Dranik, Sewers of Dranik A/B/C
--   T3 (111005): Catacombs of Dranik A/B/C, Dranik's Hollows A/B/C, Harbinger's Spire
--   T4 (111006): Wall of Slaughter, Riftseekers' Sanctum, Muramite Proving Grounds

-- ============================================================
-- T1 — Dranik's Scar, Nobles' Causeway (loottable 111003)
-- ============================================================
INSERT IGNORE INTO lootdrop (id, name) VALUES
  (992072, 'gc_t1_rough_garnet'),
  (992073, 'gc_t1_rough_aquamarine');

INSERT IGNORE INTO lootdrop_entries (lootdrop_id, item_id, item_charges, equip_item, chance) VALUES
  (992072, 147986, 1, 0, 15),  -- Rough Garnet       15%
  (992073, 147987, 1, 0, 15);  -- Rough Aquamarine   15%

INSERT IGNORE INTO loottable_entries (loottable_id, lootdrop_id, multiplier, droplimit, mindrop, probability) VALUES
  (111003, 992072, 1, 1, 0, 100),
  (111003, 992073, 1, 1, 0, 100);

-- ============================================================
-- T2 — Bloodfields, Ruined City, Sewers (loottable 111004)
-- ============================================================
INSERT IGNORE INTO lootdrop (id, name) VALUES
  (992074, 'gc_t2_pale_garnet_chip'),
  (992075, 'gc_t2_pale_aquamarine_chip');

INSERT IGNORE INTO lootdrop_entries (lootdrop_id, item_id, item_charges, equip_item, chance) VALUES
  (992074, 147996, 1, 0, 15),  -- Pale Garnet Chip       15%
  (992075, 147997, 1, 0, 15);  -- Pale Aquamarine Chip   15%

INSERT IGNORE INTO loottable_entries (loottable_id, lootdrop_id, multiplier, droplimit, mindrop, probability) VALUES
  (111004, 992074, 1, 1, 0, 100),
  (111004, 992075, 1, 1, 0, 100);

-- ============================================================
-- T3 — Catacombs, Hollows, Harbinger's Spire (loottable 111005)
-- ============================================================
INSERT IGNORE INTO lootdrop (id, name) VALUES
  (992076, 'gc_t3_deep_garnet_crystal'),
  (992077, 'gc_t3_deep_aquamarine_crystal');

INSERT IGNORE INTO lootdrop_entries (lootdrop_id, item_id, item_charges, equip_item, chance) VALUES
  (992076, 148006, 1, 0, 15),  -- Deep Garnet Crystal       15%
  (992077, 148007, 1, 0, 15);  -- Deep Aquamarine Crystal   15%

INSERT IGNORE INTO loottable_entries (loottable_id, lootdrop_id, multiplier, droplimit, mindrop, probability) VALUES
  (111005, 992076, 1, 1, 0, 100),
  (111005, 992077, 1, 1, 0, 100);

-- ============================================================
-- T4 — Wall of Slaughter, Riftseekers, Proving Grounds (loottable 111006)
-- ============================================================
INSERT IGNORE INTO lootdrop (id, name) VALUES
  (992078, 'gc_t4_brilliant_garnet_core'),
  (992079, 'gc_t4_brilliant_aquamarine_core');

INSERT IGNORE INTO lootdrop_entries (lootdrop_id, item_id, item_charges, equip_item, chance) VALUES
  (992078, 148016, 1, 0, 15),  -- Brilliant Garnet Core       15%
  (992079, 148017, 1, 0, 15);  -- Brilliant Aquamarine Core   15%

INSERT IGNORE INTO loottable_entries (loottable_id, lootdrop_id, multiplier, droplimit, mindrop, probability) VALUES
  (111006, 992078, 1, 1, 0, 100),
  (111006, 992079, 1, 1, 0, 100);
