-- 001_item_tier_stat_preservation.sql
-- Idempotent item tier generator: Normal, Enlightened, Transcendent
-- Preserves all original item columns unless explicitly overridden by tier rules.
-- NOTE: This patch does not auto-run against live DB in this workflow.

-- =========================
-- Input IDs (edit as needed)
-- =========================
SET @BaseItemID          := 1000;
SET @NormalItemID        := 900001000;
SET @EnlightenedItemID   := 900001001;
SET @TranscendentItemID  := 900001002;

SET @NormalNameSuffix        := ' [Normal]';
SET @EnlightenedNameSuffix   := ' [Enlightened]';
SET @TranscendentNameSuffix  := ' [Transcendent]';

-- EQEmu/PEQ convention: nodrop=1 means tradeable, nodrop=0 means NO DROP.
SET @FLAG_TRADEABLE := 1;
SET @FLAG_NODROP    := 0;

SET @ALL_CLASSES := 65535;
SET @ALL_RACES   := 65535;

SET @db_name := DATABASE();
SET SESSION group_concat_max_len = 1024 * 1024;

-- Soft guard: if base item missing, inserts will no-op by WHERE clause.

-- Build reusable INSERT column list dynamically to preserve schema compatibility.
SELECT GROUP_CONCAT(CONCAT('`', c.column_name, '`') ORDER BY c.ordinal_position SEPARATOR ', ')
INTO @insert_cols
FROM information_schema.columns c
WHERE c.table_schema = @db_name
  AND c.table_name = 'items';

