#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
AKK_STACK_DIR="${AKK_STACK_DIR:-$HOME/akk-stack}"
SERVICE="${EQEMU_SERVICE:-eqemu-server}"
EXPECT_QUERYSERV="${EXPECT_QUERYSERV:-auto}"
CONFIG_PATH="$AKK_STACK_DIR/server/eqemu_config.json"

pass() { echo "PASS: $*"; }
fail() { echo "FAIL: $*"; exit 1; }
warn() { echo "WARN: $*"; }
info() { echo "INFO: $*"; }

[[ -d "$REPO_ROOT/.git" ]] || fail "Run from the overlay repo (git root not found)."
[[ -d "$REPO_ROOT/deploy" ]] || fail "Run from the overlay repo (deploy/ not found)."
[[ -d "$AKK_STACK_DIR" ]] || fail "akk-stack directory not found at $AKK_STACK_DIR"

cd "$AKK_STACK_DIR"
CID="$(docker compose ps -q "$SERVICE")"
[[ -n "$CID" ]] || fail "Service '$SERVICE' container not found"

state="$(docker inspect -f '{{.State.Status}}' "$CID")"
[[ "$state" == "running" ]] || fail "Container is not running (state=$state)"
pass "Container '$SERVICE' is running"

check_proc() {
  local proc="$1"
  if docker compose exec -T "$SERVICE" pgrep -x "$proc" >/dev/null 2>&1; then
    pass "$proc process is running"
    return 0
  fi
  return 1
}

check_proc world || fail "world process not running"
check_proc loginserver || fail "loginserver process not running"
check_proc ucs || fail "ucs process not running"

if [[ "$EXPECT_QUERYSERV" == "1" ]]; then
  check_proc queryserv || fail "queryserv expected but not running"
elif [[ "$EXPECT_QUERYSERV" == "0" ]]; then
  info "queryserv check disabled by EXPECT_QUERYSERV=0"
else
  if check_proc queryserv; then :; else warn "queryserv not running (EXPECT_QUERYSERV=auto)"; fi
fi

zone_count="$(docker compose exec -T "$SERVICE" sh -lc 'pgrep -x zone | wc -l')"
[[ "$zone_count" -ge 1 ]] || fail "No zone processes running"
pass "Zone processes running: $zone_count"

if docker compose exec -T "$SERVICE" sh -lc "ss -uln | awk 'NR>1{print \$5}' | grep -Eq '(^|:)9000$'"; then
  pass "UDP 9000 is listening"
else
  fail "UDP 9000 is not listening"
fi

if docker compose exec -T "$SERVICE" sh -lc "ss -uln | awk 'NR>1{print \$5}' | awk -F: '{print \$NF}' | awk '\$1 ~ /^[0-9]+$/ && \$1 >= 7000 && \$1 <= 7999 {found=1} END {exit found?0:1}'"; then
  pass "Zone UDP ports are listening (7000-7999)"
else
  fail "No listening zone UDP ports found in 7000-7999"
fi

[[ -f "$CONFIG_PATH" ]] || fail "eqemu_config.json not found at $CONFIG_PATH"
grep -Eq '"localaddress"[[:space:]]*:' "$CONFIG_PATH" || fail "eqemu_config.json missing localaddress"
pass "eqemu_config.json contains localaddress"

pass "Live verification complete"
