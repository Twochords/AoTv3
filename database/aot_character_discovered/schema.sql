CREATE TABLE IF NOT EXISTS `aot_character_discovered` (
    `char_id`    INT      UNSIGNED NOT NULL,
    `spell_id`   SMALLINT UNSIGNED NOT NULL COMMENT 'Packed AoT spell ID',
    `first_seen` DATETIME          NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`char_id`, `spell_id`),
    INDEX `idx_char` (`char_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4
  COMMENT='All spells ever rolled by a character (Discovered tab source)';
