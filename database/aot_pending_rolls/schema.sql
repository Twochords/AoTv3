CREATE TABLE IF NOT EXISTS `aot_pending_rolls` (
    `char_id`  INT      UNSIGNED NOT NULL,
    `tier`     TINYINT  UNSIGNED NOT NULL COMMENT 'Tier 1-31',
    `spell_id` SMALLINT UNSIGNED NOT NULL COMMENT 'Offered packed AoT spell ID',
    PRIMARY KEY (`char_id`, `tier`, `spell_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4
  COMMENT='Pending spell roll options per character per tier';
