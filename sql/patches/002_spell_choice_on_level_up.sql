-- Spell choice on level up
-- Creates server-authoritative storage for one-of-three spell choice flow.
-- DO NOT apply automatically from this repo step; review and run manually later.

CREATE TABLE IF NOT EXISTS spell_choices_pending (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  character_id INT UNSIGNED NOT NULL,
  level TINYINT UNSIGNED NOT NULL,
  spell_id_1 INT UNSIGNED NOT NULL,
  spell_id_2 INT UNSIGNED NOT NULL,
  spell_id_3 INT UNSIGNED NOT NULL,
  nonce VARCHAR(64) NOT NULL,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  expires_at DATETIME NOT NULL,
  claimed_at DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (id),
  KEY idx_pending_character_level (character_id, level),
  KEY idx_pending_active_window (character_id, level, claimed_at, expires_at),
  KEY idx_pending_nonce (nonce),
  UNIQUE KEY uq_pending_nonce_character (character_id, nonce)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS spell_choices_history (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  character_id INT UNSIGNED NOT NULL,
  level TINYINT UNSIGNED NOT NULL,
  pending_id BIGINT UNSIGNED NOT NULL,
  selected_spell_id INT UNSIGNED NOT NULL,
  nonce VARCHAR(64) NOT NULL,
  claimed_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY uq_history_character_level (character_id, level),
  KEY idx_history_character_claimed (character_id, claimed_at),
  KEY idx_history_pending (pending_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS spell_choices_blacklist (
  spell_id INT UNSIGNED NOT NULL,
  reason VARCHAR(255) NOT NULL,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (spell_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;