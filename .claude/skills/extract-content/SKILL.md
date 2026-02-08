---
name: extract-content
description: Interprète les données brutes extraites par Gemini API et les structure
---

## Quand utiliser
Quand tu reçois un JSON de contenu extrait par Gemini dans `_incoming.json`.

## Process
1. Valide la complétude du JSON (title, rawContent, date obligatoires)
2. Si `sourceType` = "video" → cherche les timestamps clés dans le contenu
3. Si `sourceType` = "tweet" → reconstitue le thread complet
4. Nettoie le contenu : supprime navigation, pubs, footers résiduels
5. Identifie la langue et traduis les points clés en français si nécessaire
6. Enrichis les `suggestedTopics` avec ta connaissance de l'ontologie existante
7. Retourne le contenu structuré prêt pour la rédaction

## Champs JSON attendus
```json
{
  "title": "string (obligatoire)",
  "author": "string",
  "date": "YYYY-MM-DD (obligatoire)",
  "sourceType": "article|video|tweet|post|paper",
  "language": "fr|en|...",
  "rawContent": "string markdown (obligatoire)",
  "suggestedTopics": ["string"],
  "suggestedCategory": "pro|perso",
  "keyEntities": ["string"],
  "originalUrl": "string",
  "userTags": ["string"],
  "userComment": "string|null",
  "addedDate": "YYYY-MM-DD"
}
```
