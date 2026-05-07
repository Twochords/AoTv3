# SQL Patches

Place incremental database patch files here.

## Naming convention

```
YYYY-MM-DD_short-description.sql
```

## Example

```
2026-05-06_add_custom_item.sql
2026-05-06_add_custom_item_rollback.sql   ← place rollback in ../rollback/
```

## Apply a patch

```bash
cd ~/akk-stack
docker compose exec -T mariadb mysql -uroot -p<pass> peq < ~/eqemu-server-overlay/sql/patches/YYYY-MM-DD_name.sql
```

## Rules

- Each patch should be idempotent where possible (use `IF NOT EXISTS`, `INSERT IGNORE`, etc.)
- Always create a matching rollback file in `../rollback/`
- Never include account passwords or credentials in patches
