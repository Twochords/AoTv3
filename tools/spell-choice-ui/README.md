# Spell Choice UI Contract

## Purpose
Client UI should submit only identifiers; all trust decisions remain server-side.

## Required Submit Payload
- pending_id
- nonce
- selected_spell_id

Equivalent command path:
#spellchoice pick <pending_id> <nonce> <selected_spell_id>

## Display Source
UI should render only server-provided choices tied to the active pending row.

## Validation Expectations
Server will reject requests when:
- nonce mismatch
- pending row not owned by character
- row expired or already claimed
- selected spell not in offered set
- replay for already-claimed level

## Integration Note
Do not send player-derived metadata (class, level, spell list) as authority inputs.