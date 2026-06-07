-- Weapon Smithing: Weapon Molds Merchant (NPC 760141)
-- Populates merchant list 1000027 with all 56 weapon molds.
-- Order: T1 first (slots 0-13), T2 (14-27), T3 (28-41), T4 (42-55)
-- Within each tier: Long Sword, Short Sword, Scimitar, Axe, Mace, Hammer,
--   Club, Dagger, Spear, Two Handed Sword, Two Handed Axe,
--   Two Handed Hammer, Staff, Halberd

-- Ensure sellrate=1.0 on all molds so vendor prices display correctly
UPDATE items SET sellrate = 1.0 WHERE id BETWEEN 147700 AND 147755;

INSERT INTO merchantlist (merchantid, slot, item) VALUES
-- T1 Weathered Molds (slots 0-13)
  (1000027,  0, 147700), -- Weathered Long Sword Mold
  (1000027,  1, 147701), -- Weathered Short Sword Mold
  (1000027,  2, 147702), -- Weathered Scimitar Mold
  (1000027,  3, 147703), -- Weathered Axe Mold
  (1000027,  4, 147704), -- Weathered Mace Mold
  (1000027,  5, 147705), -- Weathered Hammer Mold
  (1000027,  6, 147706), -- Weathered Club Mold
  (1000027,  7, 147707), -- Weathered Dagger Mold
  (1000027,  8, 147708), -- Weathered Spear Mold
  (1000027,  9, 147709), -- Weathered Two Handed Sword Mold
  (1000027, 10, 147710), -- Weathered Two Handed Axe Mold
  (1000027, 11, 147711), -- Weathered Two Handed Hammer Mold
  (1000027, 12, 147712), -- Weathered Staff Mold
  (1000027, 13, 147713), -- Weathered Halberd Mold
-- T2 Reinforced Molds (slots 14-27)
  (1000027, 14, 147714), -- Reinforced Long Sword Mold
  (1000027, 15, 147715), -- Reinforced Short Sword Mold
  (1000027, 16, 147716), -- Reinforced Scimitar Mold
  (1000027, 17, 147717), -- Reinforced Axe Mold
  (1000027, 18, 147718), -- Reinforced Mace Mold
  (1000027, 19, 147719), -- Reinforced Hammer Mold
  (1000027, 20, 147720), -- Reinforced Club Mold
  (1000027, 21, 147721), -- Reinforced Dagger Mold
  (1000027, 22, 147722), -- Reinforced Spear Mold
  (1000027, 23, 147723), -- Reinforced Two Handed Sword Mold
  (1000027, 24, 147724), -- Reinforced Two Handed Axe Mold
  (1000027, 25, 147725), -- Reinforced Two Handed Hammer Mold
  (1000027, 26, 147726), -- Reinforced Staff Mold
  (1000027, 27, 147727), -- Reinforced Halberd Mold
-- T3 Tempered Molds (slots 28-41)
  (1000027, 28, 147728), -- Tempered Long Sword Mold
  (1000027, 29, 147729), -- Tempered Short Sword Mold
  (1000027, 30, 147730), -- Tempered Scimitar Mold
  (1000027, 31, 147731), -- Tempered Axe Mold
  (1000027, 32, 147732), -- Tempered Mace Mold
  (1000027, 33, 147733), -- Tempered Hammer Mold
  (1000027, 34, 147734), -- Tempered Club Mold
  (1000027, 35, 147735), -- Tempered Dagger Mold
  (1000027, 36, 147736), -- Tempered Spear Mold
  (1000027, 37, 147737), -- Tempered Two Handed Sword Mold
  (1000027, 38, 147738), -- Tempered Two Handed Axe Mold
  (1000027, 39, 147739), -- Tempered Two Handed Hammer Mold
  (1000027, 40, 147740), -- Tempered Staff Mold
  (1000027, 41, 147741), -- Tempered Halberd Mold
-- T4 Ascendant Molds (slots 42-55)
  (1000027, 42, 147742), -- Ascendant Long Sword Mold
  (1000027, 43, 147743), -- Ascendant Short Sword Mold
  (1000027, 44, 147744), -- Ascendant Scimitar Mold
  (1000027, 45, 147745), -- Ascendant Axe Mold
  (1000027, 46, 147746), -- Ascendant Mace Mold
  (1000027, 47, 147747), -- Ascendant Hammer Mold
  (1000027, 48, 147748), -- Ascendant Club Mold
  (1000027, 49, 147749), -- Ascendant Dagger Mold
  (1000027, 50, 147750), -- Ascendant Spear Mold
  (1000027, 51, 147751), -- Ascendant Two Handed Sword Mold
  (1000027, 52, 147752), -- Ascendant Two Handed Axe Mold
  (1000027, 53, 147753), -- Ascendant Two Handed Hammer Mold
  (1000027, 54, 147754), -- Ascendant Staff Mold
  (1000027, 55, 147755); -- Ascendant Halberd Mold
