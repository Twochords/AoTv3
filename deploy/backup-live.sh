#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
AKK_STACK_DIR="${AKK_STACK_DIR:-$HOME/akk-stack}"
LIVE_QUESTS_DIR="$AKK_STACK_DIR/server/quests"
BACKUP_ROOT="$REPO_ROOT/backups"
STAMP="$(date +%Y%m%d_%H%M%S)"
DEST="$BACKUP_ROOT/$STAMP"

pass() { echo "PASS: $*"; }
fail() { echo "FAIL: $*"; exit 1; }
info() { echo "INFO: $*"; }

[[ -d "$REPO_ROOT/.git" ]] || fail "Run from the overlay repo (git root not found)."
[[ -d "$REPO_ROOT/deploy" ]] || fail "Run from the overlay repo (deploy/ not found)."
[[ -d "$AKK_STACK_DIR" ]] || fail "akk-stack directory not found at $AKK_STACK_DIR"
[[ -d "$LIVE_QUESTS_DIR" ]] || fail "Live quests directory not found at $LIVE_QUESTS_DIR"

mkdir -p "$BACKUP_ROOT"
[[ ! -e "$DEST" ]] || fail "Backup destination already exists: $DEST"
mkdir -p "$DEST"

info "Creating backup at $DEST"
mkdir -p "$DEST/quests" "$DEST/plugins"

rsync -a \
  --exclude='*.log' \
  --exclude='*.tmp' \
  --exclude='*.bak' \
  --exclude='*.pid' \
  "$LIVE_QUESTS_DIR/" "$DEST/quests/"

if [[ -d "$LIVE_QUESTS_DIR/plugins" ]]; then
  rsync -a \
    --exclude='*.log' \
    --exclude='*.tmp' \
    --exclude='*.bak' \
    --exclude='*.pid' \
    "$LIVE_QUESTS_DIR/plugins/" "$DEST/plugins/"
fi

pass "Backup completed: $DEST"
