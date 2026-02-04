FarmAutoMount_L = {}
local L = FarmAutoMount_L

-- English (default)
L["Welcome"] = "Farm Auto Mount loaded (English). Type /fam help for commands."
L["Account mount set to"] = "Account mount set to"
L["Character mount set to"] = "Character mount set to"
L["Enabled"] = "Enabled"
L["Disabled"] = "Disabled"
L["Delay set to"] = "Delay set to"
L["Usage delay"] = "Usage: /fam delay <seconds>"
L["Commands"] = "Commands:"
L["Help mount"] = "/fam mount <name> - Set mount for this character"
L["Help mount account"] = "/fam account <name> - Set mount for all characters"
L["Help enable"] = "/fam enable - Enable auto-mount"
L["Help disable"] = "/fam disable - Disable auto-mount"
L["Help delay"] = "/fam delay <seconds> - Set delay before mounting"
L["Help reset"] = "/fam reset - Reset character mount (use account setting)"
L["Help reset account"] = "/fam reset account - Reset account mount"
L["Character mount reset"] = "Character mount reset (using account setting)"
L["Account mount reset"] = "Account mount reset"

-- French
if GetLocale() == "frFR" then
    L["Welcome"] = "Farm Auto Mount chargé (Français). Tapez /fam help pour les commandes."
    L["Account mount set to"] = "Monture du compte : "
    L["Character mount set to"] = "Monture du personnage : "
    L["Enabled"] = "Activé"
    L["Disabled"] = "Désactivé"
    L["Delay set to"] = "Délai réglé à"
    L["Usage delay"] = "Utilisation : /fam delay <secondes>"
    L["Commands"] = "Commandes :"
    L["Help mount"] = "/fam mount <nom> - Monture pour ce personnage"
    L["Help mount account"] = "/fam account <nom> - Monture pour tout le compte"
    L["Help enable"] = "/fam enable - Activer"
    L["Help disable"] = "/fam disable - Désactiver"
    L["Help delay"] = "/fam delay <secondes> - Délai avant de monter"
    L["Help reset"] = "/fam reset - Réinitialiser la monture du personnage"
    L["Help reset account"] = "/fam reset account - Réinitialiser la monture du compte"
    L["Character mount reset"] = "Monture du personnage réinitialisée (utilise le réglage du compte)"
    L["Account mount reset"] = "Monture du compte réinitialisée"
end
