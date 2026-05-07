#!/usr/bin/env bash
# apply-overlay.sh — push overlay quests/plugins into live akk-stack runtime
# Usage: ./deploy/apply-overlay.sh [--no-backup]
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OVERLAY_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
CONTAINER="akk-stack-eqemu-server-1"
AKK_DIR="${AKK_DIR:-$HOME/akk-stack}"
LIVE_QUESTS_HOST="$AKK_DIR/server/quests"
LIVE_QUESTS_CONTAINER="/home/eqemu/server/quests"
NO_BACKUP=false

for arg in "$@"; do
  [[ "$arg" == "--no-backup" ]] && NO_BACKUP=true
done

echo "=== EQEmu Overlay Apply ==="
echo "Overlay root: $OVERLAY_ROOT"
echo "AKK dir:      $AKK_DIR"
echo "Container:    $CONTAINER"

# Confirm container is running
if ! docker inspect "$CONTAINER" --format '{{.State.Status}}' 2>/dev/null | grep -q running; then
  echo "ERROR: Container $CONTAINER is not running. Start it first:"
  echo "  cd $AKK_DIR && docker compose up -d"
  exit 1
fi

# Step 1: backup first (unless skipped)
if [[ "$NO_BACKUP" == false ]]; then
  echo "--- Creating backup before apply ---"
  bash "$SCRIPT_DIR/backup-live.sh" "pre-apply-$(date +%Y%m%d_%H%M%S)"
fi

# Step 2: sync quests (host mount — no docker cp needed)
echo "--- Syncing quests to live host mount ---"
rsync -a --delete \
  --exclude="*.log" \
  --exclude="*.pid" \
  "$OVERLAY_ROOT/quests/" \
  "$LIVE_QUESTS_HOST/"
echo "  quests synced: $(find "$LIVE_QUESTS_HOST" -type f | wc -l) files"

# Step 3: sync plugins
echo "--- Syncing plugins to live host mount ---"
rsync -a --delete \
  "$OVERLAY_ROOT/plugins/" \
  "$LIVE_QUESTS_HOST/plugins/"
echo "  plugins synced: $(find "$LIVE_QUESTS_HOST/plugins" -type f | wc -l) files"

# Step 4: signal the zone processes to reload Perl (hotreload)
echo "--- Reloading quest scripts inside container ---"
docker exec "$CONTAINER" bash -c \
  'cd /home/eqemu/server && pgrep -x zone > /dev/null && \
   echo "#reloadquest" | nc -q1 -u 127.0.0.1 9000 2>/dev/null || true'

echo "=== APPLY COMPLETE ==="
echo "Run ./deploy/verify-live.sh to confirm server health."
