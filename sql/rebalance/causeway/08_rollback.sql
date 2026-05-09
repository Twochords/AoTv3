-- Purpose: Phase 08 rollback scripts using UPDATE JOIN only.
-- Execution order: run for rollback scenarios.
-- Schema compatibility note:
-- Uses Variant A columns (mindmg/maxdmg, AC, Avoidance).
-- Adjust for Variant B schemas (min_dmg/max_dmg, ac, avoidance) as needed.
-- Safety note:
-- UPDATE JOIN preserves row identity and references; intended row-replace semantics is intentionally prohibited.

USE peq;

UPDATE npc_types n
JOIN _backup_nc_npc_types_pre_statbal b ON b.id = n.id
SET
  n.level = b.level,
  n.hp = b.hp,
  n.mindmg = b.mindmg,
  n.maxdmg = b.maxdmg,
  n.AC = b.AC,
  n.MR = b.MR,
  n.FR = b.FR,
  n.CR = b.CR,
  n.DR = b.DR,
  n.PR = b.PR,
  n.STR = b.STR,
  n.STA = b.STA,
  n.DEX = b.DEX,
  n.AGI = b.AGI,
  n._INT = b._INT,
  n.WIS = b.WIS,
  n.CHA = b.CHA,
  n.mana = b.mana,
  n.attack_count = b.attack_count,
  n.attack_speed = b.attack_speed,
  n.accuracy = b.accuracy,
  n.Avoidance = b.Avoidance,
  n.runspeed = b.runspeed,
  n.see_invis = b.see_invis,
  n.see_invis_undead = b.see_invis_undead,
  n.see_hide = b.see_hide,
  n.see_improved_hide = b.see_improved_hide,
  n.special_abilities = b.special_abilities,
  n.npc_spells_id = b.npc_spells_id,
  n.exp_mod = b.exp_mod;

UPDATE npc_types n
JOIN _backup_nc_npc_types_pre_xp_sync b ON b.id = n.id
SET n.exp_mod = b.exp_mod;
