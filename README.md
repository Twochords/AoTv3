# EQEmu Server Overlay

Custom content overlay for an [akk-stack](https://github.com/Akkadius/akk-stack) EQEmu server.

## What this repo tracks

| Path | Purpose |
|------|---------|
| `quests/` | Full PEQ quest tree + custom quest scripts |
| `plugins/` | Perl plugin library (`quests/plugins/`) |
| `sql/patches/` | Incremental DB patches (safe to commit) |
| `sql/rollback/` | Rollback SQL for each patch |
| `tools/` | Custom GM / admin utilities |
| `deploy/` | Deployment scripts |
| `docs/` | Server documentation |
| `config/` | Safe config templates (no secrets) |

## What this repo does NOT track

- `eqemu_config.json` (contains IPs, passwords — use `config/eqemu_config.example.json`)
- Docker volumes, DB dumps, binaries, logs
- `.env` files or any secrets

## Quick Start

### Apply overlay to a running akk-stack server

```bash
cd ~/eqemu-server-overlay
./deploy/backup-live.sh       # snapshot live quests first
./deploy/apply-overlay.sh     # push overlay content to live runtime
./deploy/verify-live.sh       # confirm world/login/zones are up
```

### Verify server health

```bash
./deploy/verify-live.sh
```

## Server Info

- **Container**: `akk-stack-eqemu-server-1`
- **Live quests**: `/home/eqemu/server/quests` (inside container)
- **Host mount**: `~/akk-stack/server/quests`
- **Spire admin**: `http://<server-ip>:3000`
- **Login port**: `5999`

## Adding a SQL patch

1. Create `sql/patches/YYYY-MM-DD_description.sql`
2. Create matching `sql/rollback/YYYY-MM-DD_description_rollback.sql`
3. Apply with:
   ```bash
   docker compose exec -T mariadb mysql -uroot -p<pass> peq < sql/patches/YYYY-MM-DD_description.sql
   ```

## Deploying to a new server

1. Install akk-stack per its README
2. Clone this repo: `git clone <url> ~/eqemu-server-overlay`
3. Copy `config/eqemu_config.example.json` → fill in real values → place at `~/akk-stack/server/eqemu_config.json`
4. Run `./deploy/apply-overlay.sh`
5. Restart: `cd ~/akk-stack && docker compose restart eqemu-server`

## Causeway Rebalance Hardening Notes

- Schema variance risk: EQEmu and PEQ forks may use different damage, AC, and avoidance column names. Run schema discovery first and adjust SQL explicitly.
- Rollback safety: rollback uses UPDATE JOIN instead of REPLACE INTO to preserve row identity and avoid delete and reinsert side effects.
- special_abilities sampling: Crushbone profile special abilities are sampled from first observed values and are approximate, not a true statistical mode.
- NO_SOURCE exclusion: high-level NO_SOURCE NPCs are intentionally excluded from apply phases to avoid unsourced transformations.
