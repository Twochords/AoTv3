#include "zone/client.h"

void command_resetspells(Client *c, const Seperator *sep)
{
	Client *t = c;
	if (c->GetTarget() && c->GetTarget()->IsClient()) {
		t = c->GetTarget()->CastToClient();
	}

	const uint32 char_id = t->CharacterID();

	// Collect tiers before deleting so we can unscribe from the real spellbook.
	auto tier_results = database.QueryDatabase(
		fmt::format("SELECT `tier` FROM `aot_character_spells` WHERE `char_id`={}", char_id)
	);

	database.QueryDatabase(
		fmt::format("DELETE FROM `aot_character_spells` WHERE `char_id`={}", char_id)
	);
	database.QueryDatabase(
		fmt::format("DELETE FROM `aot_character_discovered` WHERE `char_id`={}", char_id)
	);

	// Unscribe each tier's slot from the real spellbook so the books stay in sync.
	if (tier_results.Success()) {
		for (auto row = tier_results.begin(); row != tier_results.end(); ++row) {
			t->UnscribeSpell(Strings::ToInt(row[0]) - 1);
		}
	}

	c->Message(
		Chat::Yellow,
		fmt::format(
			"Cleared all AoT spell rolls for {}. They may now reroll every tier.",
			c->GetTargetDescription(t)
		).c_str()
	);

	if (t != c) {
		t->Message(Chat::Yellow, "A GM has reset your spell book. You may reroll all tiers.");
	}
}
