# Mémoire des agents LLM : OpenClaw face à l'état de l'art

## Métadonnées
- **Source** : _attachments/7b28f512-Mémoire_des_agents_LLM_OpenClaw_face_à_l'état_de_l'art.pdf
- **Type** : article
- **Auteur** : Non identifié
- **Date publication** : 2026-02-15
- **Date ajout** : 2026-02-15
- **Domaine** : pro
- **Tags** : #mémoire-agent #openclaw #claude-code #letta #mem0 #zep #graphiti #rag #graphe-connaissances #architecture-mémoire
- **Confiance** : ⭐⭐⭐⭐ (sources multiples citées, comparaison méthodique, données vérifiables)

## TL;DR
> Analyse comparative de 10 systèmes de mémoire pour agents LLM (OpenClaw, Claude Code, Letta/MemGPT, Mem0, Zep/Graphiti, Cursor, Windsurf, Aider, LangChain). OpenClaw se distingue par sa transparence file-first et son pre-compaction memory flush, mais accuse un retard sur les graphes de connaissances et la mémoire autonome face aux leaders du domaine.

## Points clés
- **Trois paradigmes dominants** : mémoire fichiers Markdown (OpenClaw, Claude Code, Aider), mémoire OS-style avec pagination (Letta/MemGPT), graphes de connaissances temporels (Zep/Graphiti)
- **OpenClaw** : architecture deux niveaux (daily logs + MEMORY.md), retrieval hybride BM25 (30%) + vecteur (70%), pre-compaction memory flush innovant qui écrit les mémoires durables sur disque avant compression du contexte
- **Claude Code** : aucun embedding/RAG — recherche agentique via grep/glob + raisonnement du modèle. 4 niveaux hiérarchiques de CLAUDE.md + auto memory. Subagents à contexte isolé comme stratégie de gestion de contexte
- **Letta/MemGPT** : concept le plus ambitieux — traite la fenêtre de contexte comme la RAM d'un OS avec pagination. L'agent gère lui-même sa mémoire via tool calls (memory_replace, archival_memory_search)
- **Zep/Graphiti** : modèle bitemporel unique (quand un fait était vrai + quand il a été enregistré). Aucun appel LLM au retrieval = latence <200ms. 94,8% sur benchmark DMR
- **Benchmark LoCoMo** : même les meilleurs systèmes restent 56% en dessous des performances humaines, 73% d'écart sur le raisonnement temporel

## Concepts & Méthodologies

### Taxonomie CoALA (Princeton, TMLR 2024)
Framework de référence : mémoire de travail (scratchpad court terme) + mémoire long terme subdivisée en épisodique (événements), sémantique (faits) et procédurale (savoir-faire). Tous les systèmes commerciaux reflètent cette structure.

### Approches graph-based en ascension
- **HippoRAG** (NeurIPS 2024) : LLM + graphe de connaissances + PageRank personnalisé → +20% sur QA multi-hop, 10-30x moins cher que le retrieval itératif
- **GraphRAG** (Microsoft Research) : résumés communautaires pré-générés pour les questions globales de sensemaking
- **A-MEM** (NeurIPS 2025) : mémoire auto-organisatrice inspirée Zettelkasten — l'ajout de mémoires déclenche la mise à jour des représentations existantes

### Trois tendances du domaine
1. **Gestion autonome** : l'agent décide seul quoi mémoriser/oublier (Letta, A-MEM)
2. **Graphes > vecteurs plats** : raisonnement multi-hop et temporel (Zep, HippoRAG, GraphRAG)
3. **Compression de contexte** : primitive de premier ordre, plus un afterthought (pre-compaction flush, subagents isolés)

→ Voir aussi : [Observational Memory Mastra](../rag-et-context/2026-02-11-observational-memory-mastra.md)
→ Voir aussi : [The LLM Context Tax](../rag-et-context/2026-02-14-llm-context-tax.md)
→ Voir aussi : [OpenClaw : sécurité et configuration](2026-02-11-openclaw-securite-config.md)
→ Voir aussi : [Compound Engineering](2026-02-10-compound-engineering.md)
→ Voir aussi : [Agentic Team Memory](2026-02-14-agentic-team-memory.md)

