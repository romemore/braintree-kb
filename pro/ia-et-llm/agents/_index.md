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

---
*Mis à jour le 2026-02-14 — 8 fiches*
