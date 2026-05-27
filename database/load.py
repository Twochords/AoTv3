#!/usr/bin/env python3
"""
load.py - Reset peq from PEQ archive, apply AoT content, clone to peq_ref.
WARNING: Destroys all unsaved changes in peq. Run 'make save' first.
Run via: make load
"""

import os
import sys
import subprocess

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
REPO_ROOT  = os.path.dirname(SCRIPT_DIR)
CACHE_DIR  = os.path.join(REPO_ROOT, '.devcontainer', 'cache', 'db', 'peq-dump')

DB_HOST = '127.0.0.1'
DB_PORT = 3306
DB_USER = 'peq'
DB_PASS = 'peqpass'

PEQ_SQL_FILES = [
    'create_tables_content.sql',
    'create_tables_login.sql',
    'create_tables_player.sql',
    'create_tables_state.sql',
    'create_tables_system.sql',
]


def run(cmd, cwd=None, check=True):
    print(f"  $ {cmd}")
    result = subprocess.run(cmd, shell=True, cwd=cwd, capture_output=True, text=True)
    if result.stdout.strip():
        print(f"    {result.stdout.strip()}")
    if result.returncode != 0:
        msg = result.stderr.strip() or f"exit code {result.returncode}"
        if check:
            print(f"  [ERROR] {msg}")
            sys.exit(result.returncode)
        else:
            print(f"  [WARN] {msg}")
    return result.returncode == 0


def main():
    print("=" * 60)
    print("  make load — AoTv3 database reset")
    print("=" * 60)
    print()
    print("This will:")
    print("  1. Pull latest from git (hard reset to origin/master)")
    print("  2. Reset peq database")
    print("  3. Load PEQ archive")
    print("  4. Clone peq -> peq_ref (vanilla baseline for save)")
    print("  5. Create custom table schemas")
    print("  6. Apply AoT content from database/")
    print()
    print("All unsaved peq changes will be LOST.")
    print("Run 'make save' first if you have changes to keep.")
    print()

    answer = input("Continue? [y/N] ").strip().lower()
    if answer != 'y':
        print("Aborted.")
        sys.exit(0)

    print("\n[1/6] Pulling latest from git...")
    run(f'git -C "{REPO_ROOT}" fetch origin')
    run(f'git -C "{REPO_ROOT}" reset --hard origin/master')

    print("\n[2/6] Resetting peq database...")
    run("sudo mariadb -e 'DROP DATABASE IF EXISTS peq;'")
    run("sudo mariadb -e 'CREATE DATABASE peq;'")
    run("sudo mariadb -e \"CREATE USER IF NOT EXISTS 'peq'@'127.0.0.1' IDENTIFIED BY 'peqpass';\"")
    run("sudo mariadb -e \"GRANT ALL PRIVILEGES ON *.* TO 'peq'@'127.0.0.1';\"")

    print("\n[3/6] Loading PEQ archive...")
    if not os.path.isdir(CACHE_DIR):
        print(f"\n[ERROR] PEQ dump not found at {CACHE_DIR}")
        print("        Run 'make inject-mariadb' once to download and cache the PEQ archive.")
        sys.exit(1)

    for sql_file in PEQ_SQL_FILES:
        path = os.path.join(CACHE_DIR, sql_file)
        if os.path.exists(path):
            run(f'sudo mariadb --database peq -e "source {path}"', cwd=CACHE_DIR)
        else:
            print(f"  [SKIP] {sql_file} not found")

    print("\n[4/6] Cloning peq -> peq_ref (vanilla baseline)...")
    run("sudo mariadb -e 'DROP DATABASE IF EXISTS peq_ref;'")
    run("sudo mariadb -e 'CREATE DATABASE peq_ref;'")
    run(
        f"sudo mysqldump -h{DB_HOST} -P{DB_PORT} -u{DB_USER} -p{DB_PASS} "
        f"--no-tablespaces peq | sudo mariadb peq_ref"
    )

    print("\n[5/6] Creating custom table schemas...")
    schema_files = sorted([
        os.path.join(SCRIPT_DIR, d, 'schema.sql')
        for d in os.listdir(SCRIPT_DIR)
        if os.path.isfile(os.path.join(SCRIPT_DIR, d, 'schema.sql'))
    ])
    if schema_files:
        for schema in schema_files:
            run(f'sudo mariadb --database peq < "{schema}"')
    else:
        print("  No schema.sql files found, skipping.")

    print("\n[6/6] Applying AoT content...")
    run(f'make -C "{SCRIPT_DIR}" inject')

    print("\n" + "=" * 60)
    print("  Load complete.")
    print("  peq_ref = vanilla PEQ baseline.")
    print("  Run 'make save' after making changes to commit them.")
    print("=" * 60)


if __name__ == '__main__':
    main()
