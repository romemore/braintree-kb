---
name: write-fiche
description: Rédige une fiche de connaissance structurée à partir de contenu extrait
---

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
- **Confiance** : ⭐⭐⭐⭐ (1-5)

## TL;DR
> Résumé en 2-3 phrases maximum.

## Points clés
- Point 1 : explication concise
- Point 2 : explication concise
- Point 3 : explication concise

## Concepts & Méthodologies
Description des frameworks, patterns ou méthodologies introduits.
→ Voir aussi : [[chemin/relatif/fiche.md]]

## Pense-bêtes
Ce que je veux retenir pour application concrète.

## Citation notable
> "Citation courte et marquante" — Auteur

## Contenu détaillé
Résumé structuré de 300-500 mots du contenu source.
```

## Règles de rédaction
- Français systématique (sauf titres originaux et noms)
- TL;DR = 2-3 phrases, pas plus
- Points clés = 3 à 7 items, chacun actionnable
- Concepts & Méthodologies = ce qui est nouveau ou remarquable
- Cross-références : cherche dans la base existante les fiches liées
- Le résumé détaillé fait 300-500 mots, jamais de copier-coller du source
- Score de confiance basé sur :
  - Réputation source (1pt)
  - Preuves/data (1pt)
  - Auteur reconnu (1pt)
  - Recoupement avec d'autres sources (1pt)
  - Fraîcheur (1pt)

## Nommage du fichier
Format : `YYYY-MM-DD-slug-court.md`
- La date est la date de publication de la source
- Le slug est un résumé court en kebab-case (3-5 mots max)
