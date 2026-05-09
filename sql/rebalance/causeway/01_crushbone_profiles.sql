-- Purpose: Phase 01 build Crushbone authority profiles by level.
-- Execution order: run after 00.
-- Schema compatibility note:
-- This script uses Variant A columns (mindmg/maxdmg, AC, Avoidance).
-- If your schema is Variant B (min_dmg/max_dmg, ac, avoidance), adjust mappings.
-- Special abilities note:
-- sample_special_abilities is first observed value, not a true statistical mode.

USE peq;

DROP TABLE IF EXISTS _tmp_crushbone_profiles;
CREATE TABLE _tmp_crushbone_profiles AS
SELECT
  nt.level,
  ROUND(AVG(nt.hp)) AS avg_hp,
  ROUND(AVG(nt.mindmg)) AS avg_mindmg,
  ROUND(AVG(nt.maxdmg)) AS avg_maxdmg,
  ROUND(AVG(nt.AC)) AS avg_AC,
  ROUND(AVG(nt.MR)) AS avg_MR,
  ROUND(AVG(nt.FR)) AS avg_FR,
  ROUND(AVG(nt.CR)) AS avg_CR,
  ROUND(AVG(nt.DR)) AS avg_DR,
  ROUND(AVG(nt.PR)) AS avg_PR,
  ROUND(AVG(nt.STR)) AS avg_STR,
  ROUND(AVG(nt.STA)) AS avg_STA,
  ROUND(AVG(nt.DEX)) AS avg_DEX,
  ROUND(AVG(nt.AGI)) AS avg_AGI,
  ROUND(AVG(nt._INT)) AS avg_INT,
  ROUND(AVG(nt.WIS)) AS avg_WIS,
  ROUND(AVG(nt.CHA)) AS avg_CHA,
  ROUND(AVG(nt.mana)) AS avg_mana,
  ROUND(AVG(nt.attack_count)) AS avg_attack_count,
  ROUND(AVG(nt.attack_speed)) AS avg_attack_speed,
  ROUND(AVG(nt.accuracy)) AS avg_accuracy,
  ROUND(AVG(nt.Avoidance)) AS avg_Avoidance,
  ROUND(AVG(nt.runspeed)) AS avg_runspeed,
  ROUND(AVG(nt.see_invis)) AS avg_see_invis,
  ROUND(AVG(nt.see_invis_undead)) AS avg_see_invis_undead,
  ROUND(AVG(nt.see_hide)) AS avg_see_hide,
  ROUND(AVG(nt.see_improved_hide)) AS avg_see_improved_hide,
  SUBSTRING_INDEX(GROUP_CONCAT(nt.special_abilities ORDER BY nt.id), ,, 1) AS sample_special_abilities,
  0 AS classic_npc_spells_id
FROM npc_types nt
JOIN spawnentry se ON se.npcID = nt.id
JOIN spawngroup sg ON sg.id = se.spawngroupID
JOIN spawn2 s2 ON s2.spawngroupID = sg.id
WHERE s2.zone =  crushbone
GROUP BY nt.level
ORDER BY nt.level;
