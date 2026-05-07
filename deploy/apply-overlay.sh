#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
AKK_STACK_DIR="${AKK_STACK_DIR:-$HOME/akk-stack}"
SERVICE="${EQEMU_SERVICE:-eqemu-server}"
LIVE_QUESTS_DIR="$AKK_STACK_DIR/server/quests"

pass() { echo "PASS: $*"; }
fail() { echo "FAIL: $*"; exit 1; }
info() { echo "INFO: $*"; }

[[ -d "$REPO_ROOT/.git" ]] || fail "Run from the overlay repo (git root not found)."
[[ -d "$REPO_ROOT/deploy" ]] || fail "Run from the overlay repo (deploy/ not found)."
[[ -d "$REPO_ROOT/quests" ]] || fail "Overlay quests directory missing"
[[ -d "$REPO_ROOT/plugins" ]] || fail "Overlay plugins directory missing"
[[ -d "$AKK_STACK_DIR" ]] || fail "akk-stack directory not found at $AKK_STACK_DIR"

cd "$AKK_STACK_DIR"
CID="$(docker compose ps -q "$SERVICE")"
[[ -n "$CID" ]] || fail "Service '$SERVICE' container not found"

state="$(docker inspect -f '{{.State.Status}}' "$CID")"
[[ "$state" == "running" ]] || fail "Service '$SERVICE' is not running (state=$state)"
pass "Detected running container for '$SERVICE'"

"$REPO_ROOT/deploy/backup-live.sh"

mkdir -p "$LIVE_QUESTS_DIR/plugins"
info "Syncing overlay quests to live quests (excluding plugins/log/temp files)"
rsync -a --delete \
  --exclude='plugins/' \
  --exclude='*.log' \
  --exclude='*.tmp' \
  --exclude='*.bak' \
  --exclude='*.pid' \
  "$REPO_ROOT/quests/" "$LIVE_QUESTS_DIR/"

info "Syncing overlay plugins to live plugins"
rsync -a --delete \
  --exclude='*.log' \
  --exclude='*.tmp' \
  --exclude='*.bak' \
  --exclude='*.pid' \
  "$REPO_ROOT/plugins/" "$LIVE_QUESTS_DIR/plugins/"

pass "Overlay content copied (quests/plugins only)"

if [[ -d "$REPO_ROOT/sql/patches" ]] && find "$REPO_ROOT/sql/patches" -maxdepth 1 -type f -name '*.sql' | grep -q .; then
  info "Applying SQL patches"
  "$REPO_ROOT/deploy/apply-sql-patches.sh"
else
  info "No SQL patches to apply"
fi

info "Restarting eqemu service '$SERVICE' cleanly"
docker compose restart "$SERVICE"
pass "Service restart requested"

"$REPO_ROOT/deploy/verify-live.sh"
pass "Overlay apply completed successfully"
