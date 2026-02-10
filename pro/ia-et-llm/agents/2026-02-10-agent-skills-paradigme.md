# Agent Skills : le nouveau paradigme pour les agents IA

## Métadonnées
- **Source** : [Don't Build Agents, Build Skills Instead – Barry Zhang & Mahesh Murag, Anthropic](https://www.youtube.com/watch?v=CEvIs9y1uog)
- **Type** : vidéo
- **Auteur** : Barry Zhang & Mahesh Murag (Anthropic)
- **Date publication** : 2026-02-10
- **Date ajout** : 2026-02-10
- **Domaine** : pro
- **Tags** : #agents #skills #anthropic #claude #mcp #architecture-agent
- **Confiance** : ⭐⭐⭐⭐⭐ (source directe Anthropic, auteurs créateurs du système, contenu récent)

## TL;DR
> Anthropic propose de remplacer la construction d'agents spécialisés par des "skills" — des dossiers structurés de connaissances procédurales composables qui donnent aux agents généralistes une expertise de domaine. L'architecture convergente combine une boucle agent, un runtime avec système de fichiers, des serveurs MCP pour la connectivité, et une bibliothèque de skills progressivement chargées en contexte.

## Points clés
- **Le code comme interface universelle** : Après avoir construit Claude Code, Anthropic a réalisé qu'un agent codeur est en réalité un agent généraliste — il peut appeler des APIs, manipuler des fichiers, analyser avec Python, et synthétiser dans tout format via le code
- **Skills = dossiers organisés** : Les skills sont des collections de fichiers (markdown + scripts) qui encapsulent des connaissances procédurales composables, versionnables dans Git, partageables simplement
- **Progressive disclosure** : Seule la métadonnée du skill est affichée au modèle ; le contenu complet est chargé uniquement quand l'agent décide d'utiliser le skill, protégeant ainsi la fenêtre de contexte
- **Écosystème en croissance rapide** : Milliers de skills créés en 5 semaines — skills fondationnels, tiers (Browserbase, Notion), et entreprise
- **Architecture convergente** : Agent loop + runtime (bash/filesystem) + MCP servers + skills library

## Concepts & Méthodologies

### Architecture des agents généralistes
L'architecture converge vers 4 composants :
1. **Agent loop** — gestion du contexte interne du modèle (tokens in/out)
2. **Runtime environment** — système de fichiers + capacité d'exécution de code
3. **MCP servers** — connectivité avec outils et données externes
4. **Skills library** — bibliothèque de centaines/milliers de skills chargés à la demande

### Anatomie d'un skill
- `skill.md` — métadonnées (affichées au modèle en permanence)
- Instructions principales + répertoire du dossier
- Scripts comme outils (Python, bash, etc.)
- Assets, fichiers, binaires complémentaires

### Analogie computing
| Couche computing | Couche IA |
|-----------------|-----------|
| Processeur | Modèle (LLM) |
| Système d'exploitation | Agent runtime |
| Applications | Skills |

### Skills vs MCP
- **MCP** = connexion au monde extérieur (données, outils)
- **Skills** = expertise de domaine (connaissances procédurales)
- Les deux sont complémentaires : les skills orchestrent des workflows de multiples outils MCP

## Pense-bêtes
- Structurer mes propres workflows récurrents comme des skills (dossier + instructions + scripts)
- Un skill bien fait remplace des heures de prompt engineering à chaque session
- Penser "progressive disclosure" : ne charger que les métadonnées, pas tout le contenu
- Les scripts dans les skills résolvent le problème de la reproductibilité (vs code régénéré à chaque fois)
- Pour une équipe : les skills sont un moyen concret de capitaliser les best practices et le contexte institutionnel

## Citation notable
> "Who do you want doing your taxes? Is it going to be Mahesh, the 300 IQ mathematical genius, or is it Barry, an experienced tax professional? Agents today are a lot like Mahesh. They're brilliant, but they lack expertise." — Barry Zhang

## Contenu détaillé

Barry Zhang et Mahesh Murag d'Anthropic présentent les **agent skills**, un nouveau paradigme pour rendre les agents IA plus utiles sans reconstruire un agent spécialisé pour chaque domaine.

Le constat de départ : après le lancement de Claude Code, Anthropic a réalisé que le code est l'interface universelle vers le monde numérique. Un agent codeur peut appeler des APIs, organiser des fichiers, analyser des données en Python et produire des rapports — c'est un agent généraliste. Le scaffolding peut se réduire à bash + système de fichiers.

Mais ce minimalisme révèle un problème : **l'expertise de domaine**. Un agent brillant mais généraliste manque de connaissances spécifiques pour exécuter des tâches professionnelles de manière fiable et cohérente.

Les **skills** répondent à ce besoin. Ce sont des dossiers contenant des fichiers markdown (instructions, procédures) et des scripts (outils réutilisables). Cette simplicité est délibérée : n'importe qui, humain ou agent, peut créer et utiliser un skill. Ils se versionnent dans Git, se partagent via Google Drive ou zip.

Le mécanisme de **progressive disclosure** est central : au runtime, seule la métadonnée du skill est visible dans le contexte du modèle. Quand l'agent décide d'utiliser un skill, il charge alors les instructions complètes et le contenu du dossier. Cela permet d'avoir des centaines de skills disponibles sans saturer la fenêtre de contexte.

En 5 semaines depuis le lancement, l'écosystème compte déjà des milliers de skills répartis en trois catégories : **fondationnels** (capacités générales comme la création de documents Office), **tiers** (Browserbase pour l'automatisation web, Notion pour la recherche dans les workspaces), et **entreprise** (best practices organisationnelles, guides de style de code, procédures internes).

L'architecture émergente des agents généralistes converge vers : une boucle agent, un runtime avec système de fichiers, des serveurs MCP pour la connectivité externe, et une bibliothèque de skills. Anthropic a déjà déployé ce modèle pour lancer des offres verticales en services financiers et sciences de la vie.

Pour l'avenir, Anthropic explore le testing et l'évaluation des skills, le versioning, les dépendances entre skills et MCP servers, et surtout la capacité pour Claude de **créer ses propres skills** — ouvrant la voie à un apprentissage continu et transférable entre sessions.
