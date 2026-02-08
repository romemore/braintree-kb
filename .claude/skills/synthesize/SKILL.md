---
name: synthesize
description: Génère ou met à jour la synthèse d'un dossier (_index.md)
---

## Process
1. Lis toutes les fiches du dossier (et sous-dossiers)
2. Identifie les thèmes récurrents, les méthodologies, les patterns
3. Rédige une synthèse narrative (pas une liste)
4. Liste les méthodologies découvertes avec renvoi aux fiches
5. Génère la table des fiches (triée par date décroissante)
6. Identifie les connexions avec d'autres branches de l'ontologie
7. Date de dernière mise à jour = maintenant

## Format de sortie (_index.md)

```markdown
# [Nom du domaine/sous-domaine]

## Synthèse des apprentissages
Paragraphe de synthèse : ce que l'ensemble des fiches de ce dossier
m'a appris, les patterns récurrents, les méthodologies clés.

## Méthodologies découvertes
- **Méthodologie 1** : description courte → [fiche source](lien)
- **Méthodologie 2** : description courte → [fiche source](lien)

## Concepts clés
- **Concept A** : définition opérationnelle → [fiches](liens)

## Fiches (XX au total)
| Date | Titre | Auteur | Tags |
|------|-------|--------|------|
| ... | [lien](chemin) | ... | ... |

## Connexions
Liens vers les dossiers/fiches connexes dans d'autres branches de l'ontologie.

---
*Dernière mise à jour : YYYY-MM-DD*
*Générée automatiquement par Claude Code — ne pas éditer manuellement*
```
