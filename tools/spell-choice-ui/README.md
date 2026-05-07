# Spell Choice UI Contract

## Target UX
- Final target is a true 3-button spell choice window.
- Native popup plus saylinks remains as temporary fallback.

## Authoritative Rules
- Client UI is display-only.
- Server remains authoritative for all trust decisions.
- Required server-side checks remain unchanged:
  - pending offer exists and belongs to the character
  - nonce matches
  - selected spell is one of the offered three
  - not already claimed for this level
  - spell still valid and not already scribed

## Client Window
- File: uifiles/default/SpellChoiceWnd.xml
- Buttons:
  - id 10 => choice 1
  - id 11 => choice 2
  - id 12 => choice 3

## Server Bridge (Lua)
- sc_try_show_custom_window(...) attempts a custom window call with dynamic fields.
- event_custom_action(e) maps 10/11/12 to the same server claim path used by say commands.
- If custom UI calls are unavailable, sc_show_pending(...) falls back to popup + saylinks.

## Build Capability Caveat
- In this runtime/source snapshot, no EVENT_CUSTOM_ACTION export and no OP_CustomWindow/OP_CustomAction symbols were found.
- If core support is absent, custom window callbacks will not fire and fallback path is expected behavior.
