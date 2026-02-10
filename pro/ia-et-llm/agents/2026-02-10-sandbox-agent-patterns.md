# Les deux patterns d'intégration agent-sandbox

## Métadonnées
- **Source** : [The two patterns by which agents connect sandboxes — Harrison Chase](https://x.com/hwchase17/status/2021261552222158955)
- **Type** : article
- **Auteur** : Harrison Chase (LangChain)
- **Date publication** : 2026-02-10
- **Date ajout** : 2026-02-10
- **Domaine** : pro
- **Tags** : #agents #sandbox #architecture #langchain #infrastructure #sécurité
- **Confiance** : ⭐⭐⭐⭐ (CEO LangChain, source directe, sujet technique bien documenté, pas de données empiriques)

## TL;DR
> Harrison Chase identifie deux architectures fondamentales pour connecter un agent IA à un sandbox d'exécution : l'agent **dans** le sandbox (couplage fort, développement similaire au local) ou le sandbox **comme outil** appelé depuis l'extérieur (sécurité renforcée, itération rapide). Le choix dépend du compromis entre intégration environnementale et flexibilité opérationnelle.

## Points clés
- **Besoin croissant de workspace isolé** : De plus en plus d'agents nécessitent un environnement dédié (exécution de code, installation de packages, accès fichiers) — les sandboxes répondent à ce besoin
- **Pattern 1 — Agent IN Sandbox** : L'agent tourne à l'intérieur de l'environnement isolé et communique vers l'extérieur via HTTP/WebSocket. Proche du développement local, mais les credentials sont exposées dans le sandbox et chaque mise à jour nécessite un rebuild du container
- **Pattern 2 — Sandbox as Tool** : L'agent tourne sur le serveur principal et appelle le sandbox via API à la demande. Les clés API restent en dehors, les mises à jour de l'agent sont instantanées, et l'exécution peut se paralléliser sur plusieurs sandboxes
- **Sécurité vs couplage** : Le pattern 2 offre une meilleure isolation des credentials et une séparation nette raisonnement/exécution ; le pattern 1 offre un accès direct au filesystem et une expérience plus naturelle

## Concepts & Méthodologies

### Pattern 1 : Agent dans le sandbox
L'agent est packagé dans une image Docker/VM avec ses frameworks. Il expose des endpoints HTTP ou WebSocket pour la communication externe.

**Avantages** :
- Accès direct au filesystem
- Expérience similaire au développement local
- Utile quand l'agent a besoin de bibliothèques spécialisées installées en permanence

**Inconvénients** :
- Credentials API à l'intérieur du sandbox (risque d'exfiltration)
- Rebuild container à chaque mise à jour de l'agent
- Logique supplémentaire pour la reprise de session
- Permissions uniformes pour tous les outils (pas de granularité)

### Pattern 2 : Sandbox comme outil
L'agent tourne localement ou sur un serveur, et invoque le sandbox via des providers (E2B, Modal, Daytona, Runloop) comme un outil standard.

**Avantages** :
- Mises à jour instantanées de l'agent (pas de rebuild)
- Clés API hors du sandbox
- Séparation état agent / environnement d'exécution
- Exécution parallèle sur plusieurs sandboxes
- Facturation à l'usage

**Inconvénients** :
- Latence réseau à chaque appel d'exécution
- Accumulation de latence sur les petites opérations
- Mitigeable avec des sessions stateful (variables et packages persistants)

### Critères de choix
| Priorité | Pattern recommandé |
|----------|-------------------|
| Couplage fort agent-environnement | Pattern 1 (IN) |
| Itération rapide sur la logique agent | Pattern 2 (as Tool) |
| Sécurité des credentials | Pattern 2 (as Tool) |
| Séparation raisonnement/exécution | Pattern 2 (as Tool) |
| Environnement miroir du local | Pattern 1 (IN) |

→ Voir aussi : [Agent Skills : le nouveau paradigme](2026-02-10-agent-skills-paradigme.md) — les skills comme couche au-dessus du runtime/sandbox

## Pense-bêtes
- Quand je design un agent avec exécution de code, choisir explicitement entre les deux patterns **avant** de commencer l'implémentation
- Le pattern 2 (sandbox as tool) est souvent le meilleur défaut : plus sécurisé, plus flexible, facturable à l'usage
- Penser à la latence cumulée : si l'agent fait beaucoup de petites opérations filesystem, le pattern 1 peut être plus adapté
- Les providers sandbox (E2B, Modal, Daytona, Runloop) sont des commodités — ne pas réinventer la roue
- La séparation credentials est un argument fort pour le pattern 2 dans tout contexte production

## Citation notable
> "More and more agents need a workspace: a computer where they can run code, install packages, and access files. Sandboxes provide this." — Harrison Chase

## Contenu détaillé

Harrison Chase, CEO de LangChain, analyse les deux architectures fondamentales par lesquelles les agents IA se connectent à des sandboxes — ces environnements isolés où ils peuvent exécuter du code, installer des packages et manipuler des fichiers en toute sécurité.

Le **premier pattern** place l'agent directement dans le sandbox. L'implémentation typique consiste à construire une image Docker ou VM contenant le framework agent, puis à exposer des endpoints HTTP ou WebSocket pour la communication avec l'extérieur. Ce pattern séduit par sa simplicité conceptuelle : il reproduit l'expérience du développement local. L'agent a un accès direct au filesystem et aux bibliothèques installées. Mais cette intimité a un coût : les credentials API doivent résider dans le sandbox (créant un risque d'exfiltration), chaque modification du code agent nécessite un rebuild du container, et la reprise de session après interruption demande une logique additionnelle. De plus, tous les outils de l'agent héritent des mêmes permissions que le code exécuté, empêchant un contrôle de sécurité granulaire.

Le **second pattern** inverse la relation : l'agent tourne sur un serveur classique et invoque le sandbox comme un outil parmi d'autres via des APIs de providers spécialisés (E2B, Modal, Daytona, Runloop). Le code d'exécution est envoyé au sandbox à la demande, et les résultats reviennent par API. Les avantages sont nombreux : les clés API restent hors du sandbox, les mises à jour de l'agent sont instantanées (pas de rebuild), l'état de la conversation est protégé des crashs du sandbox, et l'exécution peut se paralléliser sur plusieurs sandboxes simultanés. La facturation à l'usage remplace le coût d'un runtime persistant. Le principal inconvénient est la latence réseau ajoutée à chaque appel, qui peut s'accumuler pour les workflows comportant de nombreuses petites opérations.

Chase recommande le pattern 1 pour les cas nécessitant un couplage fort agent-environnement ou reproduisant fidèlement un environnement local, et le pattern 2 pour l'itération rapide, la sécurité des credentials et la séparation nette entre raisonnement et computation. Le framework deepagents supporte les deux approches via configuration simple.
