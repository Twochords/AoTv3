-- Purpose: Phase 00 schema discovery and compatibility gate.
-- Execution order: 00 -> 01 -> 02 -> 02_5 -> 03 -> 04 -> 05 -> 06 -> 07 -> 08 -> 09
-- Schema compatibility note:
-- Common PEQ/EQEmu variants differ in column names:
--   Variant A: mindmg/maxdmg, AC, Avoidance
--   Variant B: min_dmg/max_dmg, ac, avoidance
-- Validate your schema here and adjust later phase scripts explicitly before apply/rollback.

USE peq;

SELECT COLUMN_NAME
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE()
  AND TABLE_NAME =  npc_types
  AND COLUMN_NAME IN (
    id,name,level,hp,
    mindmg,maxdmg,min_dmg,max_dmg,
    AC,ac,Avoidance,avoidance,
    MR,FR,CR,DR,PR,
    STR,STA,DEX,AGI,_INT,WIS,CHA,
    mana,attack_count,attack_speed,accuracy,runspeed,
    see_invis,see_invis_undead,see_hide,see_improved_hide,
    special_abilities,npc_spells_id,exp_mod
  )
ORDER BY COLUMN_NAME;

DESCRIBE npc_types;
DESCRIBE spawn2;
DESCRIBE zone;
