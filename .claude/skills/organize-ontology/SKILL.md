---
name: organize-ontology
description: Gère la structure de dossiers de la base de connaissances
---

## Algorithme de placement
1. Lis les topics suggérés par Gemini (`suggestedTopics`, `suggestedCategory`)
2. Parcours l'arborescence existante (`pro/` et `perso/`)
3. Cherche le meilleur match :
   - Match exact de dossier existant → place ici
   - Match partiel → vérifie le `_index.md` du candidat pour confirmer
   - Aucun match → crée un nouveau dossier si c'est le 2ème contenu orphelin
   - Sinon → place dans un dossier `_inbox/` temporaire
4. Si création de dossier : initialise avec un `_index.md` minimal

## Ontologie actuelle

### Pro
- `pro/architecture/` — microservices, api-design, system-design
- `pro/ia-et-llm/` — agents, prompt-engineering, rag-et-context
- `pro/engineering-practices/` — testing, devops, code-quality
- `pro/management-et-orga/`
- `pro/veille-marche/`

### Perso
- `perso/productivite/`
- `perso/finance/`
- `perso/sante/`
- `perso/apprentissage/`

## Réorganisation
- Quand invoqué avec `/reindex` :
  - Parcours toute l'arborescence
  - Vérifie la cohérence de chaque fiche avec son dossier
  - Propose des déplacements dans `_suggestions.md`
  - Régénère tous les `_index.md`
- Seuil de création de nouveau dossier : ≥ 2 fiches orphelines
- Fusion si recouvrement > 70% entre deux dossiers
- Promotion d'un sous-dossier si il grossit suffisamment
