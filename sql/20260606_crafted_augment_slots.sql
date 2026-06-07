-- Crafted Gear Augment Slots
-- Adds augslot1type=10 (bit_AugTypeCraftedCommon) to all finished crafted items.
-- Gem Cutting augments must use augtype=512 to fit these slots.
--
-- Tier rules:
--   T1 Weathered : 1 slot  (augslot1 only)
--   T2 Reinforced: 1 slot  (augslot1 only)
--   T3 Tempered  : 2 slots (augslot1 + augslot2)
--   T4 Ascendant : 2 slots (augslot1 + augslot2)
--
-- Applies to all three crafting systems:
--   Armor Smithing  : 147520-147679 (finished armor only, slots != 0)
--   Weapon Smithing : 147800-147871 (weapons, shields, bows)
--   Accessory Crafting: 147892-147984 (finished accessories)

-- ============================================================
-- T1 WEATHERED — 1 augment slot
-- ============================================================

-- Armor T1 (147520-147546, all wearable)
UPDATE items SET
  augslot1type=10, augslot1visible=1
WHERE id BETWEEN 147520 AND 147546 AND slots != 0;

-- Weapons T1 (147800-147813)
UPDATE items SET
  augslot1type=10, augslot1visible=1
WHERE id BETWEEN 147800 AND 147813;

-- Shield T1 (147860) + Bow T1 (147868)
UPDATE items SET
  augslot1type=10, augslot1visible=1
WHERE id IN (147860, 147868);

-- Accessories T1 (147892-147897)
UPDATE items SET
  augslot1type=10, augslot1visible=1
WHERE id BETWEEN 147892 AND 147897;

-- ============================================================
-- T2 REINFORCED — 1 augment slot
-- ============================================================

-- Armor T2 (147568-147591)
UPDATE items SET
  augslot1type=10, augslot1visible=1
WHERE id BETWEEN 147568 AND 147591 AND slots != 0;

-- Weapons T2 (147814-147827)
UPDATE items SET
  augslot1type=10, augslot1visible=1
WHERE id BETWEEN 147814 AND 147827;

-- Shield T2 (147861) + Bow T2 (147869)
UPDATE items SET
  augslot1type=10, augslot1visible=1
WHERE id IN (147861, 147869);

-- Accessories T2 (147921-147926)
UPDATE items SET
  augslot1type=10, augslot1visible=1
WHERE id BETWEEN 147921 AND 147926;

-- ============================================================
-- T3 TEMPERED — 2 augment slots
-- ============================================================

-- Armor T3 (147612-147635)
UPDATE items SET
  augslot1type=10, augslot1visible=1,
  augslot2type=10, augslot2visible=1
WHERE id BETWEEN 147612 AND 147635 AND slots != 0;

-- Weapons T3 (147828-147841)
UPDATE items SET
  augslot1type=10, augslot1visible=1,
  augslot2type=10, augslot2visible=1
WHERE id BETWEEN 147828 AND 147841;

-- Shield T3 (147862) + Bow T3 (147870)
UPDATE items SET
  augslot1type=10, augslot1visible=1,
  augslot2type=10, augslot2visible=1
WHERE id IN (147862, 147870);

-- Accessories T3 (147950-147955)
UPDATE items SET
  augslot1type=10, augslot1visible=1,
  augslot2type=10, augslot2visible=1
WHERE id BETWEEN 147950 AND 147955;

-- ============================================================
-- T4 ASCENDANT — 2 augment slots
-- ============================================================

-- Armor T4 (147656-147679)
UPDATE items SET
  augslot1type=10, augslot1visible=1,
  augslot2type=10, augslot2visible=1
WHERE id BETWEEN 147656 AND 147679 AND slots != 0;

-- Weapons T4 (147842-147855)
UPDATE items SET
  augslot1type=10, augslot1visible=1,
  augslot2type=10, augslot2visible=1
WHERE id BETWEEN 147842 AND 147855;

-- Shield T4 (147863) + Bow T4 (147871)
UPDATE items SET
  augslot1type=10, augslot1visible=1,
  augslot2type=10, augslot2visible=1
WHERE id IN (147863, 147871);

-- Accessories T4 (147979-147984)
UPDATE items SET
  augslot1type=10, augslot1visible=1,
  augslot2type=10, augslot2visible=1
WHERE id BETWEEN 147979 AND 147984;
