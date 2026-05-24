# Harbingers Spire Redesign

## design goals
- Deliver a classicized Harbingers progression pass through zone-scoped SQL overlays only.
- Keep canonical spawnentry npcID linkage clean.
- Exclude unrelated zones and non-content tables.

## level range
- Target encounter band: 18-25.

## classicization approach
- Restore intended NPC profiles for the Harbingers target set.
- Correct duplicate-name spawnentry rows to canonical npc_types IDs.
- Normalize respawn cadence to support classic pacing.

## Unrest-style rebalance philosophy
- Favor manageable pull chains over abrupt lethality spikes.
- Maintain pressure through cadence and density.
- Preserve recoverability and route readability.

## deployment order
1. sql/20260516_harbingers_rebalance.sql
2. sql/20260516_harbingers_spawn_changes.sql
3. sql/20260516_harbingers_canonical_npcids.sql
4. sql/20260516_harbingers_rollbacks.sql (rollback only)

## rollback instructions
- Execute sql/20260516_harbingers_rollbacks.sql.
- Rollback SQL embeds literal mappings/values and is portable.
- Run verification queries after rollback.
