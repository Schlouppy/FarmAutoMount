--[[
    Farm Auto Mount (FAM)
    Automatically remounts after gathering (herbs, ore, lumber).
    Author: Schlouppy
    https://github.com/Schlouppy/FarmAutoMount
]]

local L = FarmAutoMount_L
local isGathering = false

-- Create a frame to listen to game events
local frame = CreateFrame("Frame")
frame:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
frame:RegisterEvent("LOOT_CLOSED")

-- Called every time a registered event happens
frame:SetScript("OnEvent", function(self, event, ...)

    if event == "UNIT_SPELLCAST_SUCCEEDED" then

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
