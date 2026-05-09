-- Purpose: Phase 03 generate preview/approval mapping table.
-- Execution order: after 01 and 02/02.5.
-- Schema compatibility note:
-- Uses Variant A columns (mindmg/maxdmg, AC, Avoidance).
-- Adjust old/new mappings if your schema uses Variant B (min_dmg/max_dmg, ac, avoidance).
-- Special abilities note:
-- sample_special_abilities source is approximate (first observed), not a true mode.

USE peq;

DROP TABLE IF EXISTS _tmp_nc_preview;
CREATE TABLE _tmp_nc_preview (
  npc_id INT,
  npc_name VARCHAR(128),
  npc_level INT,
  source_level_used INT,
  old_hp BIGINT,
  old_mindmg INT,
  old_maxdmg INT,
  old_AC INT,
  old_MR INT,
  old_FR INT,
  old_CR INT,
  old_DR INT,
  old_PR INT,
  old_STR INT,
  old_STA INT,
  old_DEX INT,
  old_AGI INT,
  old_INT INT,
  old_WIS INT,
  old_CHA INT,
  old_mana BIGINT,
  old_attack_count INT,
  old_attack_speed INT,
  old_accuracy INT,
  old_Avoidance INT,
  old_runspeed INT,
  old_see_invis INT,
  old_see_invis_undead INT,
  old_see_hide INT,
  old_see_improved_hide INT,
  old_special_abilities TEXT,
  old_npc_spells_id INT,
  new_hp INT,
  new_mindmg INT,
  new_maxdmg INT,
  new_AC INT,
  new_MR INT,
  new_FR INT,
  new_CR INT,
  new_DR INT,
  new_PR INT,
  new_STR INT,
  new_STA INT,
  new_DEX INT,
  new_AGI INT,
  new_INT INT,
  new_WIS INT,
  new_CHA INT,
  new_mana INT,
  new_attack_count INT,
  new_attack_speed INT,
  new_accuracy INT,
  new_Avoidance INT,
  new_runspeed INT,
  new_see_invis INT,
  new_see_invis_undead INT,
  new_see_hide INT,
  new_see_improved_hide INT,
  new_special_abilities TEXT,
  new_npc_spells_id INT,
  src_level_helper INT,
  review_status VARCHAR(32)
);

INSERT INTO _tmp_nc_preview (
  npc_id, npc_name, npc_level,
  old_hp, old_mindmg, old_maxdmg, old_AC, old_MR, old_FR, old_CR, old_DR, old_PR,
  old_STR, old_STA, old_DEX, old_AGI, old_INT, old_WIS, old_CHA,
  old_mana, old_attack_count, old_attack_speed, old_accuracy, old_Avoidance,
  old_runspeed, old_see_invis, old_see_invis_undead, old_see_hide, old_see_improved_hide,
  old_special_abilities, old_npc_spells_id, src_level_helper
)
SELECT
  t.npc_id, t.npc_name, t.npc_level,
  n.hp, n.mindmg, n.maxdmg, n.AC, n.MR, n.FR, n.CR, n.DR, n.PR,
  n.STR, n.STA, n.DEX, n.AGI, n._INT, n.WIS, n.CHA,
  n.mana, n.attack_count, n.attack_speed, n.accuracy, n.Avoidance,
  n.runspeed, n.see_invis, n.see_invis_undead, n.see_hide, n.see_improved_hide,
  n.special_abilities, n.npc_spells_id,
  COALESCE(
    (SELECT level FROM _tmp_crushbone_profiles WHERE level = t.npc_level LIMIT 1),
    (SELECT level FROM _tmp_crushbone_profiles WHERE ABS(level - t.npc_level) <= 2 ORDER BY ABS(level - t.npc_level) LIMIT 1)
  )
FROM _tmp_nc_targets t
JOIN npc_types n ON n.id = t.npc_id;

UPDATE _tmp_nc_preview p
JOIN _tmp_crushbone_profiles cb ON cb.level = p.src_level_helper
SET
  p.source_level_used = cb.level,
  p.new_hp = cb.avg_hp,
  p.new_mindmg = cb.avg_mindmg,
  p.new_maxdmg = cb.avg_maxdmg,
  p.new_AC = cb.avg_AC,
  p.new_MR = cb.avg_MR,
  p.new_FR = cb.avg_FR,
  p.new_CR = cb.avg_CR,
  p.new_DR = cb.avg_DR,
  p.new_PR = cb.avg_PR,
  p.new_STR = cb.avg_STR,
  p.new_STA = cb.avg_STA,
  p.new_DEX = cb.avg_DEX,
  p.new_AGI = cb.avg_AGI,
  p.new_INT = cb.avg_INT,
  p.new_WIS = cb.avg_WIS,
  p.new_CHA = cb.avg_CHA,
  p.new_mana = cb.avg_mana,
  p.new_attack_count = cb.avg_attack_count,
  p.new_attack_speed = cb.avg_attack_speed,
  p.new_accuracy = cb.avg_accuracy,
  p.new_Avoidance = cb.avg_Avoidance,
  p.new_runspeed = cb.avg_runspeed,
  p.new_see_invis = cb.avg_see_invis,
  p.new_see_invis_undead = cb.avg_see_invis_undead,
  p.new_see_hide = cb.avg_see_hide,
  p.new_see_improved_hide = cb.avg_see_improved_hide,
  p.new_special_abilities = cb.sample_special_abilities,
  p.new_npc_spells_id = 0,
  p.review_status = CASE WHEN cb.level = p.npc_level THEN EXACT_MATCH ELSE NEAR_MATCH END;

UPDATE _tmp_nc_preview SET review_status = NO_SOURCE WHERE source_level_used IS NULL;
