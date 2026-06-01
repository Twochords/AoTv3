# Build:        make cmake, make build
# First-time:   make prep, make inject-mariadb, make maps
# Run server:   make shared, make login, make world, make zone
NAME := eqemu-server

.PHONY: cmake
cmake: is-vscode
	cmake -S . -B build -G Ninja \
		-DCMAKE_BUILD_TYPE=Debug \
		-DCMAKE_C_COMPILER_LAUNCHER=ccache \
		-DCMAKE_CXX_COMPILER_LAUNCHER=ccache \
		-DCMAKE_HAVE_LIBC_PTHREAD=1 \
		-DEQEMU_BUILD_TESTS=ON \
		-DEQEMU_BUILD_LOGIN=ON \
		-DEQEMU_BUILD_LUA=ON \
		-DEQEMU_BUILD_PERL=ON \
		-DEQEMU_BUILD_CLIENT_FILES=ON

.PHONY: build
build: is-vscode
	cmake --build build --parallel 4

.PHONY: prep
prep: is-vscode
	@echo "Preparing build/bin for usage..."

	@echo "Prepping folders..."
	@mkdir -p .devcontainer/override
	@mkdir -p .devcontainer/repo
	@mkdir -p .devcontainer/cache
	@mkdir -p build/bin/logs
	@mkdir -p build/bin/shared
	@mkdir -p build/bin/assets

	@echo "Applying overrides..."
	@if [ ! -f .devcontainer/override/eqemu_config.json ]; then cp .devcontainer/base/eqemu_config.json .devcontainer/override/eqemu_config.json; fi
	@rm -rf build/bin/eqemu_config.json
	cat .devcontainer/override/eqemu_config.json > build/bin/eqemu_config.json
	cat .devcontainer/override/eqemu_config.json > build/eqemu_config.json
	@if [ ! -f .devcontainer/override/login.json ]; then cp .devcontainer/base/login.json .devcontainer/override/login.json; fi
	@rm -rf build/bin/login.json
	cat .devcontainer/override/login.json > build/bin/login.json

	@echo "Cloning repositories..."
	@mkdir -p .devcontainer/repo
	if [ ! -f ".devcontainer/repo/quests/.git/HEAD" ]; then git clone https://github.com/ProjectEQ/projecteqquests.git .devcontainer/repo/quests; fi
	if [ ! -f ".devcontainer/repo/eqemu-definitions/.git/HEAD" ]; then git clone https://github.com/xackery/eqemu-definitions.git .devcontainer/repo/eqemu-definitions; fi
	if [ -z "$$(ls -A .devcontainer/repo/maps 2>/dev/null)" ]; then make maps; fi
	@mkdir -p .devcontainer/repo/quests/mods

	@echo "Applying base patches..."
	cp -R -u -p utils/patches .devcontainer/base/

	@echo "Applying build/bin links..."
	@if [ ! -L build/bin/lua_modules ]; then cd build/bin && ln -s quests/lua_modules lua_modules; fi
	@if [ ! -L build/bin/plugins ]; then cd build/bin && ln -s quests/plugins plugins; fi
	@if [ ! -L build/bin/mods ]; then cd build/bin && ln -s quests/mods mods; fi

	@echo "Eqemu is prepared. Edit build/bin/eqemu_config.json to configure."

is-vscode:
	@if [ -z "$$REMOTE_CONTAINERS" ]; then \
		echo "Not running in VS Code devcontainer"; \
		exit 1; \
	fi

clean: is-vscode
	rm -rf build

