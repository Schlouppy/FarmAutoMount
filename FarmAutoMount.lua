--[[
    Farm Auto Mount (FAM)
    Automatically remounts after gathering (herbs, ore, lumber).
    Author: Schlouppy
    https://github.com/Schlouppy/FarmAutoMount
]]

local L = FarmAutoMount_L
local isGathering = false

-- Default settings
local defaults = {
    mountName = nil,
    enabled = true,
    delay = 0.5,
}

-- Create a frame to listen to game events
local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
frame:RegisterEvent("LOOT_CLOSED")

-- Called every time a registered event happens
frame:SetScript("OnEvent", function(self, event, ...)

    if event == "ADDON_LOADED" then
        local addonName = ...

        -- Only run for our addon
        if addonName ~= "FarmAutoMount" then return end

        -- Create saved variables if they don't exist yet
        FarmAutoMountDB = FarmAutoMountDB or {}
        FarmAutoMountCharDB = FarmAutoMountCharDB or {}

        -- No need to listen for this event anymore
        frame:UnregisterEvent("ADDON_LOADED")

    elseif event == "UNIT_SPELLCAST_SUCCEEDED" then

        -- Get the event arguments: who casted and what spell
        local unit, _, spellID = ...

        -- Ignore spells from other players
        if unit ~= "player" then return end

        -- Check if the spell is a gathering spell
        if spellID == 1239682         -- Lumber / Bucheronnage
        or spellID == 265819          -- Herbalism
        or spellID == 265837 then     -- Mining

            isGathering = true

        end

    elseif event == "LOOT_CLOSED" then

        -- Only mount if we just gathered something
        if not isGathering then return end
        isGathering = false

        -- Skip druids (they use Travel Form)
        local _, class = UnitClass("player")
        if class == "DRUID" then return end

        -- Wait a short delay then summon favorite mount
        C_Timer.After(0.5, function()
            C_MountJournal.SummonByID(0)
        end)

    end

end)
