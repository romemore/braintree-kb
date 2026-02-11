# Observational Memory : une mémoire bio-inspirée pour agents IA

## Métadonnées
- **Source** : [Mastra — Observational Memory](https://x.com/i/article/2021152822264201218)
- **Type** : article
- **Auteur** : Tyler Barnes (Mastra)
- **Date publication** : 2026-02-09
- **Date ajout** : 2026-02-11
- **Domaine** : pro
- **Tags** : #agents #mémoire #contexte-long #benchmark #LongMemEval #prompt-caching #open-source
- **Confiance** : ⭐⭐⭐⭐ (benchmarks publics reproductibles, SoTA sur LongMemEval, code open-source, repris par VentureBeat)

## TL;DR
> Mastra lance Observational Memory, un système de mémoire textuel pour agents IA qui atteint 94,87% sur LongMemEval (nouveau SoTA) sans nécessiter de base vectorielle ni de graph DB. Deux agents de fond (Observer et Reflector) compriment les conversations en observations structurées, réduisant les coûts d'un facteur 3-40x grâce à la compatibilité avec le prompt caching.

## Points clés
- **Textuel pur** : pas de vector DB ni de graph DB — la mémoire est stockée sous forme de texte structuré, ce qui la rend débugable et portable
- **SoTA LongMemEval** : 94,87% avec gpt-5-mini, battant l'oracle gpt-4o de 2 points et le précédent SoTA (Supermemory, 81,60%) de 13 points
- **Compression 3-40x** : ratio de 3-6x pour du texte conversationnel, jusqu'à 5-40x pour des agents à usage intensif d'outils
- **Prompt-cacheable** : architecture à deux blocs (observations + messages bruts) compatible avec le caching Anthropic/OpenAI

## Concepts & Méthodologies

### Architecture à deux blocs
Le contexte est divisé en deux parties :
1. **Bloc Observations** : résumés structurés et compressés des interactions passées
2. **Bloc Messages bruts** : messages récents non traités

### Mécanisme Observer/Reflector
- **Observer** : quand les messages bruts dépassent un seuil (défaut : 30K tokens), l'Observer les comprime en observations concises ajoutées au premier bloc
- **Reflector** : quand les observations dépassent leur seuil (défaut : 40K tokens), le Reflector fait le ménage — fusionne les observations liées, supprime l'obsolète

### Format des observations
Les observations utilisent un format texte structuré avec :
- **Trois dates** : date d'observation, date référencée, date relative — pour le raisonnement temporel
- **Priorité par emoji** : 🔴 (important), 🟡 (peut-être important), 🟢 (info)
- **Hiérarchie** : sous-observations indentées sous l'observation parente

### Optimisation du cache
Les messages s'accumulent jusqu'au seuil → cache hits complets à chaque tour. Après l'Observer, le préfixe stable permet des cache hits partiels. Seul le Reflector invalide le cache entier.

→ Voir aussi : [Recursive Language Models](2026-02-11-recursive-language-models.md) — approche complémentaire pour le contexte long, où le contexte est externalisé dans un REPL Python plutôt que compressé en observations

## Pense-bêtes
- Évaluer Mastra Memory pour des agents conversationnels à long terme — l'activation est une seule ligne de config (`observationalMemory: true`)
- Le format textuel rend le debugging beaucoup plus simple que les embeddings vectoriels — on peut lire et auditer la mémoire directement
- Attention au mode synchrone actuel : l'Observer bloque la conversation quand le seuil est atteint (mode async en cours de déploiement)
- Les seuils Observer (30K) et Reflector (40K) sont configurables — à ajuster selon le use case
- Complémentaire aux approches RAG classiques : OM pour la mémoire conversationnelle, RAG pour la knowledge base statique

## Citation notable
> "We process millions of pieces of sensory data and distill them down to one or two observations." — Tyler Barnes, sur l'inspiration cognitive de l'Observational Memory

## Contenu détaillé

Observational Memory (OM) est un système de mémoire pour agents IA développé par Mastra, inspiré du fonctionnement de la mémoire humaine. Au lieu de stocker l'intégralité des échanges ou de les vectoriser dans une base externe, OM utilise deux agents de fond — l'Observer et le Reflector — pour maintenir une fenêtre de contexte stable et comprimée.

**Architecture** : le contexte de l'agent est divisé en deux blocs. Le bloc d'observations contient des résumés structurés des interactions passées sous forme de texte. Le bloc de messages bruts contient la conversation récente. Cette séparation permet d'exploiter le prompt caching des providers (Anthropic, OpenAI) : tant que les observations ne changent pas, le préfixe du prompt est identique et bénéficie du cache.

**Mécanisme de compression** : quand les messages bruts atteignent 30K tokens (configurable), l'Observer entre en action et crée des observations — des notes concises datées et priorisées. Chaque observation porte trois dates (création, référence, relative) pour le raisonnement temporel, et un niveau de priorité (🔴/🟡/🟢). Quand les observations elles-mêmes dépassent 40K tokens, le Reflector les condense en fusionnant les items liés et en éliminant l'obsolète.

**Benchmarks** : sur LongMemEval, le benchmark de référence pour la mémoire conversationnelle longue, OM avec gpt-5-mini atteint 94,87% — le score le plus élevé jamais enregistré, surpassant l'oracle gpt-4o (qui ne reçoit que les conversations contenant la réponse) de 2 points. Avec gpt-4o comme modèle, OM atteint 84,23%, battant Supermemory (81,60%) et le full-context brut (60,20%).

**Avantages pratiques** : OM offre une compression de 3-6x sur du texte conversationnel et de 5-40x sur des agents à usage intensif d'outils. L'absence de dépendance externe (pas de vector DB, pas de graph DB) simplifie le déploiement et le debugging. Le format texte permet d'inspecter directement la mémoire de l'agent.

**Limitation actuelle** : le traitement par l'Observer est synchrone — il bloque la conversation quand le seuil est atteint. Un mode asynchrone avec buffering en arrière-plan est en cours de déploiement. L'implémentation est entièrement open-source dans le framework Mastra.
