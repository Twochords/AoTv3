#include "zone/client.h"

void command_aotrebirth(Client *c, const Seperator *sep)
{
	Client *t = c;
	if (c->GetTarget() && c->GetTarget()->IsClient()) {
		t = c->GetTarget()->CastToClient();
	}

	t->AoTRebirth();

	if (t != c) {
		c->Message(
			Chat::Yellow,
			fmt::format("Triggered AoT rebirth for {}.", c->GetTargetDescription(t)).c_str()
		);
	}
}