## Pense-bêtes
- Le retrieval hybride BM25+vecteur avec fusion pondérée (pas RRF) préserve mieux les scores de similarité significatifs
- Le pre-compaction memory flush est un pattern réutilisable : écrire sur disque avant compression quand on approche le seuil de contexte
- Claude Code prouve qu'on peut se passer d'embeddings avec une recherche agentique déterministe (grep/glob) — simplicité > sophistication
- Le modèle bitemporel de Zep (t_valid/t_invalid + t'_created/t'_expired) est la meilleure approche pour traquer l'évolution des faits dans le temps
- Sur LoCoMo, 56% d'écart avec l'humain = la mémoire agent est un problème loin d'être résolu
- Les subagents à contexte isolé (Claude Code) sont une stratégie sous-estimée de gestion de la fenêtre de contexte

## Citation notable
> "La mémoire doit être traitée comme une primitive fondamentale de la conception d'agents, avec son propre cycle de vie : formation, évolution, retrieval." — Memory in the Age of AI Agents (décembre 2025, 48 co-auteurs)

## Contenu détaillé
L'écosystème de la gestion mémoire pour agents LLM a explosé entre 2024 et 2026. Cette analyse comparative couvre 10 outils majeurs et les travaux académiques fondateurs pour positionner OpenClaw dans ce paysage.

**OpenClaw** adopte une philosophie radicalement simple : les fichiers Markdown sont la source de vérité canonique, lisibles par un humain et versionnables avec Git. L'architecture repose sur deux couches : daily logs (append-only, chargés au démarrage) et MEMORY.md (faits curatés long terme). Son innovation majeure est le pre-compaction memory flush — quand le contexte approche ~176K tokens sur 200K, un tour agentique silencieux écrit les mémoires durables sur disque avant compression. Le retrieval hybride BM25 (30%) + vecteur cosine (70%) via sqlite-vec avec chunking de ~400 tokens a été préféré au RRF qui aplatit les magnitudes.

**Claude Code** prend le parti inverse : zéro embedding, zéro RAG. La recherche agentique navigue en temps réel via grep, glob et lecture de fichiers, combinée au raisonnement du modèle. La mémoire s'organise en 4 niveaux hiérarchiques de fichiers CLAUDE.md (système, utilisateur, projet, local) avec auto memory dans ~/.claude/projects/. L'auto-compaction à ~83,5% atteint ~50% de réduction. Les subagents (Explore, Plan, Task) à contexte isolé constituent une stratégie majeure de gestion du contexte.

**Letta/MemGPT** (ICLR 2024) implémente le concept le plus ambitieux : la fenêtre de contexte comme RAM d'un OS. La core memory (~5000 caractères, toujours en contexte) se distingue de la recall memory (historique) et archival memory (base vectorielle). L'agent gère autonomement sa mémoire via des tool calls — puissant mais non-déterministe.

**Mem0** (46,8K étoiles GitHub) extrait des faits atomiques depuis les conversations via un pipeline extraction → mise à jour (ADD/UPDATE/DELETE/NOOP). Architecture plate avec graphe optionnel (Mem0ᵍ). Revendique +26% sur LoCoMo vs mémoire OpenAI, -91% latence p95, -90%+ tokens.

**Zep/Graphiti** se distingue par son modèle bitemporel unique : chaque fait possède deux timestamps (validité réelle + enregistrement système). Trois couches : épisodes bruts → entités/relations sémantiques → communautés agrégées. Zéro appel LLM au retrieval = latence <200ms. 94,8% sur DMR.

Côté IDE, **Cursor** utilise un RAG avec Merkle trees, Turbopuffer et re-ranking deux étapes. **Windsurf** offre les Memories les plus matures + Fast Context via SWE-grep (~2800 tokens/sec). **Aider** mise sur le minimalisme : un repo map via tree-sitter + PageRank, Git comme mémoire implicite.

Les forces d'OpenClaw sont la transparence totale, le pre-compaction flush et l'écosystème de plugins extensible. Ses faiblesses : absence de graphe natif, mémoire monoposte, compaction fragile sur grands contextes, pas d'auto-gestion mémoire par l'agent, pas de raisonnement temporel.
