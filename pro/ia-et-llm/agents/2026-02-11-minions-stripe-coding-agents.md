# Minions : les agents de code one-shot de Stripe

## Métadonnées
- **Source** : [Minions: Stripe's one-shot, end-to-end coding agents](https://stripe.dev/blog/minions-stripes-one-shot-end-to-end-coding-agents)
- **Type** : article
- **Auteur** : Alistair Gray (Stripe)
- **Date publication** : 2026-02-09
- **Date ajout** : 2026-02-11
- **Domaine** : pro
- **Tags** : #agents #stripe #coding-agents #devtools #automation #CI #MCP
- **Confiance** : ⭐⭐⭐⭐⭐ (source officielle Stripe, données internes, auteur ingénieur Stripe)

## TL;DR
> Stripe a développé "Minions", des agents de code internes qui produisent plus de 1 000 PRs mergées par semaine sans code écrit par un humain. Construits sur un fork de Goose (Block) avec des devboxes isolées et 400+ outils MCP internes, ils illustrent l'approche "build over buy" pour adapter les agents IA à un codebase massif et contraint.

## Points clés
- **Scale de production** : 1 000+ PRs/semaine, 100% générées par agents, review humaine uniquement
- **Build over buy** : codebase de centaines de millions de lignes, Ruby + Sorbet, libs propriétaires → impossible d'utiliser des outils génériques
- **Architecture fondamentale** : devboxes pré-chauffées (10s de spin-up) + fork de Goose + MCP avec 400+ outils internes ("Toolshed")
- **Feedback shift-left** : lint heuristique (<5s) → CI sélective (3M+ tests) → autofixes → max 2 tours de CI par run

## Concepts & Méthodologies

### Architecture Minions
L'architecture repose sur trois piliers :
1. **Devboxes** : environnements isolés pré-chargés avec le code Stripe, prêts en 10 secondes
2. **Agent Loop** : fork de Goose (Block) avec étapes déterministes (git, lint, tests) intercalées avec l'agent LLM
3. **MCP + Toolshed** : serveur MCP interne exposant 400+ outils couvrant systèmes internes et SaaS

### Hydratation pré-run
Avant le démarrage de l'agent, exécution déterministe des outils MCP pertinents pour injecter le contexte nécessaire. Réduit le temps de raisonnement et améliore la fiabilité.

### Agent Rules
Fichiers de configuration conditionnels appliqués selon le sous-répertoire du codebase. Consommés aussi bien par les outils humains (Cursor, Claude Code) que par Minions → convergence homme-machine.

### Points d'entrée multiples
Slack, interface web, plateformes internes (feature flags, docs, ticketing), CLI. L'intégration Slack dans les threads de discussion est particulièrement adoptée.

→ Voir aussi : [Les deux patterns d'intégration agent-sandbox](2026-02-10-sandbox-agent-patterns.md) — Minions utilise le pattern "agent dans le sandbox" (devbox)
→ Voir aussi : [Agent Skills : le nouveau paradigme](2026-02-10-agent-skills-paradigme.md) — les Agent Rules de Stripe sont analogues aux skills/connaissances procédurales
→ Voir aussi : [Compound Engineering](2026-02-10-compound-engineering.md) — la boucle d'amélioration continue avec capitalisation des learnings

## Pense-bêtes
- "If it's good for humans, it's good for LLMs" : investir dans les dev tools profite aux agents ET aux humains
- La pré-hydratation du contexte (exécution déterministe avant l'agent) est un levier de fiabilité sous-estimé
- Le seuil de 2 tours de CI max par run est un bon compromis vitesse/qualité à retenir
- Les devboxes pré-chauffées sont essentielles pour le throughput : 10s vs minutes de setup
- Le "pair prompting" (lancer plusieurs agents en parallèle depuis Slack) change le modèle mental de la programmation

## Citation notable
> "If it's good for humans, it's good for LLMs, too." — Alistair Gray, Stripe

## Contenu détaillé
Stripe a développé en interne "Minions", des agents de code qui fonctionnent de bout en bout sans intervention humaine durant l'exécution. Le système produit plus de 1 000 PRs mergées par semaine, entièrement générées par les agents — les humains ne font que la review.

La décision de construire en interne plutôt que d'utiliser des outils existants est motivée par les contraintes spécifiques de Stripe : un codebase de centaines de millions de lignes, principalement en Ruby avec Sorbet (peu courant pour les LLMs), des bibliothèques propriétaires, et des enjeux réglementaires liés au traitement de plus de 1 000 milliards de dollars de paiements par an.

L'architecture repose sur des **devboxes** — des environnements de développement isolés qui démarrent en 10 secondes avec le code Stripe pré-chargé. L'agent lui-même est un fork de **Goose** (agent open-source de Block), augmenté d'étapes déterministes pour les opérations git, le linting et les tests. Le contexte est fourni via **MCP** (Model Context Protocol) à travers "Toolshed", un serveur MCP interne hébergeant plus de 400 outils.

Un aspect distinctif est la **pré-hydratation** : avant que l'agent ne commence à raisonner, le système exécute de manière déterministe les outils MCP pertinents pour injecter le contexte. Cette approche réduit les hallucinations et accélère le traitement.

La boucle de feedback applique le principe du "shift-left" : d'abord un lint heuristique en moins de 5 secondes, puis une exécution CI sélective parmi les 3+ millions de tests existants, suivie d'autofixes automatiques. Le système s'arrête après maximum deux tours de CI pour éviter les boucles infinies.

Steve Kaliski, ingénieur chez Stripe, décrit cette approche comme du "pair prompting" : les ingénieurs lancent plusieurs Minions en parallèle depuis des channels Slack dédiés (équipe, projet, personnel), transformant fondamentalement le modèle de travail. Les Minions sont particulièrement efficaces pendant les rotations d'astreinte pour traiter rapidement de nombreux petits problèmes.
