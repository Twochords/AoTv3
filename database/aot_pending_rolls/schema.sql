CREATE TABLE IF NOT EXISTS `aot_pending_rolls` (
    `char_id`  INT      UNSIGNED NOT NULL,
    `level`    TINYINT  UNSIGNED NOT NULL COMMENT 'Level slot 1-155',
    `spell_id` SMALLINT UNSIGNED NOT NULL COMMENT 'Offered packed AoT spell ID',
    PRIMARY KEY (`char_id`, `level`, `spell_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4
  COMMENT='Pending spell roll options per character per level slot';
