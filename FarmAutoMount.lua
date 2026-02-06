--[[
    Farm Auto Mount (FAM)
    Automatically remounts after gathering (herbs, ore, lumber).
    Author: Schlouppy
    https://github.com/Schlouppy/FarmAutoMount
]]

local L = FarmAutoMount_L
local isGathering = false
local debugMode = false
local isTryingToMount = false

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

-- Find mount ID from name (search once, store ID)
local function FindMountIDByName(searchName)
    for _, mountID in ipairs(C_MountJournal.GetMountIDs()) do
        local name, _, _, _, _, _, _, _, _, _, isCollected =
            C_MountJournal.GetMountInfoByID(mountID)
        if isCollected and name == searchName then
            return mountID, name
        end
    end
    return nil
end

-- Default settings
local defaults = {
    mountID = nil,
    enabled = true,
    delay = 0.5,
}

-- Create a frame to listen to game events
local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
frame:RegisterEvent("LOOT_CLOSED")
frame:RegisterEvent("UI_ERROR_MESSAGE")

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

        -- Migration: convert old mountName to mountID
        if FarmAutoMountDB.mountName and not FarmAutoMountDB.mountID then
            local mountID = FindMountIDByName(FarmAutoMountDB.mountName)
            if mountID then
                FarmAutoMountDB.mountID = mountID
            end
            FarmAutoMountDB.mountName = nil
        end
        if FarmAutoMountCharDB.mountName and not FarmAutoMountCharDB.mountID then
            local mountID = FindMountIDByName(FarmAutoMountCharDB.mountName)
            if mountID then
                FarmAutoMountCharDB.mountID = mountID
            end
            FarmAutoMountCharDB.mountName = nil
        end

        -- Welcome message
        print("|cFF00FF00[FAM]|r " .. L["Welcome"])

    elseif event == "UNIT_SPELLCAST_SUCCEEDED" then

        -- Get the event arguments: who casted and what spell
        local unit, _, spellID = ...

        -- Ignore spells from other players
        if unit ~= "player" then return end

        -- Check if the spell is in our gathering list
        for _, gatherID in ipairs(FarmAutoMount_GatheringSpells) do
            if spellID == gatherID then
                isGathering = true
                dbg("Gathering spell detected: " .. spellID)
                break
            end
        end

    elseif event == "LOOT_CLOSED" then

        -- Only mount if we just gathered something
        if not isGathering then
            dbg("Loot closed, ignored (not gathering)")
            return
        end
        dbg("Loot closed, mounting...")
        isGathering = false

        -- Check if addon is enabled
        if FarmAutoMountDB.enabled == false then return end

        -- Skip druids (they use Travel Form)
        local _, class = UnitClass("player")
        if class == "DRUID" then return end

        -- Get delay (saved or default)
        local delay = FarmAutoMountDB.delay or defaults.delay

        -- Get mount ID (character first, then account, then favorite = 0)
        local mountID = FarmAutoMountCharDB.mountID or FarmAutoMountDB.mountID or 0

        dbg("Mounting in " .. delay .. "s (mountID: " .. mountID .. ")")

        C_Timer.After(delay, function()
            isTryingToMount = true
            C_MountJournal.SummonByID(mountID)
            C_Timer.After(2, function()
                isTryingToMount = false
            end)
        end)

    elseif event == "UI_ERROR_MESSAGE" then
        local _, message = ...
        if isTryingToMount then
            print("|cFFFF0000[FAM]|r " .. L["Automount failed"] .. ": " .. message)
            isTryingToMount = false
        end

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
        -- If no mount name provided, show usage
        if arg == "" then
            print("|cFFFF0000[FAM]|r " .. L["Usage mount"])
            return
        end

        local cleanName = CleanMountName(arg)
        local mountID, mountName = FindMountIDByName(cleanName)
        if mountID then
            FarmAutoMountCharDB.mountID = mountID
            print("|cFF00FF00[FAM]|r " .. L["Character mount set to"] .. mountName)
        else
            print("|cFFFF0000[FAM]|r " .. L["Mount not found"] .. ": " .. cleanName)
        end

    -- Account-wide mount setting: /fam account <name>
    elseif command == "account" then
        -- If no mount name provided, show usage
        if arg == "" then
            print("|cFFFF0000[FAM]|r " .. L["Usage account"])
            return
        end

        local cleanName = CleanMountName(arg)
        local mountID, mountName = FindMountIDByName(cleanName)
        if mountID then
            FarmAutoMountDB.mountID = mountID
            print("|cFF00FF00[FAM]|r " .. L["Account mount set to"] .. mountName)
        else
            print("|cFFFF0000[FAM]|r " .. L["Mount not found"] .. ": " .. cleanName)
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

    elseif command == "reset" then
        if arg:lower():match("^account") then
            FarmAutoMountDB.mountID = nil
            print("|cFF00FF00[FAM]|r " .. L["Account mount reset"])
        else
            FarmAutoMountCharDB.mountID = nil
            print("|cFF00FF00[FAM]|r " .. L["Character mount reset"])
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
        print("  " .. L["Help reset"])
        print("  " .. L["Help reset account"])
        print("  /fam debug - Toggle debug mode")

    end

end
