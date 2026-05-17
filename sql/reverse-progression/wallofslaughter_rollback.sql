-- WALLOFSLAUGHTER CLASSIC REBALANCE ROLLBACK (PREVIEW-ONLY PACKAGE)
-- Restores npc_types and spawn2 from backup tables

UPDATE npc_types t
JOIN npc_types_backup_wallofslaughter_classic_20260516 b ON b.id = t.id
SET
  t.level = b.level,
  t.maxlevel = b.maxlevel,
  t.hp = b.hp,
  t.mindmg = b.mindmg,
  t.maxdmg = b.maxdmg,
  t.AC = b.AC,
  t.STR = b.STR,
  t.STA = b.STA,
  t.DEX = b.DEX,
  t.AGI = b.AGI,
  t.WIS = b.WIS,
  t._INT = b._INT,
  t.CHA = b.CHA,
  t.MR = b.MR,
  t.FR = b.FR,
  t.CR = b.CR,
  t.PR = b.PR,
  t.DR = b.DR,
  t.Corrup = b.Corrup,
  t.attack_delay = b.attack_delay,
  t.attack_speed = b.attack_speed,
  t.aggroradius = b.aggroradius,
  t.assistradius = b.assistradius,
  t.npc_spells_id = b.npc_spells_id,
  t.special_abilities = b.special_abilities,
  t.npcspecialattks = b.npcspecialattks,
  t.spellscale = b.spellscale,
  t.healscale = b.healscale,
  t.raid_target = b.raid_target,
  t.always_aggro = b.always_aggro,
  t.hp_regen_rate = b.hp_regen_rate,
  t.hp_regen_per_second = b.hp_regen_per_second,
  t.mana_regen_rate = b.mana_regen_rate
;

UPDATE spawn2 s
JOIN spawn2_backup_wallofslaughter_respawn_20260516 b ON b.id = s.id
SET s.respawntime = b.respawntime
WHERE s.zone = 'wallofslaughter' AND s.version = 0;
