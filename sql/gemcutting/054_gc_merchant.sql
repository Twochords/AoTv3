-- Gem Cutter Merchant List
-- NPC 760143 (Gem_Cutter), merchant list 1000029
--
-- Sells grindstones and settings for all tiers.
-- Gem polish is sold by the Gem Merchant (NPC 760142, list 1000028) — not duplicated here.
--
-- Slot layout:
--   0–3: Grindstones T1–T4
--   4–7: Settings T1–T4

INSERT IGNORE INTO merchantlist (merchantid, slot, item) VALUES
  (1000029, 0, 147988),  -- Minor Gem Grindstone    (T1)  5pp
  (1000029, 1, 147998),  -- Standard Gem Grindstone (T2) 25pp
  (1000029, 2, 148008),  -- Superior Gem Grindstone (T3) 100pp
  (1000029, 3, 148018),  -- Master's Gem Grindstone (T4) 500pp
  (1000029, 4, 147989),  -- Crude Augment Setting   (T1)  5pp
  (1000029, 5, 147999),  -- Worked Augment Setting  (T2) 25pp
  (1000029, 6, 148009),  -- Refined Augment Setting (T3) 100pp
  (1000029, 7, 148019);  -- Masterwork Augment Setting (T4) 500pp
