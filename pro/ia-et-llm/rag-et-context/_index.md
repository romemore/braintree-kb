# RAG et Context

Techniques de gestion du contexte long, retrieval-augmented generation, mémoire agent et stratégies d'inférence pour dépasser les limites des fenêtres de contexte.

## Fiches

| Date | Fiche | TL;DR |
|------|-------|-------|
| 2026-02-14 | [The LLM Context Tax : optimiser chaque token envoyé aux LLM](2026-02-14-llm-context-tax.md) | Chaque token inutile envoyé à un LLM coûte de l'argent, augmente la latence et dégrade les performances au-delà de ~32K tokens. 13 stratégies concrètes d'optimisation pour des systèmes agents économiquement viables. |
| 2026-02-11 | [Observational Memory : une mémoire bio-inspirée pour agents IA](2026-02-11-observational-memory-mastra.md) | Mastra lance Observational Memory, un système de mémoire textuel pour agents IA atteignant 94,87% sur LongMemEval (SoTA) sans vector/graph DB, avec compression 3-40x et compatibilité prompt caching. |
| 2026-02-11 | [Recursive Language Models : dépasser les limites de la fenêtre de contexte](2026-02-11-recursive-language-models.md) | Les RLM permettent aux LLM de traiter des entrées 100x plus longues que leur fenêtre de contexte en externalisant le prompt dans un environnement REPL Python exploré récursivement. RLM-Qwen3-8B surpasse Qwen3-8B de 28,3% et approche GPT-5. |

## Thèmes récurrents
- **Optimisation du contexte comme discipline d'ingénierie** : token efficiency comparable à l'optimisation de requêtes SQL
- Externalisation du contexte dans un environnement programmatique (REPL)
- Récursion comme stratégie d'inférence pour le contexte long
- Compression de mémoire conversationnelle par agents Observer/Reflector
- Approches textuelles vs vectorielles pour la mémoire agent
- Stratégies émergentes : peeking, grepping, partition+map, summarization
- Prompt caching et préfixes stables comme levier d'optimisation coût/performance
- Stockage filesystem des résultats d'outils pour réduire le contexte en mémoire
- Cliff de pricing à 200K tokens comme contrainte architecturale

---
*Mis à jour le 2026-02-14*
