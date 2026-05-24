# Riftseekers Sanctum Classic Rebalance

## Scope
This package captures the reverse-progression rebalance for Riftseekers Sanctum and the associated respawn normalization/rollback overlays.

Included SQL artifacts:
- `sql/reverse-progression/riftseekers_classic_rebalance.sql`
- `sql/reverse-progression/riftseekers_respawn_normalization.sql`
- `sql/reverse-progression/riftseekers_rollback.sql`

## Intent
- Restore classic-era progression pressure in Riftseekers content.
- Normalize respawn timing where reverse-progression drift introduced inconsistencies.
- Preserve rollback safety with explicit restore SQL.

## Notes
- This overlay is SQL-only and does not include runtime/server files.
- Use rollback SQL if post-deploy validation finds regressions.
