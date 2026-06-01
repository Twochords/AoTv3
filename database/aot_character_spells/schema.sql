CREATE TABLE IF NOT EXISTS `aot_character_spells` (
    `char_id`  INT      UNSIGNED NOT NULL,
    `level`    TINYINT  UNSIGNED NOT NULL COMMENT 'Level slot 1-155',
    `spell_id` SMALLINT UNSIGNED NOT NULL COMMENT 'Currently assigned packed spell ID',
    PRIMARY KEY (`char_id`, `level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4
  COMMENT='Current rolled spell per character per level slot';