.PHONY: maps
maps: is-vscode
	@echo "Downloading maps..."
	@mkdir -p .devcontainer/repo/maps
	@cd .devcontainer/repo/maps && wget -nc https://github.com/EQEmu/maps/archive/refs/heads/master.zip
	@cd .devcontainer/repo/maps && unzip -o master.zip
	@cd .devcontainer/repo/maps && mv maps-master/* .
	@cd .devcontainer/repo/maps && rm -rf maps-master
	@echo "Maps downloaded."

.PHONY: test
test: is-vscode
	cd build/bin && ./tests

.PHONY: login
login: is-vscode check-mariadb
	cd build/bin && ./loginserver

.PHONY: hotfix
hotfix: shared

.PHONY: shared
shared: is-vscode check-mariadb
	cd build/bin && ./shared_memory

.PHONY: zone
zone: is-vscode check-mariadb
	@mkdir -p build/bin/logs/zone/
	@find build/bin/logs/zone/ -type f -name 'zone*.log' -exec rm -f {} +
	cd build/bin && ./zone

check-mariadb: is-vscode
	@if ! sudo service mariadb status | grep -q 'active (running)'; then \
		sudo service mariadb start; \
	fi

.PHONY: world
world: is-vscode check-mariadb
	@find build/bin/logs/ -type f -name 'world*.log' -exec rm -f {} +
	cd build/bin && ./world

.PHONY: spire
spire: is-vscode check-mariadb
	cd build && bin/spire

.PHONY: build-spire
build-spire: is-vscode
	@which npm || (curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash - && sudo apt-get install -y nodejs)
	cd spire/frontend && npm install && npm run build
	cd spire && go build -o ../build/bin/spire .

.PHONY: ucs
ucs: is-vscode check-mariadb
	@find build/bin/logs/ -type f -name 'ucs*.log' -exec rm -f {} +
	cd build/bin && ./ucs

.PHONY: queryserv
queryserv: is-vscode check-mariadb
	@find build/bin/logs/ -type f -name 'query_server*.log' -exec rm -f {} +
	cd build/bin && ./queryserv

# make save — saves database changes, commits and pushes to git.
#             Run before git pull or container rebuild.
.PHONY: save
save: is-vscode check-mariadb
	python3 database/save.py

# make load — pulls latest from git, rebuilds peq from PEQ archive + AoT content,
#             clones peq -> peq_ref as the new save baseline.
#             WARNING: destroys unsaved database changes. Run make save first.
.PHONY: load
load: is-vscode check-mariadb
	python3 database/load.py

reset-content:
	@echo "Resetting content tables in database peq..."
	cd .devcontainer/cache/db/peq-dump && sudo mariadb --database peq -e "source create_tables_content.sql"

valgrind-%: is-vscode
	cd build/bin && valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes --verbose --log-file=logs/$*.valgrind.log ./$*

.PHONY: mariadb
mariadb:
	@sudo service mariadb start

.PHONY: inject-mariadb
inject-mariadb:
	-sudo service mariadb start
	-mkdir -p .devcontainer/cache/db/
	-sudo mariadb -e 'DROP DATABASE IF EXISTS peq;'
	-sudo mariadb -e 'CREATE DATABASE peq;'
	-sudo mariadb -e "CREATE USER IF NOT EXISTS 'peq'@'127.0.0.1' IDENTIFIED BY 'peqpass';"
	-sudo mariadb -e "GRANT ALL PRIVILEGES ON *.* TO 'peq'@'127.0.0.1';"
ifeq (,$(wildcard .devcontainer/cache/db/db.sql.zip))
	@echo ".devcontainer/cache/db.sql.zip not found. Downloading database from https://db.eqemu.dev/latest"
	wget -nc https://db.eqemu.dev/latest -O .devcontainer/cache/db/db.sql.zip
	-cd .devcontainer/cache/db && unzip db.sql.zip
endif
	@echo "Sourcing db may take a while, please wait..."
	@cd .devcontainer/cache/db/peq-dump && sudo mariadb --database peq -e "source create_tables_content.sql"
	@cd .devcontainer/cache/db/peq-dump && sudo mariadb --database peq -e "source create_tables_login.sql"
	@cd .devcontainer/cache/db/peq-dump && sudo mariadb --database peq -e "source create_tables_player.sql"
	@cd .devcontainer/cache/db/peq-dump && sudo mariadb --database peq -e "source create_tables_state.sql"
	@cd .devcontainer/cache/db/peq-dump && sudo mariadb --database peq -e "source create_tables_system.sql"
	@echo "Injecting AoT content..."
	@$(MAKE) -C database inject
	@echo "MariaDB is now injected."

.PHONY: gm-%
gm-%: is-vscode
	sudo mariadb --database peq -e "UPDATE account SET status=255 WHERE name = '$*';"
	@echo "Account $* is now a GM. /camp to have it go into effect."

backup: is-vscode
	@mkdir -p build/bin/backup
	cd build/bin && ./world database:dump --compress --player-tables --state-tables --system-tables --query-serv-tables

restore-%: is-vscode
	@if [ -z "$*" ]; then \
		echo "Please provide a backup file to restore from. Example: make restore-backup.sql"; \
		exit 1; \
	fi
	@echo "Restoring from backup $*"
	@sudo mariadb --database peq -e "$*"

.PHONY: pull
pull:
	git pull
	@if [ ! -d "quests" ]; then git clone https://github.com/rebuildeq/quests.git quests; fi
	cd quests && git pull
	@if [ ! -d "eqemu-definitions" ]; then git clone https://github.com/xackery/eqemu-definitions.git eqemu-definitions; fi
	cd eqemu-definitions && git pull
