# 10 ans de logiciel vertical — Perspective sur le selloff

## Métadonnées
- **Source** : [Tweet de Nicolas Bustamante](https://x.com/nicbstme/status/2023501562480644501?s=12&t=l7NF5i6ZAzn8oKo4baCXXg) → [Article original](http://x.com/i/article/2023495526877155328)
- **Type** : article
- **Auteur** : Nicolas Bustamante (@nicbstme)
- **Date publication** : 2026-02-16
- **Date ajout** : 2026-02-18
- **Domaine** : pro
- **Tags** : #saas #logiciel-vertical #ia #disruption #valorisation #fintech #legaltech
- **Confiance** : ⭐⭐⭐⭐ (praticien 10 ans d'expérience, fondateur Doctrine + Fintool, analyse de première main)

## TL;DR
> Près de 1 000 milliards de dollars ont été effacés des actions de logiciels verticaux (FactSet, S&P Global, Thomson Reuters) suite à la montée des LLM. Nicolas Bustamante, après 10 ans à construire du logiciel vertical (Doctrine, Fintool), analyse quels fossés concurrentiels résistent à l'IA et lesquels s'effondrent.

## Points clés
- **L'ampleur du selloff** : FactSet passé de 20 Md$ à moins de 8 Md$, S&P Global -30% en quelques semaines, Thomson Reuters presque divisé par deux en un an
- **Le moat historique qui disparaît** : l'accès aux données structurées (milliers de parsers, ingestion de sources hétérogènes) était une vraie barrière technique — les LLM commoditisent cette couche d'infrastructure
- **Ce qui reste défendable** : les données propriétaires (non publiques), la confiance réglementaire, les workflows métier profondément intégrés, et la responsabilité opérationnelle (SLAs)
- **Le paradoxe du terminal Bloomberg** : même à 25 000 $/siège, les traders préfèrent 36 écrans d'outils spécialisés à une interface conversationnelle lente — l'UX "boring" reste productif
- **Nuance marché** : le selloff peut aussi refléter des facteurs macro (révisions d'emploi, turbulences politiques) et non uniquement la peur de l'IA

## Concepts & Méthodologies

**Vertical Software Moat Framework** — Les avantages concurrentiels des logiciels verticaux se décomposent en couches :
1. Couche données (parsers, ingestion) → commoditisée par les LLM
2. Couche logique métier (règles, compliance, calcul) → partiellement menacée
3. Couche confiance/responsabilité (SLAs, audit, réglementation) → résistante
4. Couche réseau (lock-in des workflows, habitudes utilisateurs) → très résistante

Liens avec d'autres fiches :
→ Voir aussi : [[../../ia-et-llm/agents/2026-02-11-ia-agents-cfo-finance.md]] (agents IA en finance)
→ Voir aussi : [[../../ia-et-llm/rag-et-context/2026-02-14-llm-context-tax.md]] (autre analyse de Bustamante sur les LLM)

## Pense-bêtes
- Avant de construire un "copilote IA" sur un marché vertical, identifier quelle couche du moat on attaque : données publiques (peu défendables) vs. workflows intégrés (très défendables)
- Les clients SaaS paient aussi pour externaliser le risque opérationnel — un "vibe-coded replacement" ne remplace pas un SLA
- La productivité des power users avec des interfaces spécialisées > interfaces conversationnelles génériques pour des tâches complexes

## Citation notable
> "A massive portion of vertical software's value proposition was making hard-to-access data easy to query. Before LLMs, accessing this public data required specialized software and significant engineering scaffolding." — Nicolas Bustamante

## Contenu détaillé

### Le contexte du selloff

En février 2026, une vague de dépréciations massives a frappé les acteurs historiques du logiciel vertical à forte valeur ajoutée. FactSet (données financières) a perdu 60% de sa valorisation peak, S&P Global 30% en quelques semaines, Thomson Reuters presque 50% sur l'année. Le catalyseur : la perception que les LLM rendent obsolète une part significative de leur proposition de valeur.

### L'argument de Bustamante : ce qui est vraiment menacé

Nicolas Bustamante construit depuis 10 ans du logiciel vertical : d'abord **Doctrine** (plus grande plateforme d'information juridique d'Europe), puis **Fintool** (recherche actions par IA, concurrent de Bloomberg/FactSet). Il parle donc de l'intérieur.

Sa thèse : **la couche d'accès aux données était le moat principal de ces acteurs** — FactSet a construit des milliers de parsers pour agréger des données financières hétérogènes. LexisNexis a indexé des décennies de jurisprudence. Ce travail d'ingénierie titanesque représentait une vraie barrière à l'entrée. Or, les LLM commoditisent exactement cette couche : ils savent ingérer, structurer et interroger des données non structurées à moindre coût.

### Ce qui résiste

Trois catégories de moats restent intacts :

**1. Les données propriétaires non publiques** : les données exclusives (contrats privés, données de trading non publiées, données cliniques) ne peuvent pas être reconstituées par un LLM entraîné sur des données publiques.

**2. La responsabilité opérationnelle** : les entreprises ne paient pas seulement pour accéder à des données — elles paient pour externaliser le risque. Un SLA avec pénalités financières vaut plus qu'un "vibe-coded" outil interne qui pourrait halluciner sur un calcul critique.

**3. Les habitudes et intégrations profondes** : le terminal Bloomberg reste à 25 000 $/siège car les traders ont des workflows ultra-optimisés sur cet outil. La transition vers une interface conversationnelle générale représente un coût de réapprentissage massif et une perte de productivité réelle.

### La discussion Hacker News

La publication a généré un débat nourri. Les principaux contre-arguments : les LLM ne sont pas fiables pour des calculs critiques (erreurs factuelles documentées sur des données financières), les interfaces conversationnelles sont fondamentalement moins productives pour les expert users, et le selloff reflète peut-être surtout des facteurs macro indépendants de l'IA.
