# Recursive Language Models : dépasser les limites de la fenêtre de contexte

## Métadonnées
- **Source** : [AlphaSignal AI — Recursive Language Models](https://x.com/AlphaSignalAI/status/2021069299402862672)
- **Type** : paper
- **Auteur** : Alex L. Zhang, Tim Kraska, Omar Khattab (MIT CSAIL)
- **Date publication** : 2025-12-31 (v1), 2026-01-28 (v2)
- **Date ajout** : 2026-02-11
- **Domaine** : pro
- **Tags** : #llm #contexte-long #inference #recursion #architecture-modeles #MIT
- **Confiance** : ⭐⭐⭐⭐ (MIT CSAIL, résultats benchmarkés, code open-source, repris par la communauté)

## TL;DR
> Les Recursive Language Models (RLM) permettent aux LLM de traiter des entrées jusqu'à 100x plus longues que leur fenêtre de contexte en traitant le prompt comme un environnement externe que le modèle peut explorer récursivement via du code Python. RLM-Qwen3-8B surpasse le Qwen3-8B de base de 28,3% et approche les performances de GPT-5 vanilla sur des tâches long-contexte.

## Points clés
- **Approche** : au lieu d'injecter tout le contexte dans le modèle, le prompt est chargé comme variable dans un environnement REPL Python que le LLM peut interroger programmatiquement
- **Performance** : RLM(GPT-5-mini) surpasse GPT-5 de 34+ points (~114%) sur le benchmark OOLONG (132K tokens)
- **Scalabilité** : fonctionne sur des entrées de 10M+ tokens (1000 documents) avec des performances maintenues là où les approches standard dégradent
- **Post-entraînement** : RLM-Qwen3-8B est le premier modèle nativement récursif, +28,3% vs Qwen3-8B de base

## Concepts & Méthodologies

### Architecture RLM
Le modèle racine (depth=0) ne voit jamais l'intégralité du contexte. Il interagit avec un environnement Python REPL où le texte d'entrée est stocké comme variable. Le LLM écrit et exécute du code pour explorer, filtrer et décomposer le contexte, puis peut s'appeler récursivement (depth=1) sur des sous-parties.

### Stratégies émergentes
Les RLM développent naturellement plusieurs stratégies sans qu'on les programme :
- **Peeking** : échantillonner les premières sections pour comprendre la structure
- **Grepping** : filtrage par regex/mots-clés pour réduire l'espace de recherche
- **Partition + Map** : découpage du contexte en chunks avec appels récursifs sur chaque sous-partie
- **Summarization** : condensation de l'information pour les décisions du LLM parent

### Différence avec les agents
Les RLM se distinguent des agents classiques : la décomposition du contexte est une décision du LM lui-même, pas un design centré sur le problème imposé de l'extérieur.

→ Voir aussi : [Les deux patterns d'intégration agent-sandbox](../agents/2026-02-10-sandbox-agent-patterns.md) — les RLM utilisent un pattern similaire où l'environnement (REPL) est un outil externe du modèle

## Pense-bêtes
- Les RLM sont un wrapper autour de n'importe quel LLM, pas une architecture à réentraîner — applicable immédiatement
- Même un petit modèle (GPT-5-mini) avec RLM bat un gros modèle (GPT-5) en brut sur le contexte long → le raisonnement récursif compense la taille
- Le coût par requête reste comparable aux approches standard malgré les appels récursifs
- Profondeur récursive limitée à 1 pour l'instant (root → child), pas de récursion profonde
- Librairie open-source disponible : github.com/alexzhang13/rlm

## Citation notable
> "Instead of feeding the entire input directly into the neural network, the input is treated as part of the environment that the LLM can symbolically interact with." — Zhang et al.

## Contenu détaillé

Les Recursive Language Models (RLM) introduisent une stratégie d'inférence qui change fondamentalement la façon dont les LLM gèrent les entrées longues. Plutôt que d'augmenter la taille de la fenêtre de contexte (qui entraîne une dégradation des performances connue sous le nom de "context rot"), les RLM externalisent le contexte dans un environnement programmatique.

**Fonctionnement technique** : le prompt long est chargé comme variable Python dans un REPL (Read-Eval-Print Loop). Le LLM racine reçoit seulement la question et des instructions, puis interagit avec le contexte en écrivant du code Python : lecture de segments, filtrage par regex, comptage, etc. Quand une sous-tâche est trop complexe, le LLM peut s'appeler récursivement sur un sous-ensemble du contexte.

**Benchmarks clés** : sur OOLONG (132K tokens, tâches de classification sémantique sur 3000-6000 entrées structurées), RLM(GPT-5-mini) surpasse GPT-5 brut de 114%. Sur BrowseComp-Plus (recherche multi-hop dans des corpus de documents), RLM(GPT-5) atteint des performances parfaites sur 1000 documents (~10M tokens) alors que les approches standard comme ReAct+BM25 échouent à cette échelle.

**Post-entraînement** : les auteurs ont fine-tuné Qwen3-8B pour créer RLM-Qwen3-8B, le premier modèle "nativement récursif". Ce modèle de 8B paramètres surpasse sa base de 28,3% en moyenne et approche les performances de GPT-5 vanilla sur trois tâches long-contexte — une démonstration que la récursion peut être internalisée par le modèle.

**Limitations actuelles** : la profondeur récursive est limitée à 1, pas d'optimisation de cache de préfixe ni d'exécution asynchrone, et le temps d'exécution varie de quelques secondes à plusieurs minutes selon la stratégie de partitionnement adoptée.

Le paper (arXiv:2512.24601) et le code sont disponibles en open-source sous licence Creative Commons Attribution 4.0.
