#!/usr/bin/env bash
# backup-live.sh — snapshot live quests/plugins before applying overlay
# Usage: ./deploy/backup-live.sh [backup-tag]
set -euo pipefail

CONTAINER="akk-stack-eqemu-server-1"
LIVE_QUESTS="/home/eqemu/server/quests"
AKK_DIR="${AKK_DIR:-$HOME/akk-stack}"
BACKUP_ROOT="${BACKUP_ROOT:-$HOME/eqemu-backups}"
TAG="${1:-$(date +%Y%m%d_%H%M%S)}"
DEST="$BACKUP_ROOT/$TAG"

echo "=== EQEmu Live Backup ==="
echo "Tag:       $TAG"
echo "Dest:      $DEST"
echo "Container: $CONTAINER"

# Confirm container is running
if ! docker inspect "$CONTAINER" --format '{{.State.Status}}' 2>/dev/null | grep -q running; then
  echo "ERROR: Container $CONTAINER is not running."
  exit 1
fi

mkdir -p "$DEST"

echo "--- Backing up quests from host mount ---"
# quests are volume-mounted at $AKK_DIR/server/quests
rsync -a \
  --exclude="*.log" \
  --exclude="*.pid" \
  "$AKK_DIR/server/quests/" \
  "$DEST/quests/"

echo "--- Backing up eqemu_config.json (sanitised path only) ---"
cp "$AKK_DIR/server/eqemu_config.json" "$DEST/eqemu_config.json.BACKUP" 2>/dev/null || true

echo "BACKUP COMPLETE: $DEST"
echo "  quests files: $(find "$DEST/quests" -type f | wc -l)"
