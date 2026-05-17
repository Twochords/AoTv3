-- Rollback for retrofit malformed npcspecialattks cleanup
-- Restores only npcspecialattks for the 17 approved IDs

USE peq;

UPDATE npc_types n
JOIN npc_types_backup_class45_attkflags_only_20260517 b ON b.id = n.id
SET n.npcspecialattks = b.npcspecialattks
WHERE n.id IN (
  302024, 302035, 302036, 302066,
  303019, 303041, 303042, 303052,
  303029, 303039, 303040, 303043,
  303044, 303045, 303053, 303086,
  303070
);

SELECT ROW_COUNT() AS rollback_rows;

SELECT id, name, npcspecialattks
FROM npc_types
WHERE id IN (
  302024, 302035, 302036, 302066,
  303019, 303041, 303042, 303052,
  303029, 303039, 303040, 303043,
  303044, 303045, 303053, 303086,
  303070
)
ORDER BY id;
