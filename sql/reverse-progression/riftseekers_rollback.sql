-- Riftseekers Sanctum - Rollback Script
-- Date: May 16, 2026
-- Restores npc_types and spawn2 from backup tables

-- Restore npc_types from backup
UPDATE npc_types nt
SET 
  level = (SELECT level FROM npc_types_backup_riftseekers_classic_20260516 bak WHERE bak.id = nt.id),
  maxlevel = (SELECT maxlevel FROM npc_types_backup_riftseekers_classic_20260516 bak WHERE bak.id = nt.id),
  hp = (SELECT hp FROM npc_types_backup_riftseekers_classic_20260516 bak WHERE bak.id = nt.id),
  mindmg = (SELECT mindmg FROM npc_types_backup_riftseekers_classic_20260516 bak WHERE bak.id = nt.id),
  maxdmg = (SELECT maxdmg FROM npc_types_backup_riftseekers_classic_20260516 bak WHERE bak.id = nt.id),
  AC = (SELECT AC FROM npc_types_backup_riftseekers_classic_20260516 bak WHERE bak.id = nt.id),
  STR = (SELECT STR FROM npc_types_backup_riftseekers_classic_20260516 bak WHERE bak.id = nt.id),
  STA = (SELECT STA FROM npc_types_backup_riftseekers_classic_20260516 bak WHERE bak.id = nt.id),
  DEX = (SELECT DEX FROM npc_types_backup_riftseekers_classic_20260516 bak WHERE bak.id = nt.id),
  AGI = (SELECT AGI FROM npc_types_backup_riftseekers_classic_20260516 bak WHERE bak.id = nt.id),
  WIS = (SELECT WIS FROM npc_types_backup_riftseekers_classic_20260516 bak WHERE bak.id = nt.id),
  _INT = (SELECT _INT FROM npc_types_backup_riftseekers_classic_20260516 bak WHERE bak.id = nt.id),
  CHA = (SELECT CHA FROM npc_types_backup_riftseekers_classic_20260516 bak WHERE bak.id = nt.id),
  MR = (SELECT MR FROM npc_types_backup_riftseekers_classic_20260516 bak WHERE bak.id = nt.id),
  FR = (SELECT FR FROM npc_types_backup_riftseekers_classic_20260516 bak WHERE bak.id = nt.id),
  CR = (SELECT CR FROM npc_types_backup_riftseekers_classic_20260516 bak WHERE bak.id = nt.id),
  PR = (SELECT PR FROM npc_types_backup_riftseekers_classic_20260516 bak WHERE bak.id = nt.id),
  DR = (SELECT DR FROM npc_types_backup_riftseekers_classic_20260516 bak WHERE bak.id = nt.id),
  Corrup = (SELECT Corrup FROM npc_types_backup_riftseekers_classic_20260516 bak WHERE bak.id = nt.id),
  attack_delay = (SELECT attack_delay FROM npc_types_backup_riftseekers_classic_20260516 bak WHERE bak.id = nt.id),
  attack_speed = (SELECT attack_speed FROM npc_types_backup_riftseekers_classic_20260516 bak WHERE bak.id = nt.id),
  aggroradius = (SELECT aggroradius FROM npc_types_backup_riftseekers_classic_20260516 bak WHERE bak.id = nt.id),
  assistradius = (SELECT assistradius FROM npc_types_backup_riftseekers_classic_20260516 bak WHERE bak.id = nt.id),
  npc_spells_id = (SELECT npc_spells_id FROM npc_types_backup_riftseekers_classic_20260516 bak WHERE bak.id = nt.id),
  special_abilities = (SELECT special_abilities FROM npc_types_backup_riftseekers_classic_20260516 bak WHERE bak.id = nt.id),
  npcspecialattks = (SELECT npcspecialattks FROM npc_types_backup_riftseekers_classic_20260516 bak WHERE bak.id = nt.id),
  spellscale = (SELECT spellscale FROM npc_types_backup_riftseekers_classic_20260516 bak WHERE bak.id = nt.id),
  healscale = (SELECT healscale FROM npc_types_backup_riftseekers_classic_20260516 bak WHERE bak.id = nt.id),
  raid_target = (SELECT raid_target FROM npc_types_backup_riftseekers_classic_20260516 bak WHERE bak.id = nt.id),
  always_aggro = (SELECT always_aggro FROM npc_types_backup_riftseekers_classic_20260516 bak WHERE bak.id = nt.id),
  hp_regen_rate = (SELECT hp_regen_rate FROM npc_types_backup_riftseekers_classic_20260516 bak WHERE bak.id = nt.id),
  hp_regen_per_second = (SELECT hp_regen_per_second FROM npc_types_backup_riftseekers_classic_20260516 bak WHERE bak.id = nt.id),
  mana_regen_rate = (SELECT mana_regen_rate FROM npc_types_backup_riftseekers_classic_20260516 bak WHERE bak.id = nt.id)
WHERE id IN (
  334000, 334001, 334002, 334003, 334004, 334005, 334006, 334007, 334008, 334009,
  334010, 334011, 334012, 334013, 334015, 334016, 334017, 334018, 334019, 334020,
  334021, 334022, 334023, 334024, 334025, 334026, 334027, 334028, 334029, 334030,
  334031, 334032, 334033, 334050, 334051, 334052, 334054, 334055, 334056, 334057,
  334058, 334059, 334060, 334061, 334062, 334063, 334064, 334065, 334066, 334067,
  334068, 334069, 334070, 334071, 334072, 334073, 334074, 334075, 334076, 334077,
  334078, 334079, 334080, 334081, 334082, 334083, 334084, 334088, 334089, 334090,
  334091, 334093, 334096, 334103, 334104, 334105, 334106, 334108, 334121
);

-- Restore spawn2 respawntime from backup
UPDATE spawn2 s2
SET respawntime = (SELECT respawntime FROM spawn2_backup_riftseekers_respawn_20260516 bak WHERE bak.id = s2.id)
WHERE id IN (SELECT id FROM spawn2_backup_riftseekers_respawn_20260516);
