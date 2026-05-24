-- =============================================================================
-- Dranik's Scar Reverse-Progression — ROLLBACK SQL
-- Applied: 2026-05-09
-- =============================================================================
-- Restores all 65 Dranik's Scar NPCs and guard 998038 to their pre-normalization
-- state from the backup table npc_types_backup_draniksscar_20260509.
--
-- IMPORTANT: This rollback does NOT drop the backup table. It only restores data.
-- The backup table must remain intact for auditing and future rollback capability.
-- =============================================================================

-- ---------------------------------------------------------------------------
-- Restore all 65 Dranik's Scar NPCs from backup
-- ---------------------------------------------------------------------------
UPDATE npc_types n
JOIN npc_types_backup_draniksscar_20260509 b ON b.id = n.id
SET
    n.level           = b.level,
    n.npc_spells_id   = b.npc_spells_id,
    n.special_abilities = b.special_abilities,
    n.npcspecialattks = b.npcspecialattks,
    n.aggroradius     = b.aggroradius,
    n.assistradius    = b.assistradius
WHERE n.id IN (
    302000, 302001, 302002, 302003, 302004, 302005, 302006, 302007, 302008, 302009,
    302010, 302011, 302012, 302013, 302014, 302015, 302016, 302017, 302018, 302019,
    302020, 302021, 302022, 302023, 302024, 302025, 302026, 302027, 302028, 302029,
    302030, 302031, 302032, 302033, 302034, 302035, 302036, 302037, 302038, 302039,
    302040, 302041, 302042, 302043, 302044, 302045, 302046, 302047, 302048, 302049,
    302050, 302051, 302052, 302053, 302054, 302055, 302056, 302057, 302058, 302059,
    302060, 302061, 302062, 302063, 302064,
    998038
);

-- ---------------------------------------------------------------------------
-- Restore guard NPC 998038 specifically (explicit for clarity)
-- ---------------------------------------------------------------------------
-- Pre-normalization values:
--   aggroradius:       55
--   assistradius:      55
--   special_abilities: '10,1^14,1'
--   npcspecialattks:   ''
--   npc_spells_id:     0
UPDATE npc_types
SET
    aggroradius       = 55,
    assistradius      = 55,
    special_abilities = '10,1^14,1',
    npcspecialattks   = '',
    npc_spells_id     = 0
WHERE id = 998038;

-- ---------------------------------------------------------------------------
-- Verify rollback completed
-- ---------------------------------------------------------------------------
SELECT
    n.id,
    n.name,
    n.level         AS current_level,
    b.level         AS backup_level,
    CASE WHEN n.level = b.level THEN 'MATCH' ELSE 'MISMATCH' END AS level_check,
    n.npc_spells_id,
    n.special_abilities
FROM npc_types n
JOIN npc_types_backup_draniksscar_20260509 b ON b.id = n.id
WHERE n.id IN (
    302000, 302001, 302002, 302003, 302004, 302005, 302006, 302007, 302008, 302009,
    302010, 302011, 302012, 302013, 302014, 302015, 302016, 302017, 302018, 302019,
    302020, 302021, 302022, 302023, 302024, 302025, 302026, 302027, 302028, 302029,
    302030, 302031, 302032, 302033, 302034, 302035, 302036, 302037, 302038, 302039,
    302040, 302041, 302042, 302043, 302044, 302045, 302046, 302047, 302048, 302049,
    302050, 302051, 302052, 302053, 302054, 302055, 302056, 302057, 302058, 302059,
    302060, 302061, 302062, 302063, 302064,
    998038
)
ORDER BY n.id;
