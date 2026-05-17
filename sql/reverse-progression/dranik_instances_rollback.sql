-- ============================================================================
-- DRANIK INSTANCES REBALANCE - ROLLBACK PROCEDURE
-- ============================================================================
-- Execution Date: 2026-05-16
-- Use ONLY if rebalance must be reversed
-- Restores npc_types and spawn2 from backup tables
-- ============================================================================

-- STEP 1: RESTORE NPC_TYPES FROM BACKUP
-- Restores all 339 affected NPC stats to original values
-- ============================================================================

UPDATE npc_types t
INNER JOIN npc_types_backup_dranik_classic_20260516 b 
  ON t.id = b.id
SET
  t.level = b.level,
  t.maxlevel = b.maxlevel,
  t.hp = b.hp,
  t.mindmg = b.mindmg,
  t.maxdmg = b.maxdmg,
  t.ac = b.ac,
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
  t.spellscale = b.spellscale,
  t.healscale = b.healscale,
  t.raid_target = b.raid_target,
  t.always_aggro = b.always_aggro;

-- STEP 2: RESTORE SPAWN2 RESPAWN TIMES FROM BACKUP
-- Restores all ~1,461 spawn respawn times to original values
-- ============================================================================

UPDATE spawn2 s
INNER JOIN spawn2_backup_dranik_respawn_20260516 b 
  ON s.id = b.id
SET s.respawntime = b.respawntime;

-- ============================================================================
-- CLEANUP (Optional - drop backup tables after verifying rollback success)
-- ============================================================================

-- Uncomment to drop backup tables after rollback verification:
-- DROP TABLE npc_types_backup_dranik_classic_20260516;
-- DROP TABLE spawn2_backup_dranik_respawn_20260516;

-- ============================================================================
-- VERIFICATION QUERIES (Run these after rollback to confirm success)
-- ============================================================================

-- Check npc_types restored from backup
-- SELECT 
--   COUNT(*) as restored_npcs,
--   MIN(level) as min_level,
--   MAX(level) as max_level
-- FROM npc_types
-- WHERE id IN (SELECT id FROM npc_types_backup_dranik_classic_20260516);

-- Check spawn2 respawn times restored
-- SELECT 
--   zone,
--   COUNT(*) as spawn_count,
--   MIN(respawntime) as min_respawn,
--   MAX(respawntime) as max_respawn
-- FROM spawn2
-- WHERE zone IN ('draniksewersa', 'draniksewersb', 'draniksewersc',
--                'dranikcatacombsa', 'dranikcatacombsb', 'dranikcatacombsc',
--                'dranikhollowsa', 'dranikhollowsb', 'dranikhollowsc')
-- GROUP BY zone
-- ORDER BY zone;

-- Verify backup tables still exist (if not dropped)
-- SELECT 
--   'npc_types_backup_dranik_classic_20260516' as table_name,
--   COUNT(*) as row_count
-- FROM npc_types_backup_dranik_classic_20260516
-- UNION ALL
-- SELECT 
--   'spawn2_backup_dranik_respawn_20260516',
--   COUNT(*) 
-- FROM spawn2_backup_dranik_respawn_20260516;
