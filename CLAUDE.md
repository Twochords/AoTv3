# EQEmu Dev Environment Notes

## On Container Rebuild or Restart

Run the following to build and start all server processes:

```sh
make shared
make login
make world
make zonex5
```

`make zonex5` starts 5 idle zone processes (required for instance booting).

## Devcontainer Network Configuration

When running inside the devcontainer, the EQ client runs on the Windows host and connects through Docker's port forwarding. Docker on Windows only proxies forwarded ports via `127.0.0.1`, **not** via the host's LAN IP (e.g. `192.168.0.x`).

Both fields in `build/bin/eqemu_config.json` under `server.world` must be `127.0.0.1`:

```json
"address": "127.0.0.1",
"localaddress": "127.0.0.1"
```

- `address` — used by zone servers when they register with the world server; the world server passes this to the EQ client as the zone endpoint
- `localaddress` — used by the login server's server list for clients on a private/RFC1918 address

If either is set to the LAN IP, the EQ client will be told to connect to an address it cannot reach and zoning/login will silently fail.

## Zone Instance Booting

Instances require idle zone processes. The world server's `TriggerBootup` looks for a zone process with `zone_id=0` (idle). Without spare zones, instance boots silently fail and the player is redirected to the non-instanced zone.

Start at least 5 idle zone processes alongside the normal ones. **Must `cd` to `build/bin` first** — zone reads `eqemu_config.json` from its working directory and silently fails if it can't find it:

```sh
for i in 1 2 3 4 5; do
  (cd /src/build/bin && /src/build/bin/zone >> /src/build/bin/logs/zone/idle_$i.log 2>&1) &
  sleep 1
done
```

If a zone gets stuck during `#reload quest` (log shows "Attempting to reload" with no completion), kill that zone PID and start a replacement idle zone with the command above. If a character is stuck on loading screen, move them to a safe zone via DB:

```sql
UPDATE character_data SET zone_id=344, zone_instance=0, x=0, y=0, z=0 WHERE name='CharName';
```

Then restart all zones (all idle counts drop to 0) and reboot 5 fresh ones.

## Zone Port Drift

Zone processes must land on ports **7000–7007** (the only UDP ports forwarded from host to container). If zones drift above 7007 (visible via `ss -tulpn | grep 70`), players will get stuck on loading screens because the EQ client can't reach the zone port.

**Cause:** the world server increments its port counter every time a zone registers. Rapid kill/restart cycles push the counter past 7007.

**Fix — full reset:**

```sh
# Kill everything except loginserver
kill $(pgrep zone) 2>/dev/null
kill $(pgrep -f "\./world") 2>/dev/null
sleep 2

# Restart world then idle zones
cd /src/build/bin
./world >> logs/world.log 2>&1 &
sleep 3
for i in 1 2 3 4 5; do
  (cd /src/build/bin && /src/build/bin/zone >> logs/zone/idle_$i.log 2>&1) &
  sleep 1
done
```

Verify ports are back in range:

```sh
for pid in $(pgrep zone); do
  port=$(ss -tulpn 2>/dev/null | grep "pid=$pid," | grep -oP ':\K[0-9]+' | head -1)
  echo "PID $pid → port $port"
done
```

All zones should show 7000–7007. If any show higher, repeat the reset.

## Restarting Servers

**Always rebuild shared memory after any item DB change**, then restart zones. Zones load item data (names, materials, visuals) from a shared memory binary at startup — DB changes are invisible until shared memory is rebuilt.

```sh
cd /src/build/bin
/src/build/bin/shared_memory   # rebuilds shared/items from DB
```

Then do a full world+zone restart (see Zone Port Drift section). `shared_memory` must complete (EXIT:0) before zones start or they load stale data.

Always use the full binary path when starting from outside `build/bin` (the `/src/zone` source directory shadows `./zone`):

```sh
cd /src/build/bin
./loginserver &
./world &
/src/build/bin/zone &
```

Logs land in `build/bin/logs/`. The current world/zone PIDs can be found with:

```sh
ps aux | grep -E "\./world|\./zone" | grep -v grep
```

## Quest Script Reloading

Quest scripts live in `.devcontainer/repo/quests/` which is bind-mounted to `build/bin/quests/` — file saves are immediately live in the running zone. To reload without a zone restart use `#reload quest` in-game (GM command). If a zone hangs on reload, kill its PID and start a replacement idle zone.

Key global scripts:
- `global/global_npc.lua` — fires `event_spawn` for every NPC in every zone; contains OoW loot filtering and progressive dungeon NPC scaling
- `global/global_player.lua` — fires player events; contains progression dungeon task completion and item grants
- `lua_modules/progressive_dungeons.lua` — shared module for the PD system (tier tracking, expedition entry, `eq.set_data` tier storage)
- `draniksscar/302093.lua` — Instance Recruiter NPC; entry point for players choosing a PD tier

## Custom Systems

### Progressive Dungeons (PD)

Tasks 990201–990217, DZ templates 1000–1016. Players speak to the Instance Recruiter (NPC 302093) in Dranik's Scar, pick a tier (1–65), and get a random dungeon from 17 classic zones. On entry, `enter_dungeon()` stores the tier in `eq.set_data('pd_inst_<instance_id>_tier', ...)` so `global_npc.lua` can read it at NPC spawn time.

**NPC scaling (in `global_npc.lua`):** all mobs in a PD instance are capped at `tier + 1` level with proportional stat scaling. Loot, faction, spells, and special abilities are stripped entirely.

