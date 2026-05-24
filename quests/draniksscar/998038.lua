local TIMER_NAME = "guard_assist"
local TIMER_MS = 2000
local ASSIST_RANGE = 80
local FRIENDLY_GUARD_FACTIONS = {
    [5059] = true
}

local IGNORE_KEYWORDS = {
    "vendor",
    "merchant",
    "banker",
    "quest",
    "placeholder",
    "controller",
    "trigger",
    "aura"
}

local function lower_name(mob)
    if not mob.valid then
        return ""
    end
    return string.lower(mob:GetCleanName() or mob:GetName() or "")
end

local function starts_with_hash(name)
    return string.sub(name, 1, 1) == "#"
end

local function has_ignore_keyword(name)
    for _, k in ipairs(IGNORE_KEYWORDS) do
        if string.find(name, k, 1, true) then
            return true
        end
    end
    return false
end

local function should_ignore_by_name(name)
    local kw = has_ignore_keyword(name)
    if not kw then
        return false
    end

    if starts_with_hash(name) then
        if string.find(name, "placeholder", 1, true) or string.find(name, "controller", 1, true) or string.find(name, "trigger", 1, true) then
            return true
        end
        return false
    end

    return true
end

local function is_candidate_hostile(e, npc)
    if not npc.valid then
        return false
    end
    if npc:GetID() == e.self:GetID() then
        return false
    end
    if npc:IsClient() then
        return false
    end
    if npc:IsCorpse() then
        return false
    end

    local d = e.self:CalculateDistance(npc:GetX(), npc:GetY(), npc:GetZ())
    if d > ASSIST_RANGE then
        return false
    end

    local name = lower_name(npc)
    if should_ignore_by_name(name) then
        return false
    end

    local npc_faction = npc:GetNPCFactionID()
    if FRIENDLY_GUARD_FACTIONS[npc_faction] then
        return false
    end

    local top = npc:GetHateTop()
    if not top.valid then
        return false
    end
    if not top:IsClient() then
        return false
    end

    return true
end

function event_spawn(e)
    eq.set_timer(TIMER_NAME, TIMER_MS)
end

function event_timer(e)
    if e.timer ~= TIMER_NAME then
        return
    end


    local entity_list = eq.get_entity_list()
    local npc_list = entity_list:GetNPCList()
    for npc in npc_list.entries do
        if is_candidate_hostile(e, npc) then
            local top = npc:GetHateTop()
            if top.valid and top:IsClient() then
                e.self:Say("To arms! I will defend you!")
                e.self:AddToHateList(npc, 1000)
                eq.attack(npc:GetName())
                return
            end
        end
    end
end

function event_combat(e)
    if not e.joined then
        eq.set_timer(TIMER_NAME, TIMER_MS)
    end
end