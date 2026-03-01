--[[
    Gathering spell IDs by profession.
    Each expansion has its own spell ID for the same action.
    Used to detect when the player is gathering a resource.
    Add new IDs here when Blizzard adds new expansions.
]]
    -- Collect spellID from /etrace or similar tools

FarmAutoMount_GatheringSpells = {
    

    -- Miscelaneous 

        3365,       -- Opening Miscelaneous chest/lock
        98324,      -- Void-Tainted Remains 

    -- Lumber / Bucheronnage

        1239682,    -- All expansions

    -- Mining
        2575,       -- Generic

        265837,     -- Classic
        265839,     -- Burning Crusade
        265841,     -- Wrath of the Lich King
        265843,     -- Cataclysm
        265845,     -- Mists of Pandaria
        265847,     -- Warlords of Draenor
        265849,     -- Legion
        265851,     -- Battle for Azeroth
        309835,     -- Shadowlands
        366260,     -- Dragonflight
        423341,     -- The War Within
        471013,     -- Midnight
    
    -- Herbalism
        2366,       -- Generic

        265819,     -- Classic
        265821,     -- Burning Crusade
        265823,     -- Wrath of the Lich King
        265825,     -- Cataclysm
        265827,     -- Mists of Pandaria
        265829,     -- Warlords of Draenor
        265834,     -- Legion
        265835,     -- Battle for Azeroth
        309780,     -- Shadowlands
        366252,     -- Dragonflight
        441327,     -- The War Within
        471009,     -- Midnight

}
