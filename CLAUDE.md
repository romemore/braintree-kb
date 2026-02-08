# Knowledge Base — Instructions Claude Code

## Contexte
Tu gères une base de connaissances personnelle alimentée par un bot Telegram.
Tu reçois du contenu extrait par Gemini (JSON) et tu dois l'intégrer proprement.

## Règles absolues
1. Toutes les fiches sont rédigées en **français**
2. Les titres originaux et noms d'auteurs restent dans leur langue source
3. Ne jamais supprimer de fiche existante sans instruction explicite
4. Toujours commit git après modification
5. Un `_index.md` par dossier, TOUJOURS à jour

## Ontologie
- Premier niveau de séparation : `pro/` vs `perso/`
- L'arborescence est dynamique : crée de nouveaux dossiers si nécessaire
- Seuil de création : ≥ 2 fiches orphelines sur un même sujet
- Chaque fiche a un nom au format : `YYYY-MM-DD-slug-court.md`
- Chaque dossier a un `_index.md` de synthèse

## Workflow de traitement
1. Lis le JSON d'entrée (`_incoming.json` à la racine)
2. Détermine le chemin ontologique (domaine/sous-domaine)
3. Crée le dossier si nécessaire + son `_index.md`
4. Écris la fiche selon le template (voir skill write-fiche)
5. Mets à jour le `_index.md` du dossier
6. Mets à jour les `_index.md` parents si la synthèse change
7. Mets à jour `_global_index.md` et `_sources.md`
8. Commit : `feat(kb): add [slug] to [chemin]`

## Template de fiche

```markdown
# [Titre court descriptif]

## Métadonnées
- **Source** : [URL originale](url)
- **Type** : article | vidéo | tweet | post | paper
- **Auteur** : Nom
- **Date publication** : YYYY-MM-DD
- **Date ajout** : YYYY-MM-DD
- **Domaine** : pro | perso
- **Tags** : #tag1 #tag2 #tag3
- **Confiance** : ⭐⭐⭐⭐ (1-5, évaluation qualité/fiabilité)

## TL;DR
> Résumé en 2-3 phrases maximum.

## Points clés
- Point 1 : explication concise
- Point 2 : explication concise
- Point 3 : explication concise

## Concepts & Méthodologies
Description des frameworks, patterns ou méthodologies introduits.
Liens vers d'autres fiches de la base qui traitent de sujets connexes :
→ Voir aussi : [[chemin/relatif/fiche.md]]

## Pense-bêtes
Ce que je veux retenir pour application concrète.

## Citation notable
> "Citation courte et marquante" — Auteur

## Contenu détaillé
Résumé structuré de 300-500 mots du contenu source.
```

## Qualité
- Liens internes en chemins relatifs markdown
- Cross-références quand tu détectes des connexions thématiques
- Pense-bêtes = ce qui est actionnable, pas un résumé
- Confiance : évalue sur la base de la source, l'auteur, les preuves citées
  - Réputation source (1pt), preuves/data (1pt), auteur reconnu (1pt),
    recoupement avec d'autres sources (1pt), fraîcheur (1pt)

## Maintenance
- Sur commande `/reindex` : régénère tous les `_index.md`
- Sur commande `/synthesize` : régénère la synthèse d'un dossier spécifique
- Détecte les doublons potentiels et signale-les dans `_suggestions.md`
