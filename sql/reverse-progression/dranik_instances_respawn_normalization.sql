-- ============================================================================
-- DRANIK INSTANCES RESPAWN NORMALIZATION
-- ============================================================================
-- Execution Date: 2026-05-16
-- Scope: spawn2 table ONLY
-- ~1,461 spawn records across 9 zone instances
-- Do NOT execute until review is complete
-- ============================================================================

-- STEP 1: NORMALIZE RESPAWN TIMES BY ZONE GROUP
-- Classic-era respawn tiers: 8 min (sewers) / 12 min (catacombs) / 20 min (hollows)
-- ============================================================================

-- Zone Group 1: SEWERS OF DRANIK (zones 331, 332, 333)
-- Entry-level dungeons: 8-minute respawn
UPDATE spawn2 SET respawntime = 480 
WHERE zone IN ('draniksewersa', 'draniksewersb', 'draniksewersc');

-- Zone Group 2: CATACOMBS OF DRANIK (zones 328, 329, 330)
-- Intermediate dungeons: 12-minute respawn
UPDATE spawn2 SET respawntime = 720 
WHERE zone IN ('dranikcatacombsa', 'dranikcatacombsb', 'dranikcatacombsc');

-- Zone Group 3: DRANIK'S HOLLOWS (zones 318, 319, 320)
-- Raid-tier dungeons: 20-minute respawn
UPDATE spawn2 SET respawntime = 1200 
WHERE zone IN ('dranikhollowsa', 'dranikhollowsb', 'dranikhollowsc');

-- ============================================================================
-- VERIFICATION QUERIES (Run these after execution)
-- ============================================================================

-- Verify respawn times normalized per zone group
-- SELECT 
--   CASE 
--     WHEN zone IN ('draniksewersa', 'draniksewersb', 'draniksewersc') THEN 'Sewers'
--     WHEN zone IN ('dranikcatacombsa', 'dranikcatacombsb', 'dranikcatacombsc') THEN 'Catacombs'
--     WHEN zone IN ('dranikhollowsa', 'dranikhollowsb', 'dranikhollowsc') THEN 'Hollows'
--   END as zone_group,
--   zone,
--   respawntime,
--   ROUND(respawntime / 60) as respawn_minutes,
--   COUNT(*) as spawn_count
-- FROM spawn2
-- WHERE zone IN ('draniksewersa', 'draniksewersb', 'draniksewersc',
--                'dranikcatacombsa', 'dranikcatacombsb', 'dranikcatacombsc',
--                'dranikhollowsa', 'dranikhollowsb', 'dranikhollowsc')
-- GROUP BY zone, respawntime
-- ORDER BY zone;

-- Expected results after execution:
-- Sewers zones:     respawntime = 480 (8 minutes)
-- Catacombs zones:  respawntime = 720 (12 minutes)
-- Hollows zones:    respawntime = 1200 (20 minutes)
