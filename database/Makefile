# AoTv3 database content injection and export
# inject: applies all tracked table content into peq
# export: dumps live peq content back to SQL files for committing
#
# Directory structure: database/<table_name>/<table_name>.sql
# To track a new table: mkdir database/<table_name> && make export-<table_name>

DB      := peq
MARIADB := sudo mariadb --database $(DB)
DUMP    := sudo mysqldump -h127.0.0.1 -P3306 -upeq -ppeqpass \
           --no-create-info --replace --skip-triggers --compact --no-tablespaces

# Auto-discover tracked tables from subdirectory names
TABLES := $(patsubst %/,%,$(wildcard */))

.PHONY: inject export

inject:
	@for table in $(TABLES); do \
		if [ -f "$$table/$$table.sql" ]; then \
			echo "  injecting $$table..."; \
			$(MARIADB) -e "source $$table/$$table.sql"; \
		fi; \
	done

export:
	@for table in $(TABLES); do \
		$(DUMP) $(DB) $$table > $$table/$$table.sql; \
		echo "  exported $$table"; \
	done
