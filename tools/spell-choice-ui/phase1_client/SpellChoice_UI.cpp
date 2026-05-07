#include "SpellChoice_UI.h"

#include <cstdlib>
#include <cstdio>
#include <sstream>
#include <vector>

namespace {
std::vector<std::string> SplitPipe(const std::string& line) {
    std::vector<std::string> parts;
    std::stringstream ss(line);
    std::string token;
    while (std::getline(ss, token, '|')) {
        parts.push_back(token);
    }
    return parts;
}

bool ParseInt(const std::string& value, int& out) {
    if (value.empty()) {
        return false;
    }

    char* end = nullptr;
    long parsed = std::strtol(value.c_str(), &end, 10);
    if (end == value.c_str() || *end != '\0') {
        return false;
    }

    out = static_cast<int>(parsed);
    return true;
}
}

void SpellChoice_UI::Clear() {
    hasPendingOpen = false;
    level = 0;
    nonce.clear();
    for (auto& option : options) {
        option.spellId = 0;
        option.spellName.clear();
    }
}

bool SpellChoice_UI::ParseOpenPayloadFromChat(const std::string& line) {
    if (line.rfind("SC_OPEN|", 0) != 0) {
        return false;
    }

    std::vector<std::string> parts = SplitPipe(line);
    if (parts.size() != 9) {
        std::printf("[SpellChoiceUI] Invalid SC_OPEN part count: %zu\n", parts.size());
        return false;
    }

    int parsedLevel = 0;
    int spell1 = 0;
    int spell2 = 0;
    int spell3 = 0;
    if (!ParseInt(parts[1], parsedLevel) ||
        !ParseInt(parts[3], spell1) ||
        !ParseInt(parts[5], spell2) ||
        !ParseInt(parts[7], spell3)) {
        std::printf("[SpellChoiceUI] Failed numeric parse for SC_OPEN payload.\n");
        return false;
    }

    level = parsedLevel;
    nonce = parts[2];

    options[0].spellId = spell1;
    options[0].spellName = parts[4];

    options[1].spellId = spell2;
    options[1].spellName = parts[6];

    options[2].spellId = spell3;
    options[2].spellName = parts[8];

    hasPendingOpen = true;

    std::printf(
        "[SpellChoiceUI] Parsed SC_OPEN level=%d nonce=%s choices=[%d:%s] [%d:%s] [%d:%s]\n",
        level,
        nonce.c_str(),
        options[0].spellId,
        options[0].spellName.c_str(),
        options[1].spellId,
        options[1].spellName.c_str(),
        options[2].spellId,
        options[2].spellName.c_str());

    return true;
}
