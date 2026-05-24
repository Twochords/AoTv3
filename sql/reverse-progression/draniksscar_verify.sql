-- =============================================================================
-- Dranik's Scar Reverse-Progression — VERIFICATION QUERIES
-- Applied: 2026-05-09
-- =============================================================================
-- Run these after applying draniksscar_npc_normalization.sql to confirm
-- all changes landed correctly.
-- =============================================================================

-- ---------------------------------------------------------------------------
-- 1. Level match summary — expect exact_level_matches=65, level_mismatches=0
-- ---------------------------------------------------------------------------
SELECT
    COUNT(*) AS total_candidates,
    SUM(CASE WHEN n.level = b.level THEN 0 ELSE 1 END) AS level_mismatches,
    SUM(CASE WHEN n.level = b.level THEN 1 ELSE 0 END) AS unchanged_from_backup
FROM npc_types n
JOIN npc_types_backup_draniksscar_20260509 b ON b.id = n.id
WHERE n.id BETWEEN 302000 AND 302064;

-- NOTE: After normalization the current level differs from the backup (that's the
-- point). Use the query below for the positive assertion:

-- ---------------------------------------------------------------------------
-- 2. Current level vs backup — spot-check any MISMATCH rows
-- ---------------------------------------------------------------------------
SELECT
    n.id,
    n.name,
    n.level           AS current_level,
    b.level           AS pre_norm_backup_level,
    n.npc_spells_id,
    n.special_abilities
FROM npc_types n
JOIN npc_types_backup_draniksscar_20260509 b ON b.id = n.id
WHERE n.id BETWEEN 302000 AND 302064
ORDER BY n.id;

-- ---------------------------------------------------------------------------
-- 3. Confirm 24 spell IDs cleared (npc_spells_id = 0 for all 65)
-- ---------------------------------------------------------------------------
SELECT
    SUM(CASE WHEN npc_spells_id = 0 THEN 1 ELSE 0 END) AS spell_id_cleared,
    SUM(CASE WHEN npc_spells_id != 0 THEN 1 ELSE 0 END) AS spell_id_remaining
FROM npc_types
WHERE id BETWEEN 302000 AND 302064;

-- ---------------------------------------------------------------------------
-- 4. Confirm 19 special_ability strings cleared
-- ---------------------------------------------------------------------------
SELECT
    SUM(CASE WHEN special_abilities = '' THEN 1 ELSE 0 END) AS special_abilities_cleared,
    SUM(CASE WHEN special_abilities != '' THEN 1 ELSE 0 END) AS special_abilities_remaining
FROM npc_types
WHERE id BETWEEN 302000 AND 302064;

-- ---------------------------------------------------------------------------
-- 5. Guard NPC 998038 field verification
-- ---------------------------------------------------------------------------
SELECT
    id,
    name,
    level,
    aggroradius,
    assistradius,
    special_abilities,
    npcspecialattks,
    npc_spells_id,
    npc_faction_id
FROM npc_types
WHERE id = 998038;
-- Expected: aggroradius=60, assistradius=80, special_abilities='', npc_spells_id=0

-- ---------------------------------------------------------------------------
-- 6. Backup table row count sanity check
-- ---------------------------------------------------------------------------
SELECT COUNT(*) AS backup_rows FROM npc_types_backup_draniksscar_20260509;
-- Expected: 66 (65 Dranik NPCs + guard 998038)

-- ---------------------------------------------------------------------------
-- 7. Spawn entries for guard 998038
-- ---------------------------------------------------------------------------
SELECT id, zone, version, x, y, z, respawntime, enabled
FROM spawn2
WHERE id IN (
    SELECT spawngroupid FROM spawnentry WHERE npcid = 998038
)
ORDER BY id;
-- Expected: 6 spawn2 entries in draniksscar zone
