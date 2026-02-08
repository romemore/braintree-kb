---
name: reindex
description: Régénère tous les fichiers _index.md de la base
---

Parcours toute l'arborescence de la knowledge base.

Pour chaque dossier contenant des fiches `.md` (hors `_index.md` et fichiers commençant par `_`) :
1. Lis toutes les fiches du dossier
2. Utilise le skill `synthesize` pour régénérer le `_index.md`
3. Remonte au dossier parent et mets à jour son `_index.md` également

Termine par la mise à jour de :
- `_global_index.md` (index global cross-domaines)
- `_sources.md` (registre de toutes les sources)

Commit final : `chore(kb): reindex all _index.md files`
