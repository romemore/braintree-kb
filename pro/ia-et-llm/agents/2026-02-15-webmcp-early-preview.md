# WebMCP : un standard web pour les agents IA

## Métadonnées
- **Source** : [WebMCP is available for early preview](https://developer.chrome.com/blog/webmcp-epp)
- **Type** : article
- **Auteur** : André Cipriani Bandarra (Google Chrome)
- **Date publication** : 2026-02-10
- **Date ajout** : 2026-02-15
- **Domaine** : pro
- **Tags** : #webmcp #mcp #web-standards #agents #chrome #google #api
- **Confiance** : ⭐⭐⭐⭐ (source officielle Google Chrome, early preview donc sujet à évolution, pas encore de retours terrain)

## TL;DR
> Google Chrome lance WebMCP en early preview, un framework standardisant l'interaction entre agents IA et sites web via deux APIs complémentaires (déclarative pour les formulaires HTML, impérative pour les interactions JavaScript complexes). L'objectif : rendre les sites "agent-ready" en éliminant l'ambiguïté dans les actions que les agents peuvent effectuer.

## Points clés
- **Deux APIs complémentaires** : une API déclarative pour les actions standard (formulaires HTML) et une API impérative pour les interactions complexes nécessitant du JavaScript
- **Sites "agent-ready"** : WebMCP fournit un standard pour exposer des outils structurés aux agents, remplaçant le scraping fragile par des interfaces explicites
- **Cas d'usage concrets** : support client (pré-remplissage de tickets), e-commerce (recherche produit, checkout), voyage (recherche/réservation de vols)
- **Early preview** : le framework est accessible aux développeurs pour tests et retours, l'API est susceptible d'évoluer

## Concepts & Méthodologies

### Architecture WebMCP
WebMCP introduit une couche de communication structurée entre agents IA et sites web :
- **API Déclarative** : s'appuie directement sur les formulaires HTML existants pour définir les actions possibles — approche progressive qui valorise le HTML sémantique
- **API Impérative** : gère les interactions dynamiques qui nécessitent l'exécution de JavaScript — pour les SPA, widgets complexes, etc.

### Du scraping au contrat d'interface
Le paradigme change fondamentalement : au lieu que l'agent interprète visuellement une page (scraping, DOM parsing), le site **déclare explicitement** les actions disponibles. C'est l'équivalent du passage des API non-documentées aux API REST avec OpenAPI spec.

→ Voir aussi : [Agent Skills : le nouveau paradigme](2026-02-10-agent-skills-paradigme.md) — MCP comme couche de connectivité dans l'architecture agent
→ Voir aussi : [Minions : les agents de code one-shot de Stripe](2026-02-11-minions-stripe-coding-agents.md) — MCP côté serveur avec 400+ outils internes (Toolshed)

## Pense-bêtes
- WebMCP côté **client web** vs MCP classique côté **serveur** : deux faces complémentaires du même protocole
- Pour mes projets web : anticiper le support WebMCP en structurant bien les formulaires HTML (bénéfice immédiat pour l'accessibilité aussi)
- Surveiller l'évolution de l'API — early preview = breaking changes probables
- L'adoption dépendra du support multi-navigateur (Firefox, Safari) — pour l'instant Chrome uniquement
- Implication SEO/agent-optimization : les sites "agent-ready" auront un avantage compétitif similaire au mobile-first

## Citation notable
> "WebMCP aims to provide a standard way for exposing structured tools, ensuring AI agents can perform actions on your side with increased speed, reliability, and precision." — André Cipriani Bandarra

## Contenu détaillé

André Cipriani Bandarra de l'équipe Chrome annonce la disponibilité en early preview de **WebMCP**, un framework conçu pour le "web agentique". Le constat de départ : les agents IA interagissent aujourd'hui avec les sites web de manière fragile, via du scraping visuel ou du DOM parsing qui casse à chaque changement de design.

WebMCP propose une solution structurelle en introduisant **deux APIs complémentaires**. L'**API déclarative** permet de définir des actions directement dans le HTML existant, en s'appuyant sur les formulaires natifs du web. Un site bien structuré en HTML sémantique devient ainsi partiellement "agent-ready" sans effort supplémentaire. L'**API impérative** couvre les cas plus complexes — applications single-page, widgets dynamiques, processus multi-étapes — qui nécessitent l'exécution de JavaScript pour être manipulés.

L'article illustre le potentiel avec trois cas d'usage. En **support client**, un agent peut automatiquement remplir les détails techniques d'un ticket de support en interagissant avec les champs structurés du formulaire. En **e-commerce**, l'agent peut rechercher des produits, configurer des options et naviguer dans le tunnel d'achat avec précision, en s'appuyant sur les outils déclarés par le site. En **voyage**, un agent peut effectuer une recherche, filtrer les résultats et compléter une réservation de vol via des données structurées.

Le positionnement de WebMCP est celui d'un **standard web** : il ne s'agit pas d'un outil propriétaire mais d'une initiative visant à établir des conventions partagées pour l'interaction agent-web. Cela s'inscrit dans la continuité du protocole MCP (Model Context Protocol) mais côté client web, là où MCP classique opère côté serveur pour connecter les agents à des outils et données.

Les développeurs intéressés peuvent rejoindre le programme early preview pour accéder à la documentation, des démos et suivre l'évolution de l'API. Le framework étant en phase précoce, des changements significatifs sont attendus avant une éventuelle standardisation.
