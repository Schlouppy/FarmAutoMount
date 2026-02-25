# Instructions Claude - FarmAutoMount

Basé sur les instructions racine du projet Tool wow.

## Environnement

- Shell: PowerShell ou Bash (PAS de CMD)
- OS: Windows
- Dossier racine du repo: `F:\Docs nextcloud\Divers\Tool wow\FarmAutoMount\`

## Règle importante

>>> TOUJOURS demander où placer les nouveaux fichiers/scripts <<<

## Git - OBLIGATION

**Commit + push TOUT après chaque modification, sans exception.**

FarmAutoMount a son **propre dépôt Git** :
```
cd "F:\Docs nextcloud\Divers\Tool wow\FarmAutoMount"
git add <fichiers>
git commit -m "feat|fix|update|refactor: description"
git push
```

Repo : https://github.com/Schlouppy/FarmAutoMount
Publié sur CurseForge.

Format commits : `feat:` `fix:` `update:` `refactor:` `docs:`

## But du sous-projet

Addon WoW qui remonte automatiquement en monture après une récolte (herbes, minerai, bois).

## Version actuelle

1.1.3 — Support récolte en monture, check IsMounted()

## Fichiers clés

- `FarmAutoMount.lua` — Code principal
- `FarmAutoMount.toc` — Métadonnées addon (version, dépendances)
- `GatheringSpells.lua` — Liste spell IDs par métier/extension
- `Locales.lua` — Traductions (10 langues)
- `logo.tga` — Icône addon
- `curseforge_description.txt` — Description pour CurseForge

Symlink actif vers `E:\Jeux\World of Warcraft\_retail_\Interface\AddOns\FarmAutoMount`
→ Les modifs sont directement appliquées dans WoW.

## Fonctionnalités

- Détection récolte via spell IDs (GatheringSpells.lua)
- Monture configurable par perso (`/fam mount`) et par compte (`/fam account`)
- Skip druide automatique (Travel Form)
- Delay configurable
- Mode debug (`/fam debug`)
- SavedVariables (compte + par personnage)

## Publication CurseForge

Après chaque release : mettre à jour version dans `.toc`, commiter, pusher,
puis uploader manuellement sur CurseForge si nouvelle version publique.

## Préférences

- Langue : Français
- Interface addon : Français préféré
- Réponses concises
- Expliquer avant de faire (mode apprentissage)
- Pas d'emojis sauf demande explicite
