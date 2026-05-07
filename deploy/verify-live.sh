#!/usr/bin/env bash
# verify-live.sh — confirm EQEmu world/login/zones are running
# Usage: ./deploy/verify-live.sh
set -euo pipefail

CONTAINER="akk-stack-eqemu-server-1"
AKK_DIR="${AKK_DIR:-$HOME/akk-stack}"
PASS=true

echo "=== EQEmu Server Health Check ==="
echo "Container: $CONTAINER"
echo ""

# 1. Container running?
STATUS=$(docker inspect "$CONTAINER" --format '{{.State.Status}}' 2>/dev/null || echo "not_found")
if [[ "$STATUS" == "running" ]]; then
  echo "[PASS] Container $CONTAINER is running"
else
  echo "[FAIL] Container $CONTAINER status: $STATUS"
  PASS=false
fi

# 2. Key processes inside container
for PROC in world loginserver ucs queryserv; do
  if docker exec "$CONTAINER" pgrep -x "$PROC" > /dev/null 2>&1; then
    PID=$(docker exec "$CONTAINER" pgrep -x "$PROC" | head -1)
    echo "[PASS] $PROC running (PID $PID)"
  else
    echo "[FAIL] $PROC not running"
    PASS=false
  fi
done

# 3. Zone process count
ZONE_COUNT=$(docker exec "$CONTAINER" pgrep -x zone | wc -l || echo 0)
if [[ "$ZONE_COUNT" -gt 0 ]]; then
  echo "[PASS] zone processes running: $ZONE_COUNT"
else
  echo "[FAIL] No zone processes found"
  PASS=false
fi

# 4. Login port 5999 open (UDP — test with TCP as proxy)
if ss -tlnp 2>/dev/null | grep -q ':5999'; then
  echo "[PASS] Port 5999 listening"
elif docker exec "$CONTAINER" ss -ulnp 2>/dev/null | grep -q ':5999'; then
  echo "[PASS] Port 5999 listening (UDP inside container)"
else
  echo "[WARN] Port 5999 not detected (UDP may not show in ss)"
fi

# 5. Quest files present in live mount
QUEST_COUNT=$(find "$AKK_DIR/server/quests" -type f 2>/dev/null | wc -l || echo 0)
if [[ "$QUEST_COUNT" -gt 100 ]]; then
  echo "[PASS] Quest files in live mount: $QUEST_COUNT"
else
  echo "[FAIL] Too few quest files in live mount: $QUEST_COUNT"
  PASS=false
fi

echo ""
echo "=== Process summary (inside container) ==="
docker exec "$CONTAINER" ps aux | grep -E "world|loginserver|zone|ucs|queryserv|spire" | grep -v grep || true

echo ""
if [[ "$PASS" == true ]]; then
  echo "RESULT: PASS — Server appears healthy"
else
  echo "RESULT: FAIL — One or more checks failed (see above)"
  exit 1
fi
