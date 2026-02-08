---
name: process-url
description: Traite un nouveau contenu et l'intègre dans la base de connaissances
---

Reçois le contenu extrait dans `_incoming.json` à la racine de la knowledge base.

Workflow :
1. Lis `_incoming.json` — il contient le JSON structuré extrait par Gemini
2. Utilise le skill `extract-content` pour interpréter et nettoyer les données
3. Utilise le skill `organize-ontology` pour déterminer le placement dans l'arborescence
4. Utilise le skill `write-fiche` pour rédiger la fiche markdown
5. Place la fiche dans le bon dossier
6. Mets à jour le `_index.md` du dossier (utilise le skill `synthesize` si nécessaire)
7. Mets à jour `_global_index.md` et `_sources.md`
8. Commit git : `feat(kb): add [slug] to [chemin]`
9. Affiche le résultat final en JSON : `{"fichePath": "...", "tldr": "..."}`
