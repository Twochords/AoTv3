#ifndef SPELL_CHOICE_UI_H
#define SPELL_CHOICE_UI_H

#include <array>
#include <string>

struct SpellChoiceOption {
    int spellId = 0;
    std::string spellName;
};

class SpellChoice_UI {
public:
    bool ParseOpenPayloadFromChat(const std::string& line);

    bool HasPendingOpen() const { return hasPendingOpen; }
    int GetLevel() const { return level; }
    const std::string& GetNonce() const { return nonce; }
    const std::array<SpellChoiceOption, 3>& GetOptions() const { return options; }

    void Clear();

private:
    bool hasPendingOpen = false;
    int level = 0;
    std::string nonce;
    std::array<SpellChoiceOption, 3> options;
};

#endif
