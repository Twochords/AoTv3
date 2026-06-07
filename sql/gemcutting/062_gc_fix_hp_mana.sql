-- Gem Cutting: Fix HP/Mana augment values to 5/10/20/40 (halved from original 10/25/60/150)
-- Applies to Garnet of Vitality (HP) and Aquamarine of Clarity (Mana) across all tiers.
--
-- IDs:
--   T1: Garnet=147994, Aquamarine=147995
--   T2: Garnet=148004, Aquamarine=148005
--   T3: Garnet=148014, Aquamarine=148015
--   T4: Garnet=148024, Aquamarine=148025

UPDATE items SET hp=5    WHERE id IN (147994, 148004, 148014, 148024);
UPDATE items SET mana=5  WHERE id IN (147995, 148005, 148015, 148025);

-- Set correct per-tier values (override the uniform SET above)
UPDATE items SET hp=5   WHERE id=147994;
UPDATE items SET mana=5 WHERE id=147995;
UPDATE items SET hp=10  WHERE id=148004;
UPDATE items SET mana=10 WHERE id=148005;
UPDATE items SET hp=20  WHERE id=148014;
UPDATE items SET mana=20 WHERE id=148015;
UPDATE items SET hp=40  WHERE id=148024;
UPDATE items SET mana=40 WHERE id=148025;