**Dungeon zones:** blackburrow, befallen, crushbone, runnyeye, soldunga, guktop, gukbottom, dalnir, crystal, frozenshadow, mistmoore, chardok, sebilis, charasis, citymist, akheva, sseru

**Item 990002** — Dungeon Progression Token: `nodrop=1, norent=1` (tradeable, persistent). Granted on task completion.

### Omens of War Loot Filtering

`global_npc.lua` strips non-tradeskill, non-quest loot from all trash NPCs (name starts with `a_` / `an_`) in OoW zones at spawn time. Named NPCs are untouched. Results cached per item ID for the zone process lifetime. OoW zone IDs: 6, 25, 35, 37–42, 77–83, 91–94, 161, 299, 315, 429.

### Custom Blacksmithing System

Migration: `/src/sql/blacksmithing/050_custom_blacksmithing.sql`

All original blacksmithing recipes (`tradeskill=63`) were removed and replaced with a 4-tier independent crafting system. Maximum Blacksmithing skill = **200**.

#### ID Allocations

| Type | Range | Notes |
|------|-------|-------|
| Items (T1) | 147500–147547 | Mats 147500–147506, 147509; patterns 147505 (cloth), 147507 (leather), 147508 (mail), 147519 (plate); intermediates 147510–147518; armor 147520–147546 |
| Items (T2) | 147548–147591 | Drops/patterns 147548–147558, intermediates 147559–147567, armor 147568–147591 |
| Items (T3) | 147592–147635 | Drops/patterns 147592–147602, intermediates 147603–147611, armor 147612–147635 |
| Items (T4) | 147636–147679 | Drops/patterns 147636–147646, intermediates 147647–147655, armor 147656–147679 |
| Recipes (T1) | 31167–31200 | 34 recipes (10 refinement/intermediate, 24 armor — 6 slots, no boots) |
| Recipes (T2) | 31201–31234 | 34 recipes |
| Recipes (T3) | 31235–31268 | 34 recipes |
| Recipes (T4) | 31269–31302 | 34 recipes |
| Lootdrops | 992001–992029 | T1: 992001–992007; T2: 992009–992015; T3: 992016–992022; T4: 992023–992029 |
| Loottables | 111003–111006 | One per tier (111001–111002 deprecated/empty) |
| NPC types | 998018–998022 | T1 drop source NPCs (legacy, not zone-placed) |

#### Migration Files

| File | Contents |
|------|---------|
| `sql/blacksmithing/050_custom_blacksmithing.sql` | T1 stat corrections + T1 recipes + T1 entries |
| `sql/blacksmithing/051_blacksmithing_t2_reinforced.sql` | T2 items + recipes + entries |
| `sql/blacksmithing/052_blacksmithing_t3_tempered.sql` | T3 items + recipes + entries |
| `sql/blacksmithing/053_blacksmithing_t4_ascendant.sql` | T4 items + recipes + entries |
| `sql/20260605_dranik_service_npcs.sql` | Service NPCs 760136–760140 |
| `sql/20260605_tradeskill_vendor.sql` | Merchant list 1000023 + item prices (sellrate=1.0 required) |
| `sql/20260605_tradeskill_loot_tables.sql` | All tier lootdrops/loottables + NPC zone assignments |
| `sql/20260605_fix_patterns.sql` | Split T1 into 4 patterns; fix sellrate; rebuild merchant list |
| `sql/20260605_fix_icons.sql` | Correct icons on all custom items (raws, catalysts, intermediates, patterns) |

#### Tradeskill Constants

