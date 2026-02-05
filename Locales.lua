FarmAutoMount_L = {}
local L = FarmAutoMount_L

-- All translations in a table
local translations = {
    -- English (British) - DEFAULT
    enGB = {
        ["Welcome"] = "Farm Auto Mount loaded. Type /fam help for commands.",
        ["Account mount set to"] = "Account mount set to: ",
        ["Character mount set to"] = "Character mount set to: ",
        ["Enabled"] = "Enabled",
        ["Disabled"] = "Disabled",
        ["Delay set to"] = "Delay set to",
        ["Usage delay"] = "Usage: /fam delay <seconds>",
        ["Usage mount"] = "Usage: /fam mount <name>",
        ["Commands"] = "Commands:",
        ["Help mount"] = "/fam mount <name> - Set mount for this character",
        ["Help mount account"] = "/fam account <name> - Set mount for all characters",
        ["Help enable"] = "/fam enable - Enable auto-mount",
        ["Help disable"] = "/fam disable - Disable auto-mount",
        ["Help delay"] = "/fam delay <seconds> - Set delay before mounting",
        ["Help reset"] = "/fam reset - Reset character mount (use account setting)",
        ["Help reset account"] = "/fam reset account - Reset account mount",
        ["Character mount reset"] = "Character mount reset (using account setting)",
        ["Account mount reset"] = "Account mount reset",
    },

    -- French
    frFR = {
        ["Welcome"] = "Farm Auto Mount chargé. Tapez /fam help pour les commandes.",
        ["Account mount set to"] = "Monture du compte : ",
        ["Character mount set to"] = "Monture du personnage : ",
        ["Enabled"] = "Activé",
        ["Disabled"] = "Désactivé",
        ["Delay set to"] = "Délai réglé à",
        ["Usage delay"] = "Utilisation : /fam delay <secondes>",
        ["Usage mount"] = "Utilisation : /fam mount <nom>",
        ["Commands"] = "Commandes :",
        ["Help mount"] = "/fam mount <nom> - Monture pour ce personnage",
        ["Help mount account"] = "/fam account <nom> - Monture pour tout le compte",
        ["Help enable"] = "/fam enable - Activer",
        ["Help disable"] = "/fam disable - Désactiver",
        ["Help delay"] = "/fam delay <secondes> - Délai avant de monter",
        ["Help reset"] = "/fam reset - Réinitialiser la monture du personnage",
        ["Help reset account"] = "/fam reset account - Réinitialiser la monture du compte",
        ["Character mount reset"] = "Monture du personnage réinitialisée (utilise le réglage du compte)",
        ["Account mount reset"] = "Monture du compte réinitialisée",
    },

    -- German
    deDE = {
        ["Welcome"] = "Farm Auto Mount geladen. /fam help für Befehle.",
        ["Account mount set to"] = "Kontoreittier gesetzt auf: ",
        ["Character mount set to"] = "Charakterreittier gesetzt auf: ",
        ["Enabled"] = "Aktiviert",
        ["Disabled"] = "Deaktiviert",
        ["Delay set to"] = "Verzögerung gesetzt auf",
        ["Usage delay"] = "Verwendung: /fam delay <Sekunden>",
        ["Usage mount"] = "Verwendung: /fam mount <Name>",
        ["Commands"] = "Befehle:",
        ["Help mount"] = "/fam mount <Name> - Reittier für diesen Charakter",
        ["Help mount account"] = "/fam account <Name> - Reittier für alle Charaktere",
        ["Help enable"] = "/fam enable - Aktivieren",
        ["Help disable"] = "/fam disable - Deaktivieren",
        ["Help delay"] = "/fam delay <Sekunden> - Verzögerung vor dem Aufsitzen",
        ["Help reset"] = "/fam reset - Charakterreittier zurücksetzen",
        ["Help reset account"] = "/fam reset account - Kontoreittier zurücksetzen",
        ["Character mount reset"] = "Charakterreittier zurückgesetzt (Kontoeinstellung wird verwendet)",
        ["Account mount reset"] = "Kontoreittier zurückgesetzt",
    },

    -- Spanish
    esES = {
        ["Welcome"] = "Farm Auto Mount cargado. /fam help para comandos.",
        ["Account mount set to"] = "Montura de cuenta: ",
        ["Character mount set to"] = "Montura de personaje: ",
        ["Enabled"] = "Activado",
        ["Disabled"] = "Desactivado",
        ["Delay set to"] = "Retardo ajustado a",
        ["Usage delay"] = "Uso: /fam delay <segundos>",
        ["Usage mount"] = "Uso: /fam mount <nombre>",
        ["Commands"] = "Comandos:",
        ["Help mount"] = "/fam mount <nombre> - Montura para este personaje",
        ["Help mount account"] = "/fam account <nombre> - Montura para toda la cuenta",
        ["Help enable"] = "/fam enable - Activar",
        ["Help disable"] = "/fam disable - Desactivar",
        ["Help delay"] = "/fam delay <segundos> - Retardo antes de montar",
        ["Help reset"] = "/fam reset - Reiniciar montura del personaje",
        ["Help reset account"] = "/fam reset account - Reiniciar montura de cuenta",
        ["Character mount reset"] = "Montura del personaje reiniciada (usando ajuste de cuenta)",
        ["Account mount reset"] = "Montura de cuenta reiniciada",
    },

    -- Italian
    itIT = {
        ["Welcome"] = "Farm Auto Mount caricato. /fam help per i comandi.",
        ["Account mount set to"] = "Cavalcatura account: ",
        ["Character mount set to"] = "Cavalcatura personaggio: ",
        ["Enabled"] = "Attivato",
        ["Disabled"] = "Disattivato",
        ["Delay set to"] = "Ritardo impostato a",
        ["Usage delay"] = "Uso: /fam delay <secondi>",
        ["Usage mount"] = "Uso: /fam mount <nome>",
        ["Commands"] = "Comandi:",
        ["Help mount"] = "/fam mount <nome> - Cavalcatura per questo personaggio",
        ["Help mount account"] = "/fam account <nome> - Cavalcatura per tutto l'account",
        ["Help enable"] = "/fam enable - Attivare",
        ["Help disable"] = "/fam disable - Disattivare",
        ["Help delay"] = "/fam delay <secondi> - Ritardo prima di montare",
        ["Help reset"] = "/fam reset - Reimpostare cavalcatura del personaggio",
        ["Help reset account"] = "/fam reset account - Reimpostare cavalcatura dell'account",
        ["Character mount reset"] = "Cavalcatura del personaggio reimpostata (usa impostazione account)",
        ["Account mount reset"] = "Cavalcatura dell'account reimpostata",
    },

    -- Portuguese (Brazilian)
    ptBR = {
        ["Welcome"] = "Farm Auto Mount carregado. /fam help para comandos.",
        ["Account mount set to"] = "Montaria da conta: ",
        ["Character mount set to"] = "Montaria do personagem: ",
        ["Enabled"] = "Ativado",
        ["Disabled"] = "Desativado",
        ["Delay set to"] = "Atraso definido para",
        ["Usage delay"] = "Uso: /fam delay <segundos>",
        ["Usage mount"] = "Uso: /fam mount <nome>",
        ["Commands"] = "Comandos:",
        ["Help mount"] = "/fam mount <nome> - Montaria para este personagem",
        ["Help mount account"] = "/fam account <nome> - Montaria para toda a conta",
        ["Help enable"] = "/fam enable - Ativar",
        ["Help disable"] = "/fam disable - Desativar",
        ["Help delay"] = "/fam delay <segundos> - Atraso antes de montar",
        ["Help reset"] = "/fam reset - Redefinir montaria do personagem",
        ["Help reset account"] = "/fam reset account - Redefinir montaria da conta",
        ["Character mount reset"] = "Montaria do personagem redefinida (usando configuração da conta)",
        ["Account mount reset"] = "Montaria da conta redefinida",
    },

    -- Russian
    ruRU = {
        ["Welcome"] = "Farm Auto Mount загружен. /fam help для команд.",
        ["Account mount set to"] = "Маунт аккаунта: ",
        ["Character mount set to"] = "Маунт персонажа: ",
        ["Enabled"] = "Включено",
        ["Disabled"] = "Отключено",
        ["Delay set to"] = "Задержка установлена на",
        ["Usage delay"] = "Использование: /fam delay <секунды>",
        ["Usage mount"] = "Использование: /fam mount <имя>",
        ["Commands"] = "Команды:",
        ["Help mount"] = "/fam mount <имя> - Маунт для этого персонажа",
        ["Help mount account"] = "/fam account <имя> - Маунт для всех персонажей",
        ["Help enable"] = "/fam enable - Включить",
        ["Help disable"] = "/fam disable - Отключить",
        ["Help delay"] = "/fam delay <секунды> - Задержка перед маунтом",
        ["Help reset"] = "/fam reset - Сбросить маунт персонажа",
        ["Help reset account"] = "/fam reset account - Сбросить маунт аккаунта",
        ["Character mount reset"] = "Маунт персонажа сброшен (используется настройка аккаунта)",
        ["Account mount reset"] = "Маунт аккаунта сброшен",
    },

    -- Korean
    koKR = {
        ["Welcome"] = "Farm Auto Mount 로드됨. /fam help 로 명령어 확인.",
        ["Account mount set to"] = "계정 탈것: ",
        ["Character mount set to"] = "캐릭터 탈것: ",
        ["Enabled"] = "활성화됨",
        ["Disabled"] = "비활성화됨",
        ["Delay set to"] = "지연 시간 설정:",
        ["Usage delay"] = "사용법: /fam delay <초>",
        ["Usage mount"] = "사용법: /fam mount <이름>",
        ["Commands"] = "명령어:",
        ["Help mount"] = "/fam mount <이름> - 이 캐릭터의 탈것 설정",
        ["Help mount account"] = "/fam account <이름> - 모든 캐릭터의 탈것 설정",
        ["Help enable"] = "/fam enable - 활성화",
        ["Help disable"] = "/fam disable - 비활성화",
        ["Help delay"] = "/fam delay <초> - 탈것 소환 전 지연 시간",
        ["Help reset"] = "/fam reset - 캐릭터 탈것 초기화",
        ["Help reset account"] = "/fam reset account - 계정 탈것 초기화",
        ["Character mount reset"] = "캐릭터 탈것 초기화됨 (계정 설정 사용)",
        ["Account mount reset"] = "계정 탈것 초기화됨",
    },

    -- Simplified Chinese
    zhCN = {
        ["Welcome"] = "Farm Auto Mount 已加载。输入 /fam help 查看命令。",
        ["Account mount set to"] = "账号坐骑: ",
        ["Character mount set to"] = "角色坐骑: ",
        ["Enabled"] = "已启用",
        ["Disabled"] = "已禁用",
        ["Delay set to"] = "延迟设置为",
        ["Usage delay"] = "用法: /fam delay <秒>",
        ["Usage mount"] = "用法: /fam mount <名称>",
        ["Commands"] = "命令:",
        ["Help mount"] = "/fam mount <名称> - 设置此角色的坐骑",
        ["Help mount account"] = "/fam account <名称> - 设置所有角色的坐骑",
        ["Help enable"] = "/fam enable - 启用",
        ["Help disable"] = "/fam disable - 禁用",
        ["Help delay"] = "/fam delay <秒> - 上坐骑前的延迟",
        ["Help reset"] = "/fam reset - 重置角色坐骑",
        ["Help reset account"] = "/fam reset account - 重置账号坐骑",
        ["Character mount reset"] = "角色坐骑已重置 (使用账号设置)",
        ["Account mount reset"] = "账号坐骑已重置",
    },

    -- Traditional Chinese
    zhTW = {
        ["Welcome"] = "Farm Auto Mount 已載入。輸入 /fam help 查看指令。",
        ["Account mount set to"] = "帳號坐騎: ",
        ["Character mount set to"] = "角色坐騎: ",
        ["Enabled"] = "已啟用",
        ["Disabled"] = "已停用",
        ["Delay set to"] = "延遲設定為",
        ["Usage delay"] = "用法: /fam delay <秒>",
        ["Usage mount"] = "用法: /fam mount <名稱>",
        ["Commands"] = "指令:",
        ["Help mount"] = "/fam mount <名稱> - 設定此角色的坐騎",
        ["Help mount account"] = "/fam account <名稱> - 設定所有角色的坐騎",
        ["Help enable"] = "/fam enable - 啟用",
        ["Help disable"] = "/fam disable - 停用",
        ["Help delay"] = "/fam delay <秒> - 騎乘前的延遲",
        ["Help reset"] = "/fam reset - 重設角色坐騎",
        ["Help reset account"] = "/fam reset account - 重設帳號坐騎",
        ["Character mount reset"] = "角色坐騎已重設 (使用帳號設定)",
        ["Account mount reset"] = "帳號坐騎已重設",
    },
}

-- Aliases
translations.enUS = translations.enGB  -- US English uses British English
translations.esMX = translations.esES  -- Mexican Spanish uses Spain Spanish

-- Get current locale, fallback to enGB
local locale = GetLocale()
local localeData = translations[locale] or translations.enGB

-- Copy to L table
for key, value in pairs(localeData) do
    L[key] = value
end
