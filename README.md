# 🌿 Farm Auto Mount

[![CurseForge](https://img.shields.io/badge/CurseForge-Download-orange)](https://www.curseforge.com/wow/addons/farmautomount)
[![Version](https://img.shields.io/badge/Version-1.1.3-green)]()
[![WoW](https://img.shields.io/badge/WoW-The%20War%20Within-blue)]()

**Automatically remounts after gathering herbs, ore, or lumber.**

Lightweight, no UI, no bloat. Just does one thing and does it well.

---

## ✨ Features

| Feature | Description |
|---------|-------------|
| 🐴 **Auto-remount** | Mounts automatically after you finish looting a gathering node |
| 🪵 **Mounted gathering** | Won't interfere if you can gather without dismounting |
| 🎯 **Custom mount** | Choose a specific mount per character or account-wide |
| ⏱️ **Configurable delay** | Adjust the delay before mounting (default: 0.5s) |
| 🐻 **Druid-friendly** | Automatically skips druids (Travel Form is better!) |
| 🔔 **Error notifications** | Shows a message when mounting fails (in combat, interrupted, etc.) |
| 🌍 **10 languages** | English, French, German, Spanish, Italian, Portuguese, Russian, Korean, Chinese (Simplified & Traditional) |

---

## 📝 Commands

All commands start with `/fam`:

### Mount Settings

| Command | Description |
|---------|-------------|
| `/fam mount <name>` | Set mount for **this character** |
| `/fam account <name>` | Set mount for **all characters** |
| `/fam reset` | Reset character mount (use account setting) |
| `/fam reset account` | Reset account mount (use favorite) |

> 💡 **Tip:** Shift+click a mount in your journal to paste its name into chat!

### General Settings

| Command | Description |
|---------|-------------|
| `/fam enable` | Enable auto-mount |
| `/fam disable` | Disable auto-mount |
| `/fam delay <seconds>` | Set delay before mounting |
| `/fam silent` | Toggle error notifications on/off |
| `/fam debug` | Toggle debug mode (for troubleshooting) |

---

## 🚀 Getting Started

1. **Install the addon** via CurseForge or manually
2. **Go gather something** - the addon works out of the box!
3. *(Optional)* Set a specific mount with `/fam mount <name>`

### Default Behavior

- Uses your **favorite mount** if no mount is configured
- **0.5 second delay** before mounting (avoids mounting during looting animation)
- Error notifications **enabled** by default

---

## 🔧 Examples

```
/fam mount Swift Spectral Tiger
→ Sets "Swift Spectral Tiger" for this character

/fam account Reins of the Grand Expedition Yak
→ Sets the yak for all your characters

/fam delay 1
→ Waits 1 second before mounting

/fam reset
→ This character now uses the account mount (or favorite)
```

---

## ❓ FAQ

### I can gather lumber while mounted, will the addon cause issues?
No! The addon detects if you're already mounted and won't try to remount.

### Why doesn't it work for my Druid?
Druids are automatically skipped! Travel Form is instant and better than any mount. The addon assumes you're using it.

### The addon mounted while I was still looting!
Increase the delay: `/fam delay 1` (or more)

### I don't want error messages in chat
Toggle them off: `/fam silent`

### How do I see what's happening?
Enable debug mode: `/fam debug`

### Does it work with [Mount Addon X]?
Yes! Farm Auto Mount just calls `C_MountJournal.SummonByID()`. It's compatible with any mount manager.

---

## 🐛 Bug Reports & Feature Requests

Found a bug? Have an idea?

- **GitHub Issues:** [github.com/Schlouppy/FarmAutoMount/issues](https://github.com/Schlouppy/FarmAutoMount/issues)
- **CurseForge Comments:** [curseforge.com/wow/addons/farmautomount](https://www.curseforge.com/wow/addons/farmautomount)

---

## 🤝 Contributing

Want to help? Pull requests are welcome!

1. Fork the repository
2. Make your changes
3. Submit a pull request

---

## 📜 Changelog

### v1.1.3
- 🪵 Mounted gathering support (won't remount if already mounted)
- 🔧 Updated Interface version for WoW 12.0.0.1

### v1.1.0
- ✨ Error notifications when mounting fails
- ✨ `/fam silent` command to toggle notifications
- ⚡ Performance: stores mount ID instead of name
- 🔧 Empty mount name validation
- 🔧 Only collected mounts can be selected
- 🔄 Auto-migration from v1.0.x

### v1.0.0
- 🎉 Initial release

---

## 📄 License

Free to use, modify, and share. No donation required - just happy to share!

---

Made with ❤️ by **Schlouppy**
