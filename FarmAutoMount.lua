--[[
    Farm Auto Mount (FAM)
    Automatically remounts after gathering (herbs, ore, lumber).
    Author: Schlouppy
    https://github.com/Schlouppy/FarmAutoMount
]]

local L = FarmAutoMount_L
local isGathering = false
local debugMode = true

-- Print only when debug mode is on
local function dbg(msg)
    if debugMode then
        print("|cFFFFAA00[FAM Debug]|r " .. msg)
    end
end

-- Clean mount name from WoW link formatting (brackets, color codes)
local function CleanMountName(name)
    local linkName = name:match("|h%[(.+)%]|h")
    if linkName then name = linkName end
    name = name:gsub("|c%x%x%x%x%x%x%x%x", "")
    name = name:gsub("|r", "")
    name = name:gsub("|H.-|h", "")
    name = name:gsub("%[", "")
    name = name:gsub("%]", "")
    name = name:match("^%s*(.-)%s*$")
    return name
end

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

        -- Welcome message
        print("|cFF00FF00[FAM]|r " .. L["Welcome"])

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
            dbg("Gathering spell detected: " .. spellID)

        end

    elseif event == "LOOT_CLOSED" then

        -- Only mount if we just gathered something
        dbg("Loot closed, isGathering = " .. tostring(isGathering))
        if not isGathering then return end

        -- Check if addon is enabled
        dbg("enabled = " .. tostring(FarmAutoMountDB.enabled) .. ", class = " .. select(2, UnitClass("player")))
        if FarmAutoMountDB.enabled == false then return end

        -- Skip druids (they use Travel Form)
        local _, class = UnitClass("player")
        if class == "DRUID" then return end

        -- Get delay (saved or default)
        local delay = FarmAutoMountDB.delay or defaults.delay

        -- Get mount name (character first, then account)
        local mountName = FarmAutoMountCharDB.mountName or FarmAutoMountDB.mountName

        dbg("Mounting in " .. delay .. "s (mount: " .. (mountName or "favorite") .. ")")

        C_Timer.After(delay, function()
            if mountName then
                -- Search for the mount by name in the journal
                for _, mountID in ipairs(C_MountJournal.GetMountIDs()) do
                    local name, _, _, _, _, _, _, _, _, _, isCollected =
                        C_MountJournal.GetMountInfoByID(mountID)
                    if isCollected and name == mountName then
                        dbg("Summoning: " .. name)
                        C_MountJournal.SummonByID(mountID)
                        return
                    end
                end
                dbg("Mount not found: " .. mountName .. ", using favorite")
            end
            -- Fallback: summon favorite mount
            dbg("Summoning: favorite mount")
            C_MountJournal.SummonByID(0)
        end)

        -- Reset gathering flag after mounting
        isGathering = false

    end

end)

-- Register /fam slash command
SLASH_FARMAUTOMOUNT1 = "/fam"
SlashCmdList["FARMAUTOMOUNT"] = function(msg)

    -- Split the message into command and the rest
    local command, arg = msg:match("^(%S+)%s*(.*)$")

    -- If nothing typed, show help
    if not command then
        command = "help"
    end

    -- Make command lowercase so "/fam MOUNT" works too
    command = command:lower()

    if command == "mount" then

        -- Check if it's an account-wide setting: /fam mount account <name>
        local accountMount = arg:lower():match("^account%s+(.+)")
        if accountMount then
            local cleanName = CleanMountName(accountMount)
            FarmAutoMountDB.mountName = cleanName
            print("|cFF00FF00[FAM]|r " .. L["Account mount set to"] .. cleanName)
        else
            local cleanName = CleanMountName(arg)
            FarmAutoMountCharDB.mountName = cleanName
            print("|cFF00FF00[FAM]|r " .. L["Character mount set to"] .. cleanName)
        end

    elseif command == "enable" then
        FarmAutoMountDB.enabled = true
        print("|cFF00FF00[FAM]|r " .. L["Enabled"])

    elseif command == "disable" then
        FarmAutoMountDB.enabled = false
        print("|cFF00FF00[FAM]|r " .. L["Disabled"])

    elseif command == "delay" then
        local seconds = tonumber(arg)
        if seconds then
            FarmAutoMountDB.delay = seconds
            print("|cFF00FF00[FAM]|r " .. L["Delay set to"] .. " " .. seconds .. "s")
        else
            print("|cFFFF0000[FAM]|r " .. L["Usage delay"])
        end

    elseif command == "debug" then
        debugMode = not debugMode
        print("|cFF00FF00[FAM]|r Debug: " .. (debugMode and "ON" or "OFF"))

    elseif command == "help" then
        print("|cFF00FF00[FAM]|r " .. L["Commands"])
        print("  " .. L["Help mount"])
        print("  " .. L["Help mount account"])
        print("  " .. L["Help enable"])
        print("  " .. L["Help disable"])
        print("  " .. L["Help delay"])
        print("  /fam debug - Toggle debug mode")

    end

end
