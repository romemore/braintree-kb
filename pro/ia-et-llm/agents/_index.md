# Agents IA

Architecture, patterns et écosystème des agents d'intelligence artificielle.

## Fiches

| Date | Fiche | TL;DR |
|------|-------|-------|
| 2026-02-10 | [Agent Skills : le nouveau paradigme](2026-02-10-agent-skills-paradigme.md) | Anthropic propose de remplacer la construction d'agents spécialisés par des "skills" — des dossiers structurés de connaissances procédurales composables qui donnent aux agents généralistes une expertise de domaine. |
| 2026-02-10 | [Compound Engineering : rendre Claude Code meilleur à chaque utilisation](2026-02-10-compound-engineering.md) | Philosophie en 4 étapes (planifier, travailler, évaluer, capitaliser) qui rend Claude Code progressivement meilleur grâce à l'accumulation de learnings, avec plugin open-source et tests Playwright automatisés. |
| 2026-02-10 | [Workflows IA et dev tools personnalisés](2026-02-10-workflows-dev-tools-ia.md) | CJ Hess montre son écosystème de dev tools autour de Claude Code, notamment Flowy (flowcharts/mockups pilotés par IA via skills) et la revue de code modèle-contre-modèle (Claude + Codex). |
| 2026-02-10 | [Les deux patterns d'intégration agent-sandbox](2026-02-10-sandbox-agent-patterns.md) | Harrison Chase identifie deux architectures pour connecter un agent à un sandbox : l'agent dans le sandbox (couplage fort) ou le sandbox comme outil externe (sécurité, flexibilité). Le choix dépend du compromis intégration vs flexibilité. |
| 2026-02-11 | [OpenClaw : sécurité et configuration essentielles](2026-02-11-openclaw-securite-config.md) | David Ondrej alerte sur la sécurité d'OpenClaw : 40 000+ instances exposées, CVE critique, skills malveillants sur ClawHub. La configuration sécurisée (sandbox, permissions, tokens) est indispensable. |
| 2026-02-11 | [Minions : les agents de code one-shot de Stripe](2026-02-11-minions-stripe-coding-agents.md) | Stripe a développé "Minions", des agents de code internes produisant 1 000+ PRs/semaine. Architecture : devboxes pré-chauffées + fork de Goose + 400+ outils MCP internes. Illustre l'approche "build over buy" à grande échelle. |
| 2026-02-11 | [Déployer l'IA dans les départements finance : retour d'expérience CFO](2026-02-11-ia-agents-cfo-finance.md) | Vasuman Moza (Varick Agents, ex-Meta) partage ses enseignements après avoir accompagné des dizaines de CFO d'entreprises à 1B+ ARR : transformer des départements entiers avec des agents IA plutôt qu'ajouter des outils SaaS ponctuels. |
| 2026-02-14 | [The 2026 AI Engineer Roadmap](2026-02-14-ai-engineer-roadmap-2026.md) | En 2026, l'écart salarial de 150k$ entre prompt engineers et architectes systèmes IA illustre que la valeur réside dans la construction de systèmes complets, pas dans le prompting seul. |
| 2026-02-14 | [Agentic Team Memory : encoder le savoir tribal pour les agents IA](2026-02-14-agentic-team-memory.md) | Nader Dabit argumente que le savoir tribal d'équipe, mal capturé par les wikis obsolètes, peut être encodé dans des fichiers de contexte agents (CLAUDE.md) qui deviennent des artefacts vivants maintenus activement. |
| 2026-02-14 | [Test-Driven Knowledge Work : appliquer le TDD à la gestion de connaissances](2026-02-14-test-driven-knowledge-work.md) | Cornelius propose d'appliquer les principes du TDD au travail de connaissance : définir des critères de vérification avant de traiter une information, puis tester si le traitement a produit une compréhension actionnable. |
| 2026-02-15 | [WebMCP : un standard web pour les agents IA](2026-02-15-webmcp-early-preview.md) | Google Chrome lance WebMCP en early preview, un framework standardisant l'interaction entre agents IA et sites web via deux APIs complémentaires (déclarative et impérative), rendant les sites "agent-ready". |
| 2026-02-15 | [Construire un agent IA production-grade](2026-02-15-production-grade-ai-agent.md) | Plus de 40 % des projets d'IA agentique échouent à cause de contrôles de risques inadéquats, d'architecture pauvre et de valeur métier floue — pas à cause des modèles. |
| 2026-02-15 | [Mémoire des agents LLM : OpenClaw face à l'état de l'art](2026-02-15-memoire-agents-llm-openclaw.md) | Analyse comparative de 10 systèmes de mémoire pour agents LLM. OpenClaw se distingue par sa transparence file-first et son pre-compaction memory flush, mais accuse un retard sur les graphes de connaissances et la mémoire autonome. |
| 2026-02-15 | [Architectures de mémoire pour agents autonomes : analyse critique](2026-02-15-architectures-memoire-agents-autonomes.md) | Rapport exhaustif comparant les architectures mémoire pour agents LLM en 2026 : OpenClaw (file-first), Claude Code (stateless, MCP Tool Search), plugins MemOS/Mem0, et systèmes académiques MAGMA/EverMemOS/A-Mem/Zep. Claude Code domine en efficacité tokens (90-95%), OpenClaw seul à offrir la souveraineté mémorielle. |
| 2026-02-18 | [Boris Cherny : Comment Claude Code a été construit](2026-02-18-boris-cherny-claude-code-genese.md) | Boris Cherny révèle la genèse accidentelle de Claude Code (septembre 2024), les principes fondateurs d'Anthropic (build for the model of tomorrow, Bitter Lesson, latent demand), l'architecture multi-agents en production, et ses prédictions sur la disparition du titre "Software Engineer". |

## Thèmes récurrents
- Architecture convergente des agents généralistes (boucle agent + runtime + MCP + skills)
- Skills comme connaissances procédurales composables
- Apprentissage continu et mémoire via les skills
- Compound engineering : boucle d'amélioration continue plan → work → assess → compound
- Patterns d'intégration agent-sandbox : agent IN sandbox vs sandbox as tool
- Sécurité des credentials et isolation dans les architectures agents
- Hardening d'agents IA locaux (OpenClaw) : sandbox, permissions, audit
- Tests automatisés via Playwright avec contrôle navigateur
- Dev tools personnalisés pilotés par IA (Flowy, éditeurs visuels)
- Revue de code modèle-contre-modèle (Claude + Codex)
- Build over buy : construire ses propres outils de développement (Stripe Minions à grande échelle)
- Pré-hydratation déterministe du contexte avant exécution de l'agent
- Agents one-shot en production : 1 000+ PRs/semaine chez Stripe
- MCP comme couche d'unification des outils internes (Toolshed, 400+ outils)
- Déploiement d'agents IA en enterprise finance : transformation de département vs outil ponctuel
- CFO de grandes entreprises (1B+ ARR) en phase de déploiement massif en 2026
- Écart croissant prompt engineer vs systems architect (150k$ en 2026)
- Commoditisation du prompting, prime à l'ingénierie système
- Agentic Team Memory : encoder le savoir tribal dans des fichiers de contexte agents (CLAUDE.md)
- Documentation vivante : fichiers de contexte agents mis à jour quasi quotidiennement vs wikis obsolètes
- Feedback loop vertueux : agent non conforme → incentive à maintenir la doc à jour
- Test-Driven Knowledge Work : définir des critères de vérification avant le traitement d'information
- Agents de notes comme testeurs de compréhension, pas archivistes
- Analogie TDD (Red-Green-Refactor) appliquée au PKM agentique
- WebMCP : standard web pour interaction structurée agent-site (API déclarative + impérative)
- Passage du scraping fragile aux contrats d'interface explicites pour les agents
- Sites "agent-ready" comme avantage compétitif (parallèle mobile-first)
- 40 %+ des projets agents échouent : risk controls, architecture et business value comme piliers
- Distinction chatbot (texte passif) vs agent (action autonome) comme critère d'exigence
- Trois paradigmes de mémoire agent : file-first (OpenClaw, Claude Code), OS-style pagination (Letta/MemGPT), graphe temporel (Zep/Graphiti)
- Pre-compaction memory flush : écrire les mémoires durables sur disque avant compression du contexte
- Retrieval hybride BM25+vecteur avec fusion pondérée (pas RRF) pour préserver les scores significatifs
- Recherche agentique sans embeddings (Claude Code) : grep/glob + raisonnement modèle comme alternative viable au RAG
- Modèle bitemporel (Zep) : double timestamp validité réelle + enregistrement système pour le raisonnement temporel
- Taxonomie CoALA : mémoire de travail + LT épisodique/sémantique/procédurale comme framework de référence
- Mémoire auto-organisatrice (A-MEM) : ajout de mémoires déclenche mise à jour des représentations existantes
- 56% d'écart performances humaines sur LoCoMo → mémoire agent = problème ouvert
- MCP Tool Search : chargement dynamique des outils à la demande, réduction 85% tokens outils
- Fusion de scores pondérée (pas RRF) pour préserver la magnitude du signal de similarité
- Architectures multi-graphes (MAGMA) : politique de traversée adaptative selon l'intention de requête
- EverMemOS MemCell : composante prédictive "Foresight" avec intervalle de validité pour filtrer les infos périmées
- "Compromission déléguée" (ClawHavoc) : nouveau vecteur d'attaque ciblant l'agent de confiance via skills malveillants
- Approche "Contexte Brut" vs "Extraction" : ré-interprétation rétroactive supérieure pour tâches critiques
- Convergence fin 2026 : graphes locaux + récupération agentique standardisée (MCP) + sandboxing
- "Build for the model of tomorrow" : principe cardinal — construire pour les capacités du modèle dans 6 mois, pas d'aujourd'hui
- Bitter Lesson appliquée au produit : tout scaffolding a une date d'expiration — attendre le prochain modèle souvent plus rentable
- Latent demand comme boussole produit : construire ce que les utilisateurs font déjà maladroitement, jamais créer de nouveaux comportements
- CLAUDE.md minimaliste : supprimer > accumuler — reconstruire depuis zéro si trop long, ajouter uniquement ce qui corrige des déviations
- Multi-agents production chez Anthropic : swarm autonome avec tableau Asana piloté par Claude, plugins écrits en un week-end sans intervention humaine
- Uncorrelated context windows : fenêtres de contexte indépendantes = forme de test-time compute pour problèmes complexes
- 150% de productivité par ingénieur chez Anthropic depuis Claude Code (mesure PRs), 90-100% du code écrit par l'agent
- Titre "Software Engineer" prédit en voie de disparition — vers "Builder" avec périmètre product + design + engineering + users

---
*Mis à jour le 2026-02-18 — 15 fiches*