-- =========================
-- Normal tier (preserve base stats, unlock flags)
-- =========================
SELECT GROUP_CONCAT(
  CASE c.column_name
    WHEN 'id'        THEN CONCAT(@NormalItemID, ' AS `id`')
    WHEN 'Name'      THEN CONCAT('CONCAT(base.`Name`, ''', @NormalNameSuffix, ''') AS `Name`')
    WHEN 'loregroup' THEN '0 AS `loregroup`'
    WHEN 'nodrop'    THEN CONCAT(@FLAG_TRADEABLE, ' AS `nodrop`')
    WHEN 'classes'   THEN CONCAT(@ALL_CLASSES, ' AS `classes`')
    WHEN 'races'     THEN CONCAT(@ALL_RACES, ' AS `races`')
    WHEN 'procrate'  THEN '0 AS `procrate`'
    ELSE CONCAT('base.`', c.column_name, '` AS `', c.column_name, '`')
  END
  ORDER BY c.ordinal_position
  SEPARATOR ', '
)
INTO @normal_select
FROM information_schema.columns c
WHERE c.table_schema = @db_name
  AND c.table_name = 'items';

SET @normal_sql = CONCAT(
  'INSERT INTO `items` (', @insert_cols, ') ',
  'SELECT ', @normal_select, ' ',
  'FROM `items` base ',
  'WHERE base.`id` = ', @BaseItemID, ' ',
  'AND NOT EXISTS (SELECT 1 FROM `items` i WHERE i.`id` = ', @NormalItemID, ')'
);

PREPARE stmt_normal FROM @normal_sql;
EXECUTE stmt_normal;
DEALLOCATE PREPARE stmt_normal;

-- =========================
-- Enlightened tier
-- =========================
SELECT GROUP_CONCAT(
  CASE c.column_name
    WHEN 'id'        THEN CONCAT(@EnlightenedItemID, ' AS `id`')
    WHEN 'Name'      THEN CONCAT('CONCAT(base.`Name`, ''', @EnlightenedNameSuffix, ''') AS `Name`')

    -- Main stats doubled
    WHEN 'astr'      THEN 'COALESCE(base.`astr`,0) * 2 AS `astr`'
    WHEN 'asta'      THEN 'COALESCE(base.`asta`,0) * 2 AS `asta`'
    WHEN 'aagi'      THEN 'COALESCE(base.`aagi`,0) * 2 AS `aagi`'
    WHEN 'adex'      THEN 'COALESCE(base.`adex`,0) * 2 AS `adex`'
    WHEN 'awis'      THEN 'COALESCE(base.`awis`,0) * 2 AS `awis`'
    WHEN 'aint'      THEN 'COALESCE(base.`aint`,0) * 2 AS `aint`'
    WHEN 'acha'      THEN 'COALESCE(base.`acha`,0) * 2 AS `acha`'

    -- Resists doubled
    WHEN 'mr'        THEN 'COALESCE(base.`mr`,0) * 2 AS `mr`'
    WHEN 'fr'        THEN 'COALESCE(base.`fr`,0) * 2 AS `fr`'
    WHEN 'cr'        THEN 'COALESCE(base.`cr`,0) * 2 AS `cr`'
    WHEN 'dr'        THEN 'COALESCE(base.`dr`,0) * 2 AS `dr`'
    WHEN 'pr'        THEN 'COALESCE(base.`pr`,0) * 2 AS `pr`'

    -- AC/HP/Mana 1.5x floored
    WHEN 'ac'        THEN 'FLOOR(COALESCE(base.`ac`,0) * 1.5) AS `ac`'
    WHEN 'hp'        THEN 'FLOOR(COALESCE(base.`hp`,0) * 1.5) AS `hp`'
    WHEN 'mana'      THEN 'FLOOR(COALESCE(base.`mana`,0) * 1.5) AS `mana`'

    -- Weapon damage doubled only when > 0
    WHEN 'damage'    THEN 'CASE WHEN COALESCE(base.`damage`,0) > 0 THEN COALESCE(base.`damage`,0) * 2 ELSE COALESCE(base.`damage`,0) END AS `damage`'

    -- Secondary stats from final doubled stats
    WHEN 'spelldmg'  THEN 'FLOOR((COALESCE(base.`aint`,0) * 2) / 2) AS `spelldmg`'
    WHEN 'healamt'   THEN 'FLOOR((COALESCE(base.`awis`,0) * 2) / 2) AS `healamt`'
    WHEN 'accuracy'  THEN 'FLOOR((COALESCE(base.`astr`,0) * 2) / 10) AS `accuracy`'
    WHEN 'attack'    THEN 'FLOOR((COALESCE(base.`aagi`,0) * 2) / 10) + FLOOR((COALESCE(base.`adex`,0) * 2) / 10) AS `attack`'

    -- Preserve existing heroic stats exactly
    WHEN 'heroic_str' THEN 'COALESCE(base.`heroic_str`,0) AS `heroic_str`'
    WHEN 'heroic_sta' THEN 'COALESCE(base.`heroic_sta`,0) AS `heroic_sta`'
    WHEN 'heroic_agi' THEN 'COALESCE(base.`heroic_agi`,0) AS `heroic_agi`'
    WHEN 'heroic_dex' THEN 'COALESCE(base.`heroic_dex`,0) AS `heroic_dex`'
    WHEN 'heroic_wis' THEN 'COALESCE(base.`heroic_wis`,0) AS `heroic_wis`'
    WHEN 'heroic_int' THEN 'COALESCE(base.`heroic_int`,0) AS `heroic_int`'
    WHEN 'heroic_cha' THEN 'COALESCE(base.`heroic_cha`,0) AS `heroic_cha`'
    WHEN 'heroic_mr'  THEN 'COALESCE(base.`heroic_mr`,0) AS `heroic_mr`'
    WHEN 'heroic_fr'  THEN 'COALESCE(base.`heroic_fr`,0) AS `heroic_fr`'
    WHEN 'heroic_cr'  THEN 'COALESCE(base.`heroic_cr`,0) AS `heroic_cr`'
    WHEN 'heroic_dr'  THEN 'COALESCE(base.`heroic_dr`,0) AS `heroic_dr`'
    WHEN 'heroic_pr'  THEN 'COALESCE(base.`heroic_pr`,0) AS `heroic_pr`'

    -- Flags
    WHEN 'loregroup' THEN '0 AS `loregroup`'
    WHEN 'nodrop'    THEN CONCAT(@FLAG_TRADEABLE, ' AS `nodrop`')
    WHEN 'classes'   THEN CONCAT(@ALL_CLASSES, ' AS `classes`')
    WHEN 'races'     THEN CONCAT(@ALL_RACES, ' AS `races`')
    WHEN 'procrate'  THEN '10 AS `procrate`'

    ELSE CONCAT('base.`', c.column_name, '` AS `', c.column_name, '`')
  END
  ORDER BY c.ordinal_position
  SEPARATOR ', '
)
INTO @enlightened_select
FROM information_schema.columns c
WHERE c.table_schema = @db_name
  AND c.table_name = 'items';

SET @enlightened_sql = CONCAT(
  'INSERT INTO `items` (', @insert_cols, ') ',
  'SELECT ', @enlightened_select, ' ',
  'FROM `items` base ',
  'WHERE base.`id` = ', @BaseItemID, ' ',
  'AND NOT EXISTS (SELECT 1 FROM `items` i WHERE i.`id` = ', @EnlightenedItemID, ')'
);

PREPARE stmt_enlightened FROM @enlightened_sql;
EXECUTE stmt_enlightened;
DEALLOCATE PREPARE stmt_enlightened;

-- =========================
-- Transcendent tier
-- =========================
SELECT GROUP_CONCAT(
  CASE c.column_name
    WHEN 'id'        THEN CONCAT(@TranscendentItemID, ' AS `id`')
    WHEN 'Name'      THEN CONCAT('CONCAT(base.`Name`, ''', @TranscendentNameSuffix, ''') AS `Name`')

    -- Main stats doubled
    WHEN 'astr'      THEN 'COALESCE(base.`astr`,0) * 2 AS `astr`'
    WHEN 'asta'      THEN 'COALESCE(base.`asta`,0) * 2 AS `asta`'
    WHEN 'aagi'      THEN 'COALESCE(base.`aagi`,0) * 2 AS `aagi`'
    WHEN 'adex'      THEN 'COALESCE(base.`adex`,0) * 2 AS `adex`'
    WHEN 'awis'      THEN 'COALESCE(base.`awis`,0) * 2 AS `awis`'
    WHEN 'aint'      THEN 'COALESCE(base.`aint`,0) * 2 AS `aint`'
    WHEN 'acha'      THEN 'COALESCE(base.`acha`,0) * 2 AS `acha`'

    -- Resists doubled
    WHEN 'mr'        THEN 'COALESCE(base.`mr`,0) * 2 AS `mr`'
    WHEN 'fr'        THEN 'COALESCE(base.`fr`,0) * 2 AS `fr`'
    WHEN 'cr'        THEN 'COALESCE(base.`cr`,0) * 2 AS `cr`'
    WHEN 'dr'        THEN 'COALESCE(base.`dr`,0) * 2 AS `dr`'
    WHEN 'pr'        THEN 'COALESCE(base.`pr`,0) * 2 AS `pr`'

    -- AC/HP/Mana doubled
    WHEN 'ac'        THEN 'COALESCE(base.`ac`,0) * 2 AS `ac`'
    WHEN 'hp'        THEN 'COALESCE(base.`hp`,0) * 2 AS `hp`'
    WHEN 'mana'      THEN 'COALESCE(base.`mana`,0) * 2 AS `mana`'

    -- Weapon damage doubled only when > 0
    WHEN 'damage'    THEN 'CASE WHEN COALESCE(base.`damage`,0) > 0 THEN COALESCE(base.`damage`,0) * 2 ELSE COALESCE(base.`damage`,0) END AS `damage`'

    -- Secondary stats from final doubled stats
    WHEN 'spelldmg'  THEN 'COALESCE(base.`aint`,0) * 2 AS `spelldmg`'
    WHEN 'healamt'   THEN 'COALESCE(base.`awis`,0) * 2 AS `healamt`'
    WHEN 'accuracy'  THEN 'FLOOR((COALESCE(base.`astr`,0) * 2) / 10) AS `accuracy`'
    WHEN 'attack'    THEN 'FLOOR((COALESCE(base.`aagi`,0) * 2) / 10) + FLOOR((COALESCE(base.`adex`,0) * 2) / 10) AS `attack`'

    -- Preserve heroics + add 50% bonus from final doubled stats/resists
    WHEN 'heroic_str' THEN 'COALESCE(base.`heroic_str`,0) + FLOOR((COALESCE(base.`astr`,0) * 2) * 0.5) AS `heroic_str`'
    WHEN 'heroic_sta' THEN 'COALESCE(base.`heroic_sta`,0) + FLOOR((COALESCE(base.`asta`,0) * 2) * 0.5) AS `heroic_sta`'
    WHEN 'heroic_agi' THEN 'COALESCE(base.`heroic_agi`,0) + FLOOR((COALESCE(base.`aagi`,0) * 2) * 0.5) AS `heroic_agi`'
    WHEN 'heroic_dex' THEN 'COALESCE(base.`heroic_dex`,0) + FLOOR((COALESCE(base.`adex`,0) * 2) * 0.5) AS `heroic_dex`'
    WHEN 'heroic_wis' THEN 'COALESCE(base.`heroic_wis`,0) + FLOOR((COALESCE(base.`awis`,0) * 2) * 0.5) AS `heroic_wis`'
    WHEN 'heroic_int' THEN 'COALESCE(base.`heroic_int`,0) + FLOOR((COALESCE(base.`aint`,0) * 2) * 0.5) AS `heroic_int`'
    WHEN 'heroic_cha' THEN 'COALESCE(base.`heroic_cha`,0) + FLOOR((COALESCE(base.`acha`,0) * 2) * 0.5) AS `heroic_cha`'

    WHEN 'heroic_mr'  THEN 'COALESCE(base.`heroic_mr`,0) + FLOOR((COALESCE(base.`mr`,0) * 2) * 0.5) AS `heroic_mr`'
    WHEN 'heroic_fr'  THEN 'COALESCE(base.`heroic_fr`,0) + FLOOR((COALESCE(base.`fr`,0) * 2) * 0.5) AS `heroic_fr`'
    WHEN 'heroic_cr'  THEN 'COALESCE(base.`heroic_cr`,0) + FLOOR((COALESCE(base.`cr`,0) * 2) * 0.5) AS `heroic_cr`'
    WHEN 'heroic_dr'  THEN 'COALESCE(base.`heroic_dr`,0) + FLOOR((COALESCE(base.`dr`,0) * 2) * 0.5) AS `heroic_dr`'
    WHEN 'heroic_pr'  THEN 'COALESCE(base.`heroic_pr`,0) + FLOOR((COALESCE(base.`pr`,0) * 2) * 0.5) AS `heroic_pr`'

    -- Flags
    WHEN 'loregroup' THEN '-1 AS `loregroup`'
    WHEN 'nodrop'    THEN CONCAT(@FLAG_NODROP, ' AS `nodrop`')
    WHEN 'classes'   THEN CONCAT(@ALL_CLASSES, ' AS `classes`')
    WHEN 'races'     THEN CONCAT(@ALL_RACES, ' AS `races`')
    WHEN 'procrate'  THEN '20 AS `procrate`'

    ELSE CONCAT('base.`', c.column_name, '` AS `', c.column_name, '`')
  END
  ORDER BY c.ordinal_position
  SEPARATOR ', '
)
INTO @transcendent_select
FROM information_schema.columns c
WHERE c.table_schema = @db_name
  AND c.table_name = 'items';

SET @transcendent_sql = CONCAT(
  'INSERT INTO `items` (', @insert_cols, ') ',
  'SELECT ', @transcendent_select, ' ',
  'FROM `items` base ',
  'WHERE base.`id` = ', @BaseItemID, ' ',
  'AND NOT EXISTS (SELECT 1 FROM `items` i WHERE i.`id` = ', @TranscendentItemID, ')'
);

PREPARE stmt_transcendent FROM @transcendent_sql;
EXECUTE stmt_transcendent;
DEALLOCATE PREPARE stmt_transcendent;

-- =========================
-- Validation query (base vs tiers)
-- =========================
SELECT
  i.id,
  i.`Name` AS item_name,
  i.ac, i.hp, i.mana,
  i.astr AS str_stat,
  i.asta AS sta_stat,
  i.aagi AS agi_stat,
  i.adex AS dex_stat,
  i.awis AS wis_stat,
  i.aint AS int_stat,
  i.acha AS cha_stat,
  i.mr, i.fr, i.cr, i.dr, i.pr,
  i.heroic_str, i.heroic_sta, i.heroic_agi, i.heroic_dex, i.heroic_wis, i.heroic_int, i.heroic_cha,
  i.heroic_mr, i.heroic_fr, i.heroic_cr, i.heroic_dr, i.heroic_pr,
  i.attack, i.accuracy, i.spelldmg, i.healamt,
  i.loregroup,
  i.nodrop,
  i.classes,
  i.races,
  i.procrate
FROM items i
WHERE i.id IN (@BaseItemID, @NormalItemID, @EnlightenedItemID, @TranscendentItemID)
ORDER BY FIELD(i.id, @BaseItemID, @NormalItemID, @EnlightenedItemID, @TranscendentItemID);
