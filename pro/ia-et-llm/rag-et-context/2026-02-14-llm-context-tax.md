# The LLM Context Tax : optimiser chaque token envoyé aux LLM

## Métadonnées
- **Source** : [The LLM Context Tax: Best Tips for Tax Avoidance](https://www.nicolasbustamante.com/p/the-llm-context-tax-best-tips-for)
- **Type** : article
- **Auteur** : Nicolas Bustamante
- **Date publication** : 2026-02-11
- **Date ajout** : 2026-02-14
- **Domaine** : pro
- **Tags** : #llm #context-window #optimisation #tokens #coûts #latence #agents #prompt-caching
- **Confiance** : ⭐⭐⭐⭐ (auteur reconnu dans l'écosystème IA, conseils concrets et sourcés, exemples issus de produits en production comme Cursor et Claude Code, données de pricing vérifiables)

## TL;DR
> Chaque token inutile envoyé à un LLM coûte de l'argent, augmente la latence et dégrade les performances au-delà d'un seuil (~32K tokens). L'article détaille 13 stratégies concrètes d'optimisation — du prompt caching aux subagents en passant par le nettoyage des données et le design d'outils précis — pour construire des systèmes agents économiquement viables.

## Points clés
- **Triple pénalité du contexte** : coût financier + latence accrue + dégradation des performances (context rot au-delà de ~32K tokens)
- **Prompt caching** : garder des préfixes stables et du contenu append-only pour maximiser les cache hits du KV cache
- **Stockage filesystem** : stocker les outputs d'outils en fichiers plutôt qu'en contexte — Cursor a réduit ses tokens agent de ~47% avec cette approche
- **Outils précis** : pattern search → metadata puis retrieve → full content, pour réduire la consommation de ~10x
- **Cliff de pricing à 200K** : au-delà de 200K input tokens, le prix double chez Anthropic (Claude Opus et Sonnet)

## Concepts & Méthodologies

### Le Context Tax
Le "Context Tax" est le coût payé pour chaque token inutile dans la fenêtre de contexte. Ce coût est triple :
1. **Financier** : chaque token coûte de l'argent
2. **Latence** : chaque token augmente le temps de réponse
3. **Performance** : au-delà d'un seuil, le modèle se perd dans le bruit accumulé (context rot)

### 13 stratégies d'optimisation

**1. Préfixes stables pour le KV Cache** — Garder le début des prompts identique entre requêtes pour réutiliser les computations cachées. Ne pas mettre de timestamps dynamiques dans le system prompt.

**2. Contexte append-only** — Ne pas modifier le contexte antérieur, car ça invalide le cache à partir du point de modification. Plutôt que de retirer dynamiquement des outils, masquer les logits des tokens pendant le décodage.

**3. Outputs d'outils dans le filesystem** — Stocker les résultats d'outils comme fichiers plutôt que dans la conversation. L'agent accède à l'info à la demande au lieu de tout charger d'emblée.

**4. Outils précis** — Deux phases : recherche → métadonnées, puis récupération → contenu complet. Divise la consommation par ~10x.

**5. Nettoyage des données** — Nettoyer avant tokenisation : extraction HTML → markdown donne 90%+ de réduction de tokens.

**6. Délégation à des subagents** — Router les opérations token-heavy vers des modèles moins chers. Le pattern subagent de Claude Code traite 67% moins de tokens grâce à l'isolation de contexte.

**7. Templates réutilisables** — Substitution de paramètres plutôt que regénération. Exemple : modèle DCF à $0.05 avec template vs $0.50 from-scratch.

**8. Placement stratégique de l'information** — Attention en U : le modèle retient mieux le début et la fin du contexte. Placer l'info critique aux extrémités.

**9. Compaction côté serveur** — Résumé automatique quand la conversation approche des seuils configurables. Préserve l'espace du contexte tout en maintenant la cohérence.

**10. Budget de tokens de sortie** — Les output tokens coûtent 5x plus que les inputs non-cachés. Fixer des limites `max_tokens` appropriées et préférer les outputs structurés (JSON).

**11. Le cliff à 200K tokens** — Au-delà de 200K input tokens, le pricing double chez Anthropic → incitation forte à compresser agressivement.

**12. Appels d'outils parallèles** — L'API Anthropic supporte les tool calls simultanés, réduisant les round-trips et l'accumulation de contexte.

**13. Cache applicatif** — Les tokens les moins chers sont ceux qui n'atteignent jamais l'API. Cacher les réponses aux requêtes fréquentes.

→ Voir aussi : [Observational Memory — Mastra](2026-02-11-observational-memory-mastra.md) — implémente concrètement les stratégies 1, 2 et 9 (préfixes stables, append-only, compaction) dans un système de mémoire agent
→ Voir aussi : [Recursive Language Models](2026-02-11-recursive-language-models.md) — stratégie complémentaire qui externalise le contexte dans un REPL Python plutôt que de l'optimiser dans la fenêtre

## Pense-bêtes
- Vérifier immédiatement si mes system prompts contiennent des timestamps dynamiques qui cassent le cache
- Pour les agents en production, mesurer le ratio tokens cachés / tokens totaux comme KPI
- Appliquer le pattern search → metadata puis retrieve → content pour tous les outils de récupération de données
- Ne jamais injecter du HTML brut dans le contexte — toujours convertir en markdown d'abord
- Le seuil de 32K tokens comme point de dégradation des performances est un repère pratique pour dimensionner les contextes d'agents
- Le cliff à 200K tokens est un facteur structurant pour l'architecture des agents chez Anthropic

## Citation notable
> "The best teams building sustainable agent products are obsessing over token efficiency the same way database engineers obsess over query optimization." — Nicolas Bustamante

## Contenu détaillé

L'article de Nicolas Bustamante pose un cadre systématique pour comprendre et réduire le coût du contexte dans les systèmes à base de LLM. Le "Context Tax" désigne la triple pénalité associée à chaque token envoyé : coût financier direct, latence de traitement et, au-delà d'un certain seuil, dégradation des performances du modèle par accumulation de bruit ("context rot").

**Optimisation du cache** : la stratégie la plus impactante est le maintien de préfixes stables pour exploiter le KV cache des providers. Concrètement, il faut garder le début des prompts strictement identique entre requêtes et placer tout le contenu dynamique en fin de prompt. Ajouter un timestamp précis dans le system prompt garantit un cache miss à chaque appel. L'architecture append-only renforce cette logique : modifier ou retirer du contexte antérieur invalide le cache à partir de ce point. Au lieu de retirer dynamiquement des outils, il vaut mieux masquer les logits pendant le décodage.

**Stockage externe** : plutôt qu'injecter tous les résultats d'outils dans la conversation, les stocker comme fichiers que l'agent consulte à la demande. Cursor a réduit ses tokens agents de 47% avec cette approche. Le design d'outils précis — pattern en deux phases (search → metadata, retrieve → full content) — réduit la consommation d'environ 10x par rapport à des outils généralistes qui retournent tout.

**Prétraitement des données** : le nettoyage avant tokenisation offre des gains massifs. La conversion HTML → markdown élimine plus de 90% des tokens inutiles. L'article recommande aussi les templates réutilisables : un modèle DCF coûte $0.05 avec un template paramétré vs $0.50 en génération complète.

**Architecture agents** : la délégation à des subagents pour les tâches token-heavy (extraction, classification, résumé, formatage) permet de router vers des modèles moins chers tout en isolant le contexte. Le pattern de Claude Code traite 67% moins de tokens grâce à cette isolation. Le placement stratégique de l'information exploite le pattern d'attention en U des transformers — le modèle retient mieux ce qui est au début et à la fin du contexte.

**Économie des tokens** : les output tokens coûtent 5x plus que les inputs non-cachés, ce qui justifie de fixer des limites `max_tokens` et de préférer les outputs structurés (JSON). Au-delà de 200K input tokens, le pricing double chez Anthropic, créant un cliff structurant pour l'architecture. Enfin, le cache applicatif — ne jamais envoyer à l'API ce qu'on peut servir depuis un cache local — reste la stratégie la plus rentable de toutes.
