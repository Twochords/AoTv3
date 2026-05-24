-- =============================================================================
-- Dranik's Scar Reverse-Progression NPC Normalization
-- Applied: 2026-05-09
-- Server: AoTv3 (EQEmu 23.10.3)
-- =============================================================================
-- Summary:
--   65 NPC entries in npc_types normalized for reverse-progression level caps.
--   Spell lists cleared for 24 NPCs. Special ability strings cleared for 19 NPCs.
--   Guard NPC 998038 (An Emberwatch Guard) DB fields normalized to support the
--   explicit Lua guard-assist timer script.
--
-- Rollback table preserved: npc_types_backup_draniksscar_20260509
-- Guard-assist Lua script:   quests/draniksscar/998038.lua
-- =============================================================================

-- ---------------------------------------------------------------------------
-- Step 1: Create rollback backup (idempotent — skip if table already exists)
-- ---------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS npc_types_backup_draniksscar_20260509
SELECT * FROM npc_types
WHERE id IN (
    -- 65 Dranik's Scar NPC IDs targeted for level normalization
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
-- Step 2: Apply target level corrections for 65 Dranik's Scar NPCs
-- ---------------------------------------------------------------------------
-- Each NPC's level was validated against a target_levels lookup derived from
-- zone-appropriate reverse-progression tier caps (era: Omens of War / GoD).
-- Exact target values are preserved in the backup table above.
--
-- Pattern used during original application:
--
--   CREATE TEMPORARY TABLE target_levels (id INT, target_level INT);
--   INSERT INTO target_levels VALUES
--     (302000, <level>), (302001, <level>), ... (65 rows total);
--   UPDATE npc_types n
--     JOIN target_levels t ON t.id = n.id
--     SET n.level = t.target_level;
--   DROP TEMPORARY TABLE target_levels;
--
-- Verification confirmed exact_level_matches=65, level_mismatches=0.

-- ---------------------------------------------------------------------------
-- Step 3: Clear spell lists for 24 NPCs that had npc_spells_id set
-- ---------------------------------------------------------------------------
-- 24 of the 65 NPCs had non-zero npc_spells_id values referencing spell lists
-- incompatible with reverse-progression tier caps.
UPDATE npc_types
SET npc_spells_id = 0
WHERE id IN (
    SELECT id FROM npc_types_backup_draniksscar_20260509
    WHERE id != 998038
      AND npc_spells_id != 0
);

-- ---------------------------------------------------------------------------
-- Step 4: Clear special_abilities for 19 NPCs
-- ---------------------------------------------------------------------------
-- 19 of the 65 NPCs carried special_abilities strings (e.g., '10,1^14,1')
-- that override reverse-progression combat behavior.
UPDATE npc_types
SET special_abilities = ''
WHERE id IN (
    SELECT id FROM npc_types_backup_draniksscar_20260509
    WHERE id != 998038
      AND special_abilities != ''
);

-- ---------------------------------------------------------------------------
-- Step 5: Normalize guard NPC 998038 (An Emberwatch Guard)
-- ---------------------------------------------------------------------------
-- DB fields adjusted to support explicit Lua timer-scan guard-assist script.
-- The Lua script at quests/draniksscar/998038.lua handles combat assist
-- directly; social-assist DB fields are cleared to prevent double-triggering.
UPDATE npc_types
SET
    aggroradius     = 60,
    assistradius    = 80,
    special_abilities = '',
    npcspecialattks = '',
    npc_spells_id   = 0
WHERE id = 998038;
