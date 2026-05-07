# Spell Choice On Level Up

## Overview
This system gives each character one server-authoritative spell choice at each level:
- On level up, the server creates one pending row with three spell options.
- Player claims exactly one option.
- Server validates pending row, nonce, offered spell set, expiration, and replay state.
- Claimed result is persisted to history.

## Data Model
Patch file: sql/patches/002_spell_choice_on_level_up.sql
- spell_choices_pending: active and unclaimed offers.
- spell_choices_history: immutable claim record, one per character per level.
- spell_choices_blacklist: excluded spells.

## Security Model
Validation happens server-side in Lua:
- pending_id must exist for the character.
- nonce must match row value.
- selected_spell_id must match one of row columns spell_id_1..3.
- Pending row must not be expired and must be unclaimed.
- Claim must not already exist for character + level.
- Spell must not already be scribed.

## Operational Constraints
- Do not auto-run SQL from repo changes.
- Do not deploy by copy/sync in this step.
- Do not push until review is complete.

## Suggested Inspection Queries
SELECT * FROM spell_choices_pending WHERE character_id = ? ORDER BY id DESC;
SELECT * FROM spell_choices_history WHERE character_id = ? ORDER BY id DESC;
SELECT * FROM spell_choices_blacklist ORDER BY spell_id;

## GM Test Flow
1. Level a test character.
2. Verify pending row appears for that level.
3. Use generated command link or #spellchoice to view choices.
4. Pick one choice.
5. Confirm: spell is scribed, pending row claimed_at is set, history row is present.
6. Attempt replay and confirm it is rejected.