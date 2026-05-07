#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
AKK_STACK_DIR="${AKK_STACK_DIR:-$HOME/akk-stack}"
PATCH_DIR="$REPO_ROOT/sql/patches"
DB_SERVICE="${DB_SERVICE:-mariadb}"
DB_NAME="${DB_NAME:-peq}"

pass() { echo "PASS: $*"; }
fail() { echo "FAIL: $*"; exit 1; }
info() { echo "INFO: $*"; }

[[ -d "$REPO_ROOT/.git" ]] || fail "Run from the overlay repo (git root not found)."
[[ -d "$REPO_ROOT/deploy" ]] || fail "Run from the overlay repo (deploy/ not found)."
[[ -d "$AKK_STACK_DIR" ]] || fail "akk-stack directory not found at $AKK_STACK_DIR"

if [[ ! -d "$PATCH_DIR" ]]; then
  pass "No sql/patches directory; nothing to apply."
  exit 0
fi

cd "$AKK_STACK_DIR"
if [[ -z "$(docker compose ps -q "$DB_SERVICE")" ]]; then
  fail "Database service '$DB_SERVICE' is not running under $AKK_STACK_DIR"
fi

db_exec() {
  local sql="$1"
  docker compose exec -T "$DB_SERVICE" sh -lc \
    'mysql -N -B -uroot -p"${MYSQL_ROOT_PASSWORD:-$MARIADB_ROOT_PASSWORD}" "$0"' \
    "$DB_NAME" <<< "$sql"
}

sql_escape() {
  sed "s/'/''/g"
}

info "Ensuring migration tracking table exists"
db_exec "
CREATE TABLE IF NOT EXISTS overlay_schema_migrations (
  filename VARCHAR(255) PRIMARY KEY,
  applied_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;
"

mapfile -t PATCH_FILES < <(find "$PATCH_DIR" -maxdepth 1 -type f -name '*.sql' | sort)
if [[ ${#PATCH_FILES[@]} -eq 0 ]]; then
  pass "No SQL patch files found in sql/patches"
  exit 0
fi

APPLIED_COUNT=0
SKIPPED_COUNT=0
for patch in "${PATCH_FILES[@]}"; do
  base="$(basename "$patch")"
  if [[ "$base" == *rollback* ]]; then
    info "Skipping rollback-named patch: $base"
    ((SKIPPED_COUNT+=1))
    continue
  fi

  esc_base="$(printf '%s' "$base" | sql_escape)"
  already="$(db_exec "SELECT 1 FROM overlay_schema_migrations WHERE filename='$esc_base' LIMIT 1;")"
  if [[ "$already" == "1" ]]; then
    info "Skipping already-applied patch: $base"
    ((SKIPPED_COUNT+=1))
    continue
  fi

  info "Applying patch: $base"
  docker compose exec -T "$DB_SERVICE" sh -lc \
    'mysql -uroot -p"${MYSQL_ROOT_PASSWORD:-$MARIADB_ROOT_PASSWORD}" "$0"' \
    "$DB_NAME" < "$patch"

  db_exec "INSERT INTO overlay_schema_migrations (filename) VALUES ('$esc_base');"
  ((APPLIED_COUNT+=1))
  pass "Applied patch: $base"
done

pass "SQL patching complete. Applied=$APPLIED_COUNT Skipped=$SKIPPED_COUNT"
