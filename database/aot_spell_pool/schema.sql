CREATE TABLE IF NOT EXISTS `aot_spell_pool` (
    `spell_id`   SMALLINT UNSIGNED NOT NULL COMMENT 'Packed AoT spell ID (mastery=000)',
    `tier`       TINYINT  UNSIGNED NOT NULL COMMENT 'Tier number 1-31 (denorm from spell_id bits [12:8]+1)',
    `class_mask` INT      UNSIGNED NOT NULL DEFAULT 65535 COMMENT 'EQ class bitmask; 65535 = all classes',
    `enabled`    TINYINT(1)        NOT NULL DEFAULT 1,
    PRIMARY KEY (`spell_id`),
    INDEX `idx_tier_class` (`tier`, `class_mask`, `enabled`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4
  COMMENT='Roll pool: spells eligible to be randomly assigned per tier and class';
