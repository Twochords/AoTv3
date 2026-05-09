-- Purpose: Phase 07 apply stat/spell/special_abilities rebalance.
-- Execution order: after approvals and backup validation.
-- Schema compatibility note:
-- Uses Variant A columns (mindmg/maxdmg, AC, Avoidance).
-- Adjust mappings for Variant B (min_dmg/max_dmg, ac, avoidance) before execution.

USE peq;

UPDATE _tmp_nc_preview
SET new_special_abilities = NULL
WHERE review_status IN (EXACT_MATCH,NEAR_MATCH)
  AND npc_level BETWEEN 63 AND 66;

UPDATE npc_types n
JOIN _tmp_nc_preview p ON p.npc_id = n.id
SET
  n.hp = p.new_hp,
  n.mindmg = p.new_mindmg,
  n.maxdmg = p.new_maxdmg,
  n.AC = p.new_AC,
  n.MR = p.new_MR,
  n.FR = p.new_FR,
  n.CR = p.new_CR,
  n.DR = p.new_DR,
  n.PR = p.new_PR,
  n.STR = p.new_STR,
  n.STA = p.new_STA,
  n.DEX = p.new_DEX,
  n.AGI = p.new_AGI,
  n._INT = p.new_INT,
  n.WIS = p.new_WIS,
  n.CHA = p.new_CHA,
  n.mana = p.new_mana,
  n.attack_count = p.new_attack_count,
  n.attack_speed = p.new_attack_speed,
  n.accuracy = p.new_accuracy,
  n.Avoidance = p.new_Avoidance,
  n.runspeed = p.new_runspeed,
  n.see_invis = p.new_see_invis,
  n.see_invis_undead = p.new_see_invis_undead,
  n.see_hide = p.new_see_hide,
  n.see_improved_hide = p.new_see_improved_hide,
  n.special_abilities = COALESCE(p.new_special_abilities,'),
  n.npc_spells_id = p.new_npc_spells_id
WHERE p.review_status IN (EXACT_MATCH,NEAR_MATCH);