- `tradeskill=63` — Blacksmithing (SkillBlacksmithing in EQEmu source)
- Forge containers: 17760 (New Tanaan Forge), 54253 (Small Forge), 54258 (Coldain Forge), 66625 (Ak'Anon Forge)
- Pattern `salvagecount=1` — returned to player on failed armor combines
- Merchant items require `sellrate=1.0` in `items` table or they display as free (price × sellrate)
- Forge recipe list is sorted by trivial ascending — change in `zone/client_packet.cpp` both `Handle_OP_TradeSkillCombine` and `Handle_OP_RecipesSearch` queries (`ORDER BY tr.trivial ASC` before `LIMIT`)

#### System Design Rules

- **4 independent tiers:** No component from one tier may be used in another.
- **Each tier has:** unique drops, unique catalysts, unique patterns, unique intermediates, unique armor combines.
- **Slot weight formula** (N = component count in armor combine): Bracer=1, Hands=1, Head=2, Arms=2, Legs=3, Chest/Robe=4.
- **Armor combine formula:**
  - Cloth/Leather: N× component + 1× pattern (salvages on fail) + 1× catalyst → armor
  - Mail/Plate: N× component + 1× pattern (salvages on fail) → armor

#### Crafting Chains

**Cloth** (all tiers):
`2× raw fiber + 1× thread → bolt → (2× bolt) → padding → (N× padding + pattern + thread) → armor`

**Leather** (all tiers):
`2× raw hide + 1× solution → sheet → (2× sheet) → panel → (N× panel + pattern + solution) → armor`

**Mail** (all tiers):
`2× raw fragment + 1× flux → bar → (1× bar) → 6× rings → (6× rings) → bundle → (N× bundle + pattern) → armor`

**Plate** (all tiers):
`2× raw ore + 1× flux → bar → (2× bar) → sheet → (2× sheet) → section → (N× section + pattern) → armor`

Mail and Plate share the same refined bar and flux within each tier.

#### Tier Material Names

| Tier | Cloth fiber | Cloth thread | Leather hide | Leather solution | Metal flux | Mail ore | Plate ore |
|------|------------|-------------|-------------|-----------------|-----------|---------|---------|
| T1 Weathered | Torn Fiber Scrap | Weak Binding Thread | Raw Hide Scrap | Basic Tanning Solution | Minor Tempering Flux | Rusted Metal Bit | Cracked Ore Chunk |
| T2 Reinforced | Coarse Fiber Bundle | Coarse Linen Thread | Thick Animal Pelt | Moderate Tanning Solution | Standard Tempering Flux | Iron-Laced Ore Fragment | Dense Iron Ore |
| T3 Tempered | Fine Silk Fibers | Strong Silk Thread | Supple Drake Hide | Superior Tanning Solution | High-Grade Tempering Flux | Steel-Veined Ore Shard | High-Grade Ore Block |
| T4 Ascendant | Enchanted Fiber Bundle | Enchanted Binding Thread | Pristine Drake Hide | Mystic Tanning Solution | Prime Celestial Flux | Mithril Ore Shard | Adamantite Ore Block |

| Tier | Cloth bolt | Cloth padding | Leather sheet | Leather panel | Metal bar | Rings | Chain bundle | Metal sheet | Plate section |
|------|-----------|--------------|--------------|--------------|----------|-------|-------------|------------|--------------|
| T1 | Bolt of Woven Cloth | Cloth Padding | Cured Leather Sheet | Leather Panel | Crude Refined Bar | Small Metal Ring | Weathered Chain Bundle | Rough Metal Sheet | Rough Plate Section |
| T2 | Bolt of Coarse Linen | Reinforced Cloth Pad | Hardened Leather Sheet | Reinforced Leather Panel | Tempered Iron Bar | Iron Ring | Reinforced Chain Bundle | Tempered Iron Sheet | Tempered Plate Section |
| T3 | Bolt of Fine Silk | Silk-Quilted Pad | Tempered Leather Sheet | Tempered Leather Panel | Steel Alloy Bar | Steel Ring | Tempered Chain Bundle | Steel Metal Sheet | Hardened Plate Section |
| T4 | Bolt of Enchanted Silk | Arcane Cloth Padding | Ascendant Leather Sheet | Ascendant Leather Panel | Ascendant Refined Bar | Mithril Ring | Ascendant Chain Bundle | Mithril Sheet | Ascendant Plate Section |

#### Patterns (16 total — one per tier per armor type, nodrop/norent)

| Tier | Cloth | Leather | Mail | Plate |
|------|-------|---------|------|-------|
| T1 | Weathered Cloth Pattern | Weathered Leather Pattern | Weathered Mail Pattern | Weathered Plate Pattern |
| T2 | Reinforced Cloth Pattern | Reinforced Leather Pattern | Reinforced Mail Pattern | Reinforced Plate Pattern |
| T3 | Tempered Cloth Pattern | Tempered Leather Pattern | Tempered Mail Pattern | Tempered Plate Pattern |
| T4 | Ascendant Cloth Pattern | Ascendant Leather Pattern | Ascendant Mail Pattern | Ascendant Plate Pattern |

#### Armor Slot Names

| Type | Chest | Head | Legs | Arms | Hands | Bracers |
|------|-------|------|------|------|-------|---------|
| Cloth | Robe | Cap | Trousers | Sleeves | Gloves | Bracers |
| Leather | Vest | Cap | Pants | Sleeves | Gloves | Bracers |
| Mail | Hauberk | Coif | Leggings | Sleeves | Gloves | Bracers |
| Plate | Breastplate | Helm | Legplates | Vambraces | Gauntlets | Bracers |

#### Armor Stats — All Tiers

Stats double each tier (AC and all stats ×2 per tier).

**Plate** — STR / STA / AGI

| Slot | T1 Weathered | T2 Reinforced | T3 Tempered | T4 Ascendant |
|------|-------------|--------------|------------|-------------|
| Breastplate | 8 AC, STR 1, STA 2, AGI 1 | 16 AC, STR 2, STA 4, AGI 2 | 32 AC, STR 4, STA 8, AGI 4 | 64 AC, STR 8, STA 16, AGI 8 |
| Helm | 4 AC, STR 1, STA 2, AGI 1 | 8 AC, STR 2, STA 4, AGI 2 | 16 AC, STR 4, STA 8, AGI 4 | 32 AC, STR 8, STA 16, AGI 8 |
| Legplates | 6 AC, STR 1, STA 2, AGI 1 | 12 AC, STR 2, STA 4, AGI 2 | 24 AC, STR 4, STA 8, AGI 4 | 48 AC, STR 8, STA 16, AGI 8 |
| Vambraces | 6 AC, STR 1, STA 2, AGI 1 | 12 AC, STR 2, STA 4, AGI 2 | 24 AC, STR 4, STA 8, AGI 4 | 48 AC, STR 8, STA 16, AGI 8 |
| Gauntlets | 4 AC, STR 1, STA 2, AGI 1 | 8 AC, STR 2, STA 4, AGI 2 | 16 AC, STR 4, STA 8, AGI 4 | 32 AC, STR 8, STA 16, AGI 8 |
| Bracers | 2 AC, STR 1, STA 2, AGI 1 | 4 AC, STR 2, STA 4, AGI 2 | 8 AC, STR 4, STA 8, AGI 4 | 16 AC, STR 8, STA 16, AGI 8 |

**Mail** — STR / DEX / WIS / INT

| Slot | T1 Weathered | T2 Reinforced | T3 Tempered | T4 Ascendant |
|------|-------------|--------------|------------|-------------|
| Hauberk | 7 AC, STR 1, DEX 1, WIS 1, INT 1 | 14 AC, STR 2, DEX 2, WIS 2, INT 2 | 28 AC, STR 4, DEX 4, WIS 4, INT 4 | 56 AC, STR 8, DEX 8, WIS 8, INT 8 |
| Coif | 4 AC, STR 1, DEX 1, WIS 1, INT 1 | 8 AC, STR 2, DEX 2, WIS 2, INT 2 | 16 AC, STR 4, DEX 4, WIS 4, INT 4 | 32 AC, STR 8, DEX 8, WIS 8, INT 8 |
| Leggings | 4 AC, STR 1, DEX 1, WIS 1, INT 1 | 8 AC, STR 2, DEX 2, WIS 2, INT 2 | 16 AC, STR 4, DEX 4, WIS 4, INT 4 | 32 AC, STR 8, DEX 8, WIS 8, INT 8 |
| Sleeves | 4 AC, STR 1, DEX 1, WIS 1, INT 1 | 8 AC, STR 2, DEX 2, WIS 2, INT 2 | 16 AC, STR 4, DEX 4, WIS 4, INT 4 | 32 AC, STR 8, DEX 8, WIS 8, INT 8 |
| Gloves | 4 AC, STR 1, DEX 1, WIS 1, INT 1 | 8 AC, STR 2, DEX 2, WIS 2, INT 2 | 16 AC, STR 4, DEX 4, WIS 4, INT 4 | 32 AC, STR 8, DEX 8, WIS 8, INT 8 |
| Bracers | 2 AC, STR 1, DEX 1, WIS 1, INT 1 | 4 AC, STR 2, DEX 2, WIS 2, INT 2 | 8 AC, STR 4, DEX 4, WIS 4, INT 4 | 16 AC, STR 8, DEX 8, WIS 8, INT 8 |

**Leather** — DEX / AGI / CHA / INT

| Slot | T1 Weathered | T2 Reinforced | T3 Tempered | T4 Ascendant |
|------|-------------|--------------|------------|-------------|
| Vest | 5 AC, DEX 1, AGI 1, CHA 1, INT 1 | 10 AC, DEX 2, AGI 2, CHA 2, INT 2 | 20 AC, DEX 4, AGI 4, CHA 4, INT 4 | 40 AC, DEX 8, AGI 8, CHA 8, INT 8 |
| Cap | 3 AC, DEX 1, AGI 1, CHA 1, INT 1 | 6 AC, DEX 2, AGI 2, CHA 2, INT 2 | 12 AC, DEX 4, AGI 4, CHA 4, INT 4 | 24 AC, DEX 8, AGI 8, CHA 8, INT 8 |
| Pants | 4 AC, DEX 1, AGI 1, CHA 1, INT 1 | 8 AC, DEX 2, AGI 2, CHA 2, INT 2 | 16 AC, DEX 4, AGI 4, CHA 4, INT 4 | 32 AC, DEX 8, AGI 8, CHA 8, INT 8 |
| Sleeves | 4 AC, DEX 1, AGI 1, CHA 1, INT 1 | 8 AC, DEX 2, AGI 2, CHA 2, INT 2 | 16 AC, DEX 4, AGI 4, CHA 4, INT 4 | 32 AC, DEX 8, AGI 8, CHA 8, INT 8 |
| Gloves | 3 AC, DEX 1, AGI 1, CHA 1, INT 1 | 6 AC, DEX 2, AGI 2, CHA 2, INT 2 | 12 AC, DEX 4, AGI 4, CHA 4, INT 4 | 24 AC, DEX 8, AGI 8, CHA 8, INT 8 |
| Bracers | 1 AC, DEX 1, AGI 1, CHA 1, INT 1 | 2 AC, DEX 2, AGI 2, CHA 2, INT 2 | 4 AC, DEX 4, AGI 4, CHA 4, INT 4 | 8 AC, DEX 8, AGI 8, CHA 8, INT 8 |

**Cloth** — INT / WIS / CHA / STA

| Slot | T1 Weathered | T2 Reinforced | T3 Tempered | T4 Ascendant |
|------|-------------|--------------|------------|-------------|
| Robe | 4 AC, INT 1, WIS 1, CHA 1, STA 1 | 8 AC, INT 2, WIS 2, CHA 2, STA 2 | 16 AC, INT 4, WIS 4, CHA 4, STA 4 | 32 AC, INT 8, WIS 8, CHA 8, STA 8 |
| Cap | 2 AC, INT 1, WIS 1, CHA 1, STA 1 | 4 AC, INT 2, WIS 2, CHA 2, STA 2 | 8 AC, INT 4, WIS 4, CHA 4, STA 4 | 16 AC, INT 8, WIS 8, CHA 8, STA 8 |
| Trousers | 3 AC, INT 1, WIS 1, CHA 1, STA 1 | 6 AC, INT 2, WIS 2, CHA 2, STA 2 | 12 AC, INT 4, WIS 4, CHA 4, STA 4 | 24 AC, INT 8, WIS 8, CHA 8, STA 8 |
| Sleeves | 3 AC, INT 1, WIS 1, CHA 1, STA 1 | 6 AC, INT 2, WIS 2, CHA 2, STA 2 | 12 AC, INT 4, WIS 4, CHA 4, STA 4 | 24 AC, INT 8, WIS 8, CHA 8, STA 8 |
| Gloves | 3 AC, INT 1, WIS 1, CHA 1, STA 1 | 6 AC, INT 2, WIS 2, CHA 2, STA 2 | 12 AC, INT 4, WIS 4, CHA 4, STA 4 | 24 AC, INT 8, WIS 8, CHA 8, STA 8 |
| Bracers | 2 AC, INT 1, WIS 1, CHA 1, STA 1 | 4 AC, INT 2, WIS 2, CHA 2, STA 2 | 8 AC, INT 4, WIS 4, CHA 4, STA 4 | 16 AC, INT 8, WIS 8, CHA 8, STA 8 |

#### Trivial Progression

| Stage | T1 Weathered | T2 Reinforced | T3 Tempered | T4 Ascendant |
|-------|-------------|--------------|------------|-------------|
| First refinement (bar/bolt/sheet) | 25–30 | 75–80 | 115–120 | 145–150 |
| Intermediate components | 40–60 | 90–110 | 130–150 | 160–178 |
| Armor bracers/hands | 65 | 115 | 155 | 180 |
| Armor head/arms | 75 | 125 | 165 | 188 |
| Armor legs | 85 | 135 | 175 | 195 |
| Armor chest/robe | 100 | 145 | 185 | 200 |

Tier bands overlap deliberately: T2 refinement (75) becomes available before T1 chest is trivial (100).

#### Drop System

**Patterns are vendor-sold** — purchased from Tradeskill_Merchant (NPC 760140, merchant list 1000023) in Dranik's Scar. Prices: T1=5pp, T2=25pp each, T3=100pp each, T4=500pp each. Only raw mats and catalysts drop from mobs.

All mob drops: `nodrop=1, norent=1`, stackable. Named mobs (name not starting with `a_`/`an_`) keep their existing loottables. Drop rates: raw mats 15%, catalysts 10%.

##### Zone-Tier Loot Assignment

| Tier | Zones | Loottable ID |
|------|-------|-------------|
| T1 | Dranik's Scar (`draniksscar`), Nobles' Causeway (`causeway`) | 111003 |
| T2 | The Bloodfields (`bloodfields`), Ruined City of Dranik (`dranik`), Sewers of Dranik A/B/C (`draniksewersa/b/c`) | 111004 |
| T3 | Catacombs of Dranik A/B/C (`dranikcatacombsa/b/c`), Dranik's Hollows A/B/C (`dranikhollowsa/b/c`), Harbinger's Spire (`harbingers`) | 111005 |
| T4 | Wall of Slaughter (`wallofslaughter`), Riftseekers' Sanctum (`riftseekers`), Muramite Proving Grounds (`provinggrounds`, `chambersa-f`) | 111006 |

##### Lootdrop IDs

| ID | Item | Tier |
|----|------|------|
| 992001 | Torn Fiber Scrap (15%) | T1 |
| 992002 | Raw Hide Scrap (15%) | T1 |
| 992003 | Rusted Metal Bit (15%) | T1 |
| 992004 | Cracked Ore Chunk (15%) | T1 |
| 992005 | Weak Binding Thread (10%) | T1 |
| 992006 | Basic Tanning Solution (10%) | T1 |
| 992007 | Minor Tempering Flux (10%) | T1 |
| 992009 | Coarse Fiber Bundle (15%) | T2 |
| 992010 | Thick Animal Pelt (15%) | T2 |
| 992011 | Iron-Laced Ore Fragment (15%) | T2 |
| 992012 | Dense Iron Ore (15%) | T2 |
| 992013 | Coarse Linen Thread (10%) | T2 |
| 992014 | Moderate Tanning Solution (10%) | T2 |
| 992015 | Standard Tempering Flux (10%) | T2 |
| 992016 | Fine Silk Fibers (15%) | T3 |
| 992017 | Supple Drake Hide (15%) | T3 |
| 992018 | Steel-Veined Ore Shard (15%) | T3 |
| 992019 | High-Grade Ore Block (15%) | T3 |
| 992020 | Strong Silk Thread (10%) | T3 |
| 992021 | Superior Tanning Solution (10%) | T3 |
| 992022 | High-Grade Tempering Flux (10%) | T3 |
| 992023 | Enchanted Fiber Bundle (15%) | T4 |
| 992024 | Pristine Drake Hide (15%) | T4 |
| 992025 | Mithril Ore Shard (15%) | T4 |
| 992026 | Adamantite Ore Block (15%) | T4 |
| 992027 | Enchanted Binding Thread (10%) | T4 |
| 992028 | Mystic Tanning Solution (10%) | T4 |
| 992029 | Prime Celestial Flux (10%) | T4 |

##### Service NPCs (Dranik's Scar)

| NPC ID | Name | Lastname (label) | Class | Merchant ID | Notes |
|--------|------|-----------------|-------|-------------|-------|
| 760136 | Dranik_Banker | Banker | 40 | — | Banking works via class=40, no merchant list needed |
| 760137 | Satchel_Merchant | Satchel Merchant | 41 | 1000024 | 6 bags/containers |
| 760138 | Parcel_Courier | Parcels and General Supplies | 41 | 1000025 | 3 basic supplies; lastname triggers parcel UI tab |
| 760139 | General_Merchant | General Supplies | 41 | 1000026 | 11 items: food, water, bandages, arrows, bags, sewing kit |
| 760140 | Tradeskill_Merchant | Tradeskill Supplies | 41 | 1000023 | 16 patterns (all tiers) |

All modeled after An_Emberwatch_Guard (NPC 998038): race=413, size=9, 100k HP, level 48.

**Merchant pricing note:** items must have `sellrate=1.0` in the `items` table or they display as free.

#### Item Icons

All icons sourced from matching vanilla EQ tradeskill items. `shared_memory` must be rebuilt after any icon change.

| Category | Icon ID | Source item |
|----------|---------|-------------|
| Cloth/fiber raw mats (all tiers) | 782 | Spiderling Silk |
| Leather hide T1 | 553 | Low Quality Rockhopper Hide |
| Leather hide T2 | 552 | Mist Wolf Pelt |
| Leather hide T3 | 680 | Ruined Feran Hide |
| Leather hide T4 | 835 | Arctic Wyvern Hide |
| Mail ore T1–T2 | 1031 | Metal Bits |
| Mail ore T3 / Plate ore T1–T2 | 1135 | Block of Ore / Iron Ore |
| Mail ore T4 / Plate ore T3–T4 | 1138 | Block of High Quality Ore |
| Thread T1–T3 | 853 | Silk Thread |
| Thread T4 | 1140 | Spool of Sacred Coldain Thread |
| Tanning solution T1–T3 | 706 | Tanning Chemicals |
| Tanning solution T4 | 1159 | Nalasrine's Enforcing Tanning Solution |
| Flux/powder (all tiers) | 1075 | Binding Powder |
| Patterns (all 16) | 504 | Ancient Pattern |
| Cloth bolts + padding (all tiers) | 823 | Silk Swatch |
| Leather sheets + panels (all tiers) | 554 | High Quality Bear Skin |
| Metal bars/sheets/sections T1–T2 | 1135 | Block of Ore |
| Metal bars/sheets/sections T3–T4 | 1138 | Block of High Quality Ore |
| Rings (all tiers) | 1031 | Metal Bits |
| Chain bundles (all tiers) | 572 | Air Arachnid Silk String |

#### Cloth Robe Visual

Item 147521 (Weathered Cloth Robe): `idfile=IT63, material=13` — Oracle Robe appearance. All other cloth pieces use `material=16`. Leather pieces `material=1`, Mail `material=2`, Plate `material=3`.

#### Item Counts

- 35 drop items (raw mats + catalysts across 4 tiers; patterns are vendor-sold)
- 36 refinement intermediates
- 96 finished armor pieces (4 types × 6 slots × 4 tiers)
- 152 total recipes (38 per tier)

### Custom Weapon Smithing System

Migration files: `/src/sql/weaponsmithing/`

All weapon smithing combines use a dedicated in-world forge. Shares the Blacksmithing skill (tradeskill=63, max 200) with the armor system. All items have `nodrop=0, norent=0, reqlevel=0` — freely tradeable with no level restriction.

#### Forge

| Field | Value |
|-------|-------|
| World object ID | 228457 (placed in Dranik's Scar at -290, 1625, -251) |
| Container item ID | 147680 (Weapon Smith Forge) |
| Recipe container field | `item_id=147680` in `tradeskill_recipe_entries` |

The forge object uses `itemid=147680` and `type=17` in the `object` table. All weapon smithing recipe entries reference `item_id=147680` with `iscontainer=1`. Do not use any other forge container for weapon smithing recipes.

#### Service NPC

| NPC ID | Name | Lastname | Merchant ID | Location |
|--------|------|----------|-------------|----------|
| 760141 | Weapon_Molds_Merchant | Weapon Molds | 1000027 | draniksscar (-278, 1618, -247) |

Sells all 64 molds (56 weapon + 4 shield + 4 bow) at prices matching the armor pattern system: T1=5pp, T2=25pp, T3=100pp, T4=500pp. Items require `sellrate=1.0` in `items` table or display as free.

#### ID Allocations

| Type | Range | Notes |
|------|-------|-------|
| Drop items | 147681–147696 | 4 per tier × 4 tiers (shard, handle, haft, focus stone) |
| Weapon molds | 147700–147755 | 14 weapon types × 4 tiers |
| Intermediates | 147760–147771 | 3 per tier × 4 tiers (billet, blank, staff core) |
| Finished weapons | 147800–147855 | 14 weapon types × 4 tiers |
| Shield molds | 147856–147859 | 1 per tier |
| Shields | 147860–147863 | 1 per tier |
| Bow molds | 147864–147867 | 1 per tier |
| Bows | 147868–147871 | 1 per tier |
| Recipes (weapons) | 31303–31370 | 17 per tier × 4 tiers |
| Recipes (shields) | 31371–31374 | 1 per tier |
| Recipes (bows) | 31375–31378 | 1 per tier |
| Lootdrops | 992030–992048 | 4 per tier × 4 tiers (gaps between tiers) |
| Loottables | 111003–111006 | Shared with armor smithing — weapon drops appended |

#### Migration Files

| File | Contents |
|------|---------|
| `sql/20260605_weapon_smith_forge.sql` | Forge world object placement in Dranik's Scar |
| `sql/20260605_weapon_molds_merchant.sql` | NPC 760141 + spawn in draniksscar |
| `sql/weaponsmithing/050_ws_t1_weathered.sql` | T1 items + recipes + entries |
| `sql/weaponsmithing/051_ws_t2_reinforced.sql` | T2 items + recipes + entries |
| `sql/weaponsmithing/052_ws_t3_tempered.sql` | T3 items + recipes + entries |
| `sql/weaponsmithing/053_ws_t4_ascendant.sql` | T4 items + recipes + entries |
| `sql/weaponsmithing/054_ws_loot_tables.sql` | Lootdrop groups + loottable_entries |
| `sql/weaponsmithing/055_ws_merchant.sql` | Merchantlist 1000027 (56 weapon molds, slots 0–55) |
| `sql/weaponsmithing/056_ws_shields.sql` | Shield items, recipes, molds (slots 56–59) |
| `sql/weaponsmithing/057_ws_bows.sql` | Bow items, recipes, molds (slots 60–63) |

#### Shared Catalysts (same items as armor smithing)

| Tier | Item | Item ID |
|------|------|---------|
| T1 | Minor Tempering Flux | 147506 |
| T2 | Standard Tempering Flux | 147554 |
| T3 | High-Grade Tempering Flux | 147598 |
| T4 | Prime Celestial Flux | 147642 |

Thread-based armor catalysts (Weak Binding Thread, etc.) are not used in weapon smithing.

#### Crafting Chains

**Metal weapons (all 1H, 2H, shields):**
`2× Metal Shard + Flux → Weapon Billet → 2× Billet → Weapon Blank → [N× Blank] + [Handle/Haft] + Mold (salvage) + Flux → weapon`

**Staff (wood-based):**
`3× Weapon Haft + Flux → Staff Core → Staff Core + Focus Stone + Staff Mold (salvage) + Flux → Staff`

**Shield:** `2× Blank + Handle + Shield Mold (salvage) + Flux → Shield`

**Bow:** `3× Blank + 2× Haft/Shaft + Bow Mold (salvage) + Flux → Bow`

#### Recipe Cost by Weapon Category

| Category | Blanks | Handle/Haft | Examples |
|----------|--------|-------------|---------|
| Small 1H | 1× | 1× Handle | Dagger, Short Sword, Club, Mace |
| Hafted 1H Piercing | 1× | 1× Haft | Spear |
| Medium 1H | 2× | 1× Handle | Long Sword, Scimitar, Hammer |
| Hafted medium 1H | 2× | 1× Haft | Axe |
| Shield | 2× | 1× Handle | Shield |
| 2H bladed | 3× | 2× Haft | 2H Sword, 2H Axe, Halberd, Bow |
| 2H blunt | 3× | 2× Handle | Two Handed Hammer |
| Staff | — | 3× Haft | Staff (uses Staff Core + Focus Stone instead of Blank) |

Molds always `salvagecount=1` — returned to player on failed combine.

#### Weapon Types and Stats

**1H Slashing** (itemtype=0, slots=24576)

| Weapon | Stats | Delay |
|--------|-------|-------|
| Long Sword | STR / DEX | 22 |
| Short Sword | STR / DEX | 18 |
| Scimitar | DEX / WIS | 20 |
| Axe | STR / STA | 22 |

**1H Blunt** (itemtype=3, slots=24576)

| Weapon | Stats | Delay |
|--------|-------|-------|
| Mace | STR / WIS | 24 |
| Hammer | STR / STA | 26 |
| Club | STA / WIS | 18 |

**1H Piercing** (itemtype=2, slots=24576)

| Weapon | Stats | Delay |
|--------|-------|-------|
| Dagger | DEX / AGI | 16 |
| Spear | STR / DEX | 19 |

**2H Slashing** (itemtype=1, slots=8192)

| Weapon | Stats | Delay |
|--------|-------|-------|
| Two Handed Sword | STR / DEX / STA | 30 |
| Two Handed Axe | STR / STA (×2 scale) | 32 |
| Halberd | STR / DEX / AGI | 34 |

**2H Blunt** (itemtype=4, slots=8192)

| Weapon | Stats | Delay |
|--------|-------|-------|
| Two Handed Hammer | STR / STA / AGI | 36 |
| Staff | INT / WIS / MANA | 28 |

**Shield** (itemtype=8, slots=16384)

| Tier | AC | STA | AGI |
|------|-----|-----|-----|
| T1 Weathered | 30 | +1 | +1 |
| T2 Reinforced | 60 | +2 | +2 |
| T3 Tempered | 90 | +4 | +4 |
| T4 Ascendant | 120 | +8 | +8 |

**Bow** (itemtype=5, slots=2048, delay=45 all tiers)

| Tier | Damage | DEX | AGI |
|------|--------|-----|-----|
| T1 Weathered | 45 | +1 | +1 |
| T2 Reinforced | 90 | +2 | +2 |
| T3 Tempered | 135 | +4 | +4 |
| T4 Ascendant | 180 | +8 | +8 |

#### Damage Model

**1H weapons:** damage = delay × ratio

| Tier | Ratio | Example (delay 22) |
|------|-------|-------------------|
| T1 Weathered | 0.5:1 | 11 dmg / 22 delay |
| T2 Reinforced | 1:1 | 22 dmg / 22 delay |
| T3 Tempered | 1.5:1 | 33 dmg / 22 delay |
| T4 Ascendant | 2:1 | 44 dmg / 22 delay |

**2H weapons and bows:** damage = delay × ratio

| Tier | Ratio | Example (delay 30 / bow delay 45) |
|------|-------|----------------------------------|
| T1 Weathered | 1:1 | 30 dmg / 30 delay |
| T2 Reinforced | 2:1 | 60 dmg / 30 delay |
| T3 Tempered | 3:1 | 90 dmg / 30 delay |
| T4 Ascendant | 4:1 | 120 dmg / 30 delay |

#### Stat Scaling

All weapon stats scale: T1=1×, T2=2×, T3=4×, T4=8×. Staff MANA bonus scales separately: T1=+5, T2=+10, T3=+20, T4=+40. Two Handed Axe uses 2 stats at double base values (STR+2/STA+2 at T1) to compensate for fewer stat slots.

#### Trivial Progression

Weapons unlock roughly every 4–6 skill points through each tier. By skill 50 in T1, 12 of 17 weapon recipes are accessible.

| Recipe | T1 | T2 | T3 | T4 |
|--------|----|----|----|----|
| Weapon Billet | 10 | 62 | 118 | 158 |
| Weapon Blank / Staff Core | 20 | 72 | 128 | 168 |
| Dagger | 28 | 82 | 138 | 175 |
| Short Sword | 30 | 84 | 140 | 177 |
| Club | 32 | 86 | 142 | 179 |
| Mace | 34 | 88 | 144 | 181 |
| Spear | 36 | 90 | 146 | 183 |
| Long Sword | 42 | 96 | 150 | 186 |
| Scimitar | 44 | 98 | 152 | 188 |
| Axe | 46 | 100 | 154 | 190 |
| Hammer | 48 | 102 | 156 | 192 |
| Shield | 50 | 104 | 157 | 193 |
| 2H Sword | 53 | 108 | 160 | 194 |
| 2H Axe | 55 | 110 | 162 | 195 |
| Halberd | 57 | 112 | 163 | 196 |
| Bow | 58 | 115 | 164 | 197 |
| 2H Hammer | 62 | 120 | 166 | 198 |
| Staff | 68 | 128 | 168 | 200 |

Tier bands overlap: T2 billet (62) becomes available before T1 Staff is trivial (68).

#### Drop System

Weapon drops added as separate lootdrop groups to the existing armor smithing loottables (111003–111006). NPCs roll each group independently — a single kill may drop armor materials, weapon materials, or catalysts, but typically nothing crafting-related.

All weapon drop items: `nodrop=0, norent=0`, stackable. Named mobs keep their existing loottables.

**Weapon-exclusive drops per tier:**

| Lootdrop ID | Item | Rate | Tier |
|-------------|------|------|------|
| 992030 | Weathered Metal Shard | 15% | T1 |
| 992031 | Splintered Weapon Handle | 10% | T1 |
| 992032 | Cracked Weapon Haft | 10% | T1 |
| 992033 | Dim Focus Stone | 5% | T1 |
| 992035 | Iron Weapon Fragment | 15% | T2 |
| 992036 | Rough Weapon Handle | 10% | T2 |
| 992037 | Sturdy Weapon Haft | 10% | T2 |
| 992038 | Glowing Focus Stone | 5% | T2 |
| 992040 | Steel Weapon Shard | 15% | T3 |
| 992041 | Balanced Weapon Handle | 10% | T3 |
| 992042 | Balanced Weapon Shaft | 10% | T3 |
| 992043 | Brilliant Focus Stone | 5% | T3 |
| 992045 | Ascendant Metal Shard | 15% | T4 |
| 992046 | Runed Weapon Handle | 10% | T4 |
| 992047 | Runed Weapon Shaft | 10% | T4 |
| 992048 | Radiant Focus Stone | 5% | T4 |

Focus Stones are only needed for Staff combines. They drop from all NPCs in the tier zone at 5%.

#### Tier Material Names

| Tier | Metal Shard | Handle | Haft/Shaft | Focus Stone | Flux (shared) |
|------|-------------|--------|------------|-------------|---------------|
| T1 | Weathered Metal Shard | Splintered Weapon Handle | Cracked Weapon Haft | Dim Focus Stone | Minor Tempering Flux |
| T2 | Iron Weapon Fragment | Rough Weapon Handle | Sturdy Weapon Haft | Glowing Focus Stone | Standard Tempering Flux |
| T3 | Steel Weapon Shard | Balanced Weapon Handle | Balanced Weapon Shaft | Brilliant Focus Stone | High-Grade Tempering Flux |
| T4 | Ascendant Metal Shard | Runed Weapon Handle | Runed Weapon Shaft | Radiant Focus Stone | Prime Celestial Flux |

| Tier | Billet | Blank | Staff Core |
|------|--------|-------|------------|
| T1 | Weathered Weapon Billet | Weathered Weapon Blank | Weathered Staff Core |
| T2 | Iron Weapon Billet | Iron Weapon Blank | Iron Staff Core |
| T3 | Steel Weapon Billet | Steel Weapon Blank | Steel Staff Core |
| T4 | Ascendant Weapon Billet | Ascendant Weapon Blank | Ascendant Staff Core |

#### Mold Naming Convention

`[Tier] [Weapon Name] Mold` — e.g. `Weathered Long Sword Mold`, `Ascendant Shield Mold`.

Weapon mold IDs within each tier follow weapon ordering: Long Sword (+0), Short Sword (+1), Scimitar (+2), Axe (+3), Mace (+4), Hammer (+5), Club (+6), Dagger (+7), Spear (+8), Two Handed Sword (+9), Two Handed Axe (+10), Two Handed Hammer (+11), Staff (+12), Halberd (+13). T1 base = 147700, T2 = 147714, T3 = 147728, T4 = 147742.

#### Item Counts

- 16 weapon-exclusive drop items (4 per tier)
- 64 molds (56 weapon + 4 shield + 4 bow, vendor-sold)
- 12 crafted intermediates (billet, blank, staff core × 4 tiers)
- 60 finished weapons (14 weapon types × 4 tiers)
- 4 shields, 4 bows
- 78 total recipes

## Ports (devcontainer.json)

The following UDP ports are forwarded from host → container:

| Port | Process |
|------|---------|
| 5998/5999 | Login server |
| 7000–7007 | Zone servers |
| 9000/9001 | World server |
