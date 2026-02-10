# Workflows IA et dev tools personnalisés : l'approche de CJ Hess

## Métadonnées
- **Source** : [How to build a workflow that lets AI handle 90%+ of your front-end coding | CJ Hess (Tenex)](https://www.youtube.com/watch?v=LC1mKvLWZ2E&t=290s)
- **Type** : vidéo
- **Auteur** : Claire Vo (How I AI), interview de CJ Hess (10X)
- **Date publication** : 2026-02-10
- **Date ajout** : 2026-02-10
- **Domaine** : pro
- **Tags** : #claude-code #devtools #skills #workflows #flowy #code-review #codex
- **Confiance** : ⭐⭐⭐⭐ (praticien expérimenté avec outils open-source, démonstration live convaincante, mais approche très personnelle)

## TL;DR
> CJ Hess montre comment il a construit un écosystème de dev tools personnalisés autour de Claude Code, notamment Flowy — un outil de flowcharts et mockups UI pilotable par l'IA via des skills. Il démonte aussi son workflow de revue de code modèle-contre-modèle (Claude + Codex) et plaide pour que chaque développeur construise ses propres outils maintenant que le coût est quasi nul.

## Points clés
- **Flowy — outil de diagrammes piloté par IA** : Un éditeur web de flowcharts et mockups UI qui génère/lit des fichiers JSON, permettant à Claude Code de créer et modifier des diagrammes visuels via des skills dédiées
- **Les skills comme langage partagé** : Les skills permettent à Claude de comprendre les outils propriétaires — elles sont raffinées itérativement à chaque erreur détectée lors de l'utilisation
- **Revue modèle-contre-modèle** : Utiliser Codex (GPT 5.2) pour relire le code de Claude — particulièrement efficace pour détecter les code smells et proposer des refactors architecturaux
- **Build > Buy pour les dev tools** : Le coût de construction d'outils personnalisés est devenu négligeable — chaque développeur devrait construire les siens
- **Claude Code excelle en intent understanding** : La capacité de Claude à comprendre l'intention profonde des prompts est son avantage distinctif, plus que la "raw intelligence"
- **Mode bypass permissions** : CJ travaille en mode `--dangerously-skip-permissions` (alias "Kevin") avec des guardrails au niveau Git/PR

## Concepts & Méthodologies

### Workflow de développement avec Flowy
```
1. EXPLORER  → Sub-agents parallèles pour analyser le codebase
2. DIAGRAMMER → Claude crée des flowcharts (flux utilisateur, timing d'animation) via skill Flowy
3. MAQUETTER → Claude crée des UI mockups via une seconde skill Flowy
4. ITÉRER    → L'utilisateur modifie visuellement dans l'éditeur, Claude lit le JSON mis à jour
5. IMPLÉMENTER → Claude implémente directement depuis les diagrammes et mockups
```

### Structure des skills Flowy
- **Skill overview** : Vue d'ensemble des commandes et format des fichiers
- **Skill flowcharts** : Détails sur les nœuds, arêtes, formes, système de couleurs sémantiques
- **Skill UI mockups** : Spécifications pour les wireframes interactifs
- Les skills sont des fichiers markdown itérativement améliorés — gérés par l'agent lui-même

### Revue de code par un second modèle
Prompt structuré en 4 axes pour Codex :
1. Le code reflète-t-il fidèlement les diagrammes/mockups ?
2. Y a-t-il des code smells ?
3. Quelle approche alternative pour un refactor global ?
4. Résultat : Codex écrit directement les corrections

→ Voir aussi : [[2026-02-10-compound-engineering.md]] (boucle plan/work/assess/compound et revue multi-perspective)
→ Voir aussi : [[2026-02-10-agent-skills-paradigme.md]] (architecture des skills comme connaissances procédurales)

## Pense-bêtes
- Construire mes propres outils de visualisation pour communiquer avec Claude Code — le format visuel est plus efficace que le markdown pour valider un design
- Quand un skill ne fonctionne pas bien → corriger le skill immédiatement, pas contourner le problème
- Les sub-agents d'exploration (`Explore`) sont essentiels pour l'ancrage contextuel — en lancer plusieurs en parallèle sur un gros codebase
- Penser à utiliser un second modèle (Codex, GPT 5.2) pour la revue de code plutôt que self-review
- Le JSON comme lingua franca entre l'humain (éditeur visuel) et l'IA (lecture/écriture de fichiers)
- Skipping plan mode est viable quand les artefacts visuels (flowcharts + mockups) servent déjà de plan

## Citation notable
> "Working with Claude is just such a delight. It just feels so steerable and I think the one thing it really has is intent understanding." — CJ Hess

## Contenu détaillé

CJ Hess, développeur mobile chez 10X, présente dans cette interview son écosystème de développement centré sur Claude Code. Son outil phare est **Flowy**, une application web qu'il a construite en un après-midi via un "Ralph loop" (boucle de prompting itérative). Flowy permet de créer des flowcharts et des mockups UI sous forme de fichiers JSON, que Claude Code peut lire et écrire via des skills dédiées.

Le **workflow typique** commence par des sub-agents d'exploration lancés en parallèle pour comprendre le codebase. Puis Claude génère des diagrammes Flowy — par exemple un diagramme de timing d'animation et un flux utilisateur pour une feature de "spinner wheel". L'utilisateur peut modifier visuellement ces diagrammes dans l'éditeur web, et Claude re-lit le JSON modifié pour s'adapter. Contrairement à Mermaid, Flowy est extensible : CJ peut ajouter des features à l'outil et mettre à jour les skills correspondantes.

Les **skills sont auto-gérées** par l'agent. CJ a un meta-skill pour créer d'autres skills, et chaque développement sur Flowy inclut la mise à jour de la documentation et des skills associées. Le processus de raffinement est empirique : quand quelque chose ne fonctionne pas (par exemple, du texte blanc sur fond pastel), CJ note le problème et demande à Claude d'améliorer le skill.

Pour la **revue de code**, CJ utilise Codex (GPT 5.2) comme second regard. Il trouve que Codex n'est pas forcément meilleur pour écrire du code, mais excelle en revue — détectant les incohérences entre mockups et implémentation, les code smells, et proposant des refactors structurels. Codex peut ensuite appliquer directement les corrections.

CJ plaide fortement pour le **build over buy** dans les dev tools. Le coût de construction d'outils personnalisés est devenu quasi nul avec les LLM, et la possibilité de les personnaliser exactement à son workflow est un avantage majeur. Il anticipe que la communication humain-agent va évoluer bien au-delà du markdown et du prompting textuel, vers des formats visuels et interactifs — possiblement même des applications générées à la volée par l'agent pour faciliter la communication.

Claire Vo souligne que ce workflow est l'équivalent IA-natif du processus classique product/design (flowcharts → wireframes → specs → implémentation), mais compressé en quelques minutes au lieu de sprints entiers. L'épisode démontre concrètement comment un développeur peut construire un système de développement personnalisé où l'IA gère 90%+ du coding front-end.
