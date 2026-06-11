-- NPC 760145: Expedition Chest
-- race=378/class=62/bodytype=33 matches Anguish ornate chest appearance.
-- hp=1 so players can loot it immediately. Items added dynamically via lua
-- (npc:AddItem) in global_npc.lua event_spawn based on the active tier.
INSERT IGNORE INTO npc_types
  (id, name, race, class, bodytype, hp, mana, gender, texture, helmtexture, size,
   hp_regen_rate, mana_regen_rate, loottable_id, npc_spells_id, npc_faction_id,
   mindmg, maxdmg, attack_count, attack_delay, npcspecialattks, special_abilities,
   aggroradius, assistradius, npc_aggro, see_invis, see_invis_undead, qglobal,
   AC, skip_global_loot, trackable, untargetable, level)
VALUES
  (760145, 'Expedition_Chest', 378, 62, 33, 1, 0, 2, 3, 0, 6,
   0, 0, 0, 0, 0,
   0, 0, 0, 255, '', '',
   0, 0, 0, 0, 0, 0,
   0, 1, 0, 0, 1);
