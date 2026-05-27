CREATE TABLE IF NOT EXISTS `aot_character_spells` (
    `char_id`  INT      UNSIGNED NOT NULL,
    `tier`     TINYINT  UNSIGNED NOT NULL COMMENT 'Tier 1-31',
    `spell_id` SMALLINT UNSIGNED NOT NULL COMMENT 'Currently assigned packed spell ID',
    PRIMARY KEY (`char_id`, `tier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4
  COMMENT='Current rolled spell per character per tier';
