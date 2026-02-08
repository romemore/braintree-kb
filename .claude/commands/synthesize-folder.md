---
name: synthesize-folder
description: Régénère la synthèse d'un dossier spécifique
---

Argument attendu : chemin du dossier (ex: `pro/architecture/microservices`)

1. Vérifie que le dossier existe
2. Lis toutes les fiches `.md` du dossier (hors `_index.md`)
3. Utilise le skill `synthesize` pour générer le nouveau `_index.md`
4. Mets à jour le `_index.md` du dossier parent si nécessaire
5. Commit : `chore(kb): synthesize [chemin]`
