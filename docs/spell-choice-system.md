# Spell Choice System

## Status Split

### Backend: Working Now
- Static pool source remains at quests/lua_modules/spell_choice_pool.lua.
- Pending and claimed state is persisted in data buckets.
- Server-side validation remains authoritative:
  - pending set exists for character and level
  - nonce must match
  - selected spell must be in offered 3
  - spell must remain valid and not already scribed
  - one claim per character per level
- No runtime SQL is used by the Lua backend.

### Native Fallback: Working But Not Final
- Current fallback path is still enabled intentionally:
  - eq.popup for visibility
  - chat saylinks for spellchoice 1/2/3 claim actions
- This remains the reliability path if custom UI is unavailable.

### Custom UI Bridge: Required For Final 3-Button Experience
- New client window XML is defined at uifiles/default/SpellChoiceWnd.xml.
- Lua now attempts to open a custom window first and passes:
  - window id
  - level
  - nonce
  - spell ids
  - spell names/descriptions
  - button ids 10, 11, 12
- If no supported custom window API exists at runtime, code falls back automatically to popup + saylinks.

## Current Server Capability Check
- This server codebase exports EVENT_LEVEL_UP and EVENT_POPUP_RESPONSE.
- No EVENT_CUSTOM_ACTION export was found in this build.
- No OP_CustomWindow/OP_CustomAction symbols were found in the current source snapshot.
- Result: true packet-driven custom-window click callbacks are build-dependent and may require core support not present in this runtime.

## Implementation Notes
- Lua bridge function added:
  - sc_try_show_custom_window(client, level, pending, spell_rows)
- Existing fallback function retained:
  - sc_show_pending still sends popup + saylinks when custom path fails
- Button mapping contract for custom UI:
  - button id 10 => choice 1
  - button id 11 => choice 2
  - button id 12 => choice 3
- Lua event handler added:
  - event_custom_action(e) maps customid 10/11/12 to sc_claim_by_index

## Deployment Notes
- Place SpellChoiceWnd.xml in the EQ client UI path:
  - <EQ Client>\\uifiles\\default\\SpellChoiceWnd.xml
- If using a custom skin folder, copy into that skin as well if it overrides default windows.
- Quest script still requires standard deployment/restart flow.

## Risk and Fallback
- If custom-window send/callback methods are unsupported by this server build or client executable, users still get the spell choice via popup + saylink path with full server validation.
