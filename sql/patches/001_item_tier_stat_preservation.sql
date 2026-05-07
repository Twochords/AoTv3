-- 001_item_tier_stat_preservation.sql
-- Full-item tier generator: Normal, Enlightened, Transcendent
-- Dry-run first by default. This script updates no rows when @DryRun = 1.
--
-- Deterministic ID strategy:
--   Normal       = base.id + 200000
--   Enlightened  = base.id + 400000
--   Transcendent = base.id + 600000
--
-- IMPORTANT:
--   Large item IDs (e.g. 900M+ offsets) can crash EQEmu shared_memory because
--   EQ::FixedMemoryHashSet uses direct-indexed storage by max item ID.
--   Keep generated IDs in a low range to avoid oversized allocation/segfaults.
--
-- Safety constraints:
--   * Excludes already-generated tier names from base eligibility.
--   * Excludes base IDs >= 200000.
--   * Skips row creation when target ID or target name already exists.
--   * Guards against target ID overflow based on items.id column type.
--   * Truncates base names to ensure final Name length never exceeds 64 chars.
--
-- Mode:
--   @DryRun = 1  -> no inserts, preview/metrics only
--   @DryRun = 0  -> perform inserts

SET @DryRun := 1;

SET @NormalOffset       := 200000;
SET @EnlightenedOffset  := 400000;
SET @TranscendentOffset := 600000;

SET @NormalNameSuffix       := ' [Normal]';
SET @EnlightenedNameSuffix  := ' [Enlightened]';
SET @TranscendentNameSuffix := ' [Transcendent]';

-- EQEmu/PEQ convention: nodrop=1 means tradeable, nodrop=0 means NO DROP.
SET @FLAG_TRADEABLE := 1;
SET @FLAG_NODROP    := 0;

SET @ALL_CLASSES := 65535;
SET @ALL_RACES   := 65535;

SET @db_name := DATABASE();
SET SESSION group_concat_max_len = 1024 * 1024;

-- Resolve max allowed ID from schema type.
SELECT
  CASE
    WHEN LOCATE('unsigned', LOWER(c.column_type)) > 0 THEN 4294967295
    ELSE 2147483647
  END
INTO @ItemIdMax
FROM information_schema.columns c
WHERE c.table_schema = @db_name
  AND c.table_name = 'items'
  AND c.column_name = 'id'
LIMIT 1;

-- Build reusable insert column list dynamically to preserve schema compatibility.
SELECT GROUP_CONCAT(CONCAT('`', c.column_name, '`') ORDER BY c.ordinal_position SEPARATOR ', ')
INTO @insert_cols
FROM information_schema.columns c
WHERE c.table_schema = @db_name
  AND c.table_name = 'items';

DROP TEMPORARY TABLE IF EXISTS tmp_eligible_base;
CREATE TEMPORARY TABLE tmp_eligible_base AS
SELECT
  i.id,
  i.`Name`
FROM items i
WHERE i.id < 200000
  AND i.`Name` IS NOT NULL
  AND TRIM(i.`Name`) <> ''
  AND i.`Name` NOT LIKE '%[Normal]%'
  AND i.`Name` NOT LIKE '%[Enlightened]%'
  AND i.`Name` NOT LIKE '%[Transcendent]%';

-- -------------------------
-- Pre-insert metrics
-- -------------------------
SET @before_total_items := (SELECT COUNT(*) FROM items);
SET @total_base_items   := (
  SELECT COUNT(*)
  FROM items i
  WHERE i.id < 200000
    AND i.`Name` IS NOT NULL
    AND TRIM(i.`Name`) <> ''
);
SET @eligible_base_items := (SELECT COUNT(*) FROM tmp_eligible_base);

SET @normal_projected := (
  SELECT COUNT(*)
  FROM tmp_eligible_base eb
  LEFT JOIN items idc
    ON idc.id = eb.id + @NormalOffset
  LEFT JOIN items namec
    ON namec.`Name` = CONCAT(LEFT(eb.`Name`, 64 - CHAR_LENGTH(@NormalNameSuffix)), @NormalNameSuffix)
  WHERE eb.id + @NormalOffset <= @ItemIdMax
    AND idc.id IS NULL
    AND namec.id IS NULL
);

SET @enlightened_projected := (
  SELECT COUNT(*)
  FROM tmp_eligible_base eb
  LEFT JOIN items idc
    ON idc.id = eb.id + @EnlightenedOffset
  LEFT JOIN items namec
    ON namec.`Name` = CONCAT(LEFT(eb.`Name`, 64 - CHAR_LENGTH(@EnlightenedNameSuffix)), @EnlightenedNameSuffix)
  WHERE eb.id + @EnlightenedOffset <= @ItemIdMax
    AND idc.id IS NULL
    AND namec.id IS NULL
);

SET @transcendent_projected := (
  SELECT COUNT(*)
  FROM tmp_eligible_base eb
  LEFT JOIN items idc
    ON idc.id = eb.id + @TranscendentOffset
  LEFT JOIN items namec
    ON namec.`Name` = CONCAT(LEFT(eb.`Name`, 64 - CHAR_LENGTH(@TranscendentNameSuffix)), @TranscendentNameSuffix)
  WHERE eb.id + @TranscendentOffset <= @ItemIdMax
    AND idc.id IS NULL
    AND namec.id IS NULL
);

SET @normal_collisions       := @eligible_base_items - @normal_projected;
SET @enlightened_collisions  := @eligible_base_items - @enlightened_projected;
SET @transcendent_collisions := @eligible_base_items - @transcendent_projected;
SET @collision_count         := @normal_collisions + @enlightened_collisions + @transcendent_collisions;

SET @projected_rows_to_create := @normal_projected + @enlightened_projected + @transcendent_projected;

-- -------------------------
-- Dry-run visibility
-- -------------------------
SELECT
  @DryRun AS dry_run_mode,
  @ItemIdMax AS item_id_max,
  @total_base_items AS total_base_items,
  @eligible_base_items AS eligible_base_items,
  @normal_projected AS projected_normal_rows,
  @enlightened_projected AS projected_enlightened_rows,
  @transcendent_projected AS projected_transcendent_rows,
  @projected_rows_to_create AS projected_rows_to_create,
  @collision_count AS collision_count_total;

SELECT
  eb.id AS base_id,
  eb.`Name` AS base_name,
  CHAR_LENGTH(eb.`Name`) AS base_name_len,
  CONCAT(LEFT(eb.`Name`, 64 - CHAR_LENGTH(@NormalNameSuffix)), @NormalNameSuffix) AS normal_name,
  CHAR_LENGTH(CONCAT(LEFT(eb.`Name`, 64 - CHAR_LENGTH(@NormalNameSuffix)), @NormalNameSuffix)) AS normal_name_len,
  CONCAT(LEFT(eb.`Name`, 64 - CHAR_LENGTH(@EnlightenedNameSuffix)), @EnlightenedNameSuffix) AS enlightened_name,
  CHAR_LENGTH(CONCAT(LEFT(eb.`Name`, 64 - CHAR_LENGTH(@EnlightenedNameSuffix)), @EnlightenedNameSuffix)) AS enlightened_name_len,
  CONCAT(LEFT(eb.`Name`, 64 - CHAR_LENGTH(@TranscendentNameSuffix)), @TranscendentNameSuffix) AS transcendent_name,
  CHAR_LENGTH(CONCAT(LEFT(eb.`Name`, 64 - CHAR_LENGTH(@TranscendentNameSuffix)), @TranscendentNameSuffix)) AS transcendent_name_len,
  eb.id + @NormalOffset AS projected_normal_id,
  eb.id + @EnlightenedOffset AS projected_enlightened_id,
  eb.id + @TranscendentOffset AS projected_transcendent_id,
  CASE WHEN eb.id + @NormalOffset > @ItemIdMax THEN 1 ELSE 0 END AS normal_overflow,
  CASE WHEN eb.id + @EnlightenedOffset > @ItemIdMax THEN 1 ELSE 0 END AS enlightened_overflow,
  CASE WHEN eb.id + @TranscendentOffset > @ItemIdMax THEN 1 ELSE 0 END AS transcendent_overflow,
  CASE WHEN idn.id IS NOT NULL OR namen.id IS NOT NULL THEN 1 ELSE 0 END AS normal_collision,
  CASE WHEN ide.id IS NOT NULL OR namee.id IS NOT NULL THEN 1 ELSE 0 END AS enlightened_collision,
  CASE WHEN idt.id IS NOT NULL OR namet.id IS NOT NULL THEN 1 ELSE 0 END AS transcendent_collision
FROM tmp_eligible_base eb
LEFT JOIN items idn
  ON idn.id = eb.id + @NormalOffset
LEFT JOIN items ide
  ON ide.id = eb.id + @EnlightenedOffset
LEFT JOIN items idt
  ON idt.id = eb.id + @TranscendentOffset
LEFT JOIN items namen
  ON namen.`Name` = CONCAT(LEFT(eb.`Name`, 64 - CHAR_LENGTH(@NormalNameSuffix)), @NormalNameSuffix)
LEFT JOIN items namee
  ON namee.`Name` = CONCAT(LEFT(eb.`Name`, 64 - CHAR_LENGTH(@EnlightenedNameSuffix)), @EnlightenedNameSuffix)
LEFT JOIN items namet
  ON namet.`Name` = CONCAT(LEFT(eb.`Name`, 64 - CHAR_LENGTH(@TranscendentNameSuffix)), @TranscendentNameSuffix)
ORDER BY eb.id
LIMIT 25;

-- -------------------------
-- Insert Normal tier
-- -------------------------
SELECT GROUP_CONCAT(
  CASE c.column_name
    WHEN 'id'        THEN CONCAT('base.`id` + ', @NormalOffset, ' AS `id`')
    WHEN 'Name'      THEN CONCAT('CONCAT(LEFT(base.`Name`, 64 - CHAR_LENGTH(''', @NormalNameSuffix, ''')), ''', @NormalNameSuffix, ''') AS `Name`')
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
  'JOIN tmp_eligible_base eb ON eb.`id` = base.`id` ',
  'LEFT JOIN `items` idc ON idc.`id` = base.`id` + ', @NormalOffset, ' ',
  'LEFT JOIN `items` namec ON namec.`Name` = CONCAT(LEFT(base.`Name`, 64 - CHAR_LENGTH(''', @NormalNameSuffix, ''')), ''', @NormalNameSuffix, ''') ',
  'WHERE ', @DryRun, ' = 0 ',
  'AND base.`id` + ', @NormalOffset, ' <= ', @ItemIdMax, ' ',
  'AND idc.`id` IS NULL ',
  'AND namec.`id` IS NULL'
);

PREPARE stmt_normal FROM @normal_sql;
EXECUTE stmt_normal;
SET @normal_inserted := ROW_COUNT();
DEALLOCATE PREPARE stmt_normal;

-- -------------------------
-- Insert Enlightened tier
-- -------------------------
SELECT GROUP_CONCAT(
  CASE c.column_name
    WHEN 'id'        THEN CONCAT('base.`id` + ', @EnlightenedOffset, ' AS `id`')
    WHEN 'Name'      THEN CONCAT('CONCAT(LEFT(base.`Name`, 64 - CHAR_LENGTH(''', @EnlightenedNameSuffix, ''')), ''', @EnlightenedNameSuffix, ''') AS `Name`')

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
  'JOIN tmp_eligible_base eb ON eb.`id` = base.`id` ',
  'LEFT JOIN `items` idc ON idc.`id` = base.`id` + ', @EnlightenedOffset, ' ',
  'LEFT JOIN `items` namec ON namec.`Name` = CONCAT(LEFT(base.`Name`, 64 - CHAR_LENGTH(''', @EnlightenedNameSuffix, ''')), ''', @EnlightenedNameSuffix, ''') ',
  'WHERE ', @DryRun, ' = 0 ',
  'AND base.`id` + ', @EnlightenedOffset, ' <= ', @ItemIdMax, ' ',
  'AND idc.`id` IS NULL ',
  'AND namec.`id` IS NULL'
);

PREPARE stmt_enlightened FROM @enlightened_sql;
EXECUTE stmt_enlightened;
SET @enlightened_inserted := ROW_COUNT();
DEALLOCATE PREPARE stmt_enlightened;

-- -------------------------
-- Insert Transcendent tier
-- -------------------------
SELECT GROUP_CONCAT(
  CASE c.column_name
    WHEN 'id'        THEN CONCAT('base.`id` + ', @TranscendentOffset, ' AS `id`')
    WHEN 'Name'      THEN CONCAT('CONCAT(LEFT(base.`Name`, 64 - CHAR_LENGTH(''', @TranscendentNameSuffix, ''')), ''', @TranscendentNameSuffix, ''') AS `Name`')

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
  'JOIN tmp_eligible_base eb ON eb.`id` = base.`id` ',
  'LEFT JOIN `items` idc ON idc.`id` = base.`id` + ', @TranscendentOffset, ' ',
  'LEFT JOIN `items` namec ON namec.`Name` = CONCAT(LEFT(base.`Name`, 64 - CHAR_LENGTH(''', @TranscendentNameSuffix, ''')), ''', @TranscendentNameSuffix, ''') ',
  'WHERE ', @DryRun, ' = 0 ',
  'AND base.`id` + ', @TranscendentOffset, ' <= ', @ItemIdMax, ' ',
  'AND idc.`id` IS NULL ',
  'AND namec.`id` IS NULL'
);

PREPARE stmt_transcendent FROM @transcendent_sql;
EXECUTE stmt_transcendent;
SET @transcendent_inserted := ROW_COUNT();
DEALLOCATE PREPARE stmt_transcendent;

-- -------------------------
-- Post-insert validation
-- -------------------------
SET @after_total_items := (SELECT COUNT(*) FROM items);
SET @rows_inserted_total := @after_total_items - @before_total_items;

SELECT
  @DryRun AS dry_run_mode,
  @before_total_items AS before_total_items,
  @after_total_items AS after_total_items,
  @rows_inserted_total AS rows_inserted_total,
  @normal_inserted AS normal_rows_inserted,
  @enlightened_inserted AS enlightened_rows_inserted,
  @transcendent_inserted AS transcendent_rows_inserted;

SELECT
  @total_base_items AS total_base_items,
  @eligible_base_items AS eligible_base_items,
  (SELECT COUNT(*) FROM tmp_eligible_base eb JOIN items i ON i.id = eb.id + @NormalOffset) AS normal_generated_count,
  (SELECT COUNT(*) FROM tmp_eligible_base eb JOIN items i ON i.id = eb.id + @EnlightenedOffset) AS enlightened_generated_count,
  (SELECT COUNT(*) FROM tmp_eligible_base eb JOIN items i ON i.id = eb.id + @TranscendentOffset) AS transcendent_generated_count,
  @collision_count AS collision_count;

SELECT
  eb.id AS base_id,
  b.`Name` AS base_name,
  CHAR_LENGTH(b.`Name`) AS base_name_len,
  n.id AS normal_id,
  n.`Name` AS normal_name,
  CHAR_LENGTH(n.`Name`) AS normal_name_len,
  e.id AS enlightened_id,
  e.`Name` AS enlightened_name,
  CHAR_LENGTH(e.`Name`) AS enlightened_name_len,
  t.id AS transcendent_id,
  t.`Name` AS transcendent_name,
  CHAR_LENGTH(t.`Name`) AS transcendent_name_len,
  b.ac AS base_ac,
  n.ac AS normal_ac,
  e.ac AS enlightened_ac,
  t.ac AS transcendent_ac,
  b.hp AS base_hp,
  n.hp AS normal_hp,
  e.hp AS enlightened_hp,
  t.hp AS transcendent_hp,
  b.heroic_str AS base_heroic_str,
  n.heroic_str AS normal_heroic_str,
  e.heroic_str AS enlightened_heroic_str,
  t.heroic_str AS transcendent_heroic_str
FROM tmp_eligible_base eb
JOIN items b ON b.id = eb.id
LEFT JOIN items n ON n.id = eb.id + @NormalOffset
LEFT JOIN items e ON e.id = eb.id + @EnlightenedOffset
LEFT JOIN items t ON t.id = eb.id + @TranscendentOffset
ORDER BY eb.id
LIMIT 25;
