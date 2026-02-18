# Boris Cherny : Comment Claude Code a été construit

## Métadonnées
- **Source** : [Boris Cherny: How We Built Claude Code](https://www.youtube.com/watch?v=PQU9o_5rHC4)
- **Type** : vidéo
- **Auteur** : Boris Cherny (créateur de Claude Code) — interviewé par Y Combinator
- **Date publication** : 2026-02-18
- **Date ajout** : 2026-02-18
- **Domaine** : pro
- **Tags** : #claude-code #agents #dev-tools #product-building #LLM #anthropic #multi-agents
- **Confiance** : ⭐⭐⭐⭐⭐ (source primaire : créateur lui-même, discours factuel et vérifiable)

## TL;DR
> Boris Cherny raconte comment Claude Code est né par accident en septembre 2024 — un simple terminal CLI pour tester l'API — et révèle les principes fondateurs : construire pour le modèle dans 6 mois, jamais pour celui d'aujourd'hui, et ne jamais parier contre le modèle. L'interview livre des insights rares sur la philosophie produit, l'architecture multi-agents, et les prédictions sur l'avenir du développement logiciel.

## Points clés
- **Origine accidentelle** : Claude Code a commencé comme un terminal app pour tester l'API Anthropic en septembre 2024. Le CLI n'était pas une décision stratégique — c'était juste le moyen le plus rapide de construire sans UI.
- **"Build for the model 6 months from now"** : principe cardinal d'Anthropic. Ne jamais construire pour les capacités actuelles du modèle, mais pour celles qu'il aura dans 6 mois. Tous les produits qui ont parié contre le modèle ont été dépassés.
- **Latent demand comme moteur produit** : chaque feature de Claude Code (CLAUDE.md, plan mode, verbose mode, Teams) est née de l'observation de ce que les utilisateurs faisaient déjà — jamais de ce qu'Anthropic voulait qu'ils fassent.
- **La Bitter Lesson encadrée** : l'équipe a imprimé et encadré "The Bitter Lesson" de Rich Sutton. Le modèle général battra toujours le modèle spécialisé — donc tout scaffolding est tech-debt temporaire à date d'expiration connue.
- **Multi-agents opérationnels** : les plugins de Claude Code ont été entièrement écrits par un swarm d'agents en un week-end, avec un tableau Asana créé et géré par Claude lui-même.
- **150% de productivité par ingénieur** depuis l'adoption de Claude Code chez Anthropic, avec un doublement de l'effectif. 90-100% du code est écrit par Claude Code.
- **Plan mode = une phrase** : "Please don't code" — c'est littéralement tout ce que plan mode ajoute au prompt. Il a été écrit en 30 minutes un dimanche soir sur la base de GitHub issues.

## Concepts & Méthodologies

### The Bitter Lesson appliquée au produit
Principe de Rich Sutton : la méthode générale (scaling modèles) battra toujours la méthode spécialisée (scaffolding optimisé). Corollaire produit : tout code de scaffolding a une durée de vie de quelques mois. Le trade-off permanent : investir en engineering pour +10-20% maintenant, ou attendre le prochain modèle qui le fait gratuitement.

### Build for the model of tomorrow
Ne pas chercher PMF sur les capacités actuelles du modèle. Identifier la frontière où le modèle est médiocre aujourd'hui — c'est là qu'il sera bon dans 6 mois. Les produits à succès misent sur cette trajectoire.

### Latent demand comme boussole produit
Les gens ne changent pas leur façon de faire les choses. Si quelqu'un fait déjà X d'une façon pénible, rendre X plus facile est une bonne idée. Si personne ne fait X, créer le besoin est voué à l'échec. Chaque feature de Claude Code illustre ce principe.

### Topologie multi-agents
Les agents Claude Code sont des "sub agents" récursifs — "mama quad" spawne des agents enfants qui exécutent des tâches en parallèle avec des context windows fraîches (uncorrelated contexts). Plus de contexte = plus de test-time compute. La topologie détermine les capacités.

### CLAUDE.md minimaliste
Boris n'a que 2 lignes dans son CLAUDE.md personnel : enable automerge sur les PRs + poster dans le channel Slack d'équipe. Tout le reste est dans le CLAUDE.md du repo, maintenu par toute l'équipe. Recommandation : si votre CLAUDE.md grossit trop, supprimez-le et repartez de zéro — puis ajoutez uniquement ce qui corrige des comportements déviants.

→ Voir aussi : [[2026-02-14-agentic-team-memory.md]] (CLAUDE.md comme mémoire d'équipe vivante)
→ Voir aussi : [[2026-02-10-compound-engineering.md]] (boucle d'amélioration continue plan→work→assess→compound)
→ Voir aussi : [[2026-02-10-agent-skills-paradigme.md]] (paradigme skills vs agents spécialisés)

## Pense-bêtes
- Avant de construire une feature, se demander : est-ce que des utilisateurs font déjà ça maladroitement ? (latent demand check)
- Pour tout scaffolding/optimisation : estimer la date d'expiration. Quand le prochain modèle rendra ça obsolète ?
- Le CLAUDE.md optimal est le plus court possible. Supprimer > accumuler.
- Pour le debugging difficile : lancer plusieurs sub-agents en parallèle (un sur les logs, un sur le code path, un sur les tests) plutôt qu'un seul en séquence.
- Plan mode = juste dire "ne code pas encore" au début du prompt. Peut être reproduit sans feature dédiée.
- Les ingénieurs les plus efficaces sont soit des hyper-spécialistes soit des hyper-généralistes — le profil "moyen" devient moins pertinent.

## Citation notable
> "We don't build for the model of today. We build for the model six months from now." — Boris Cherny

> "All of Claude Code has just been written and rewritten and rewritten over and over and over. There is no part of Claude Code that was around 6 months ago." — Boris Cherny

## Contenu détaillé

### Genèse : septembre 2024, un accident fertile
Boris Cherny rejoint Anthropic depuis le Japon rural, séduit par Ben Mann et la mission de sécurité de l'IA. Il intègre l'équipe "Anthropic Labs" — la même qui produira Claude Code, MCP et l'app desktop. L'objectif vague : "faire quelque chose en coding". Sans direction précise, il commence à hacker un terminal app pour apprendre l'API. Quand tool use arrive, il l'intègre par curiosité. Première démonstration de la puissance : il demande au modèle quelle musique il écoute — Claude écrit un AppleScript pour interroger son lecteur musical. Premier moment "AGI feeling".

Deux jours après le prototype, un collègue (Robert) l'utilise déjà pour coder. Dario Mustaï, voyant les courbes d'adoption internes quasi-verticales, demande si les ingénieurs sont forcés d'utiliser l'outil. Non : ils se le passent entre eux spontanément.

### Architecture et principes de développement
L'équipe n'a jamais construit de UI car le terminal permettait d'itérer plus vite. Aujourd'hui Claude Code existe dans le terminal, sur le web, dans l'app desktop (code tab), iOS/Android, Slack, GitHub, VS Code et JetBrains — chaque form factor testé pour trouver le "next thing". Le CLI a survécu bien plus longtemps que prévu : Boris estimait 3 mois de durée de vie il y a un an.

Le code de Claude Code est entièrement réécrit en permanence : aucune partie de la codebase actuelle n'existait il y a 6 mois. Des outils sont dépréciés et ajoutés toutes les deux semaines selon l'évolution des capacités modèle.

### Multi-agents en production
Les plugins de Claude Code ont été entièrement conçus par un swarm en quelques jours : un ingénieur donne un spec à Claude, Claude crée un tableau Asana, spawne des agents qui prennent des tickets et les exécutent. Résultat livré quasi sans intervention humaine. Le pattern "uncorrelated context windows" (fenêtres de contexte fraîches et indépendantes) est présenté comme une forme de test-time compute.

### Prédictions pour 2026
- Le titre "Software Engineer" disparaît au profit de "Builder" ou "Product Manager"
- Tous les rôles fonctionnels (PM, designer, finance, data science) coderont
- Le plan mode a "une durée de vie limitée" — Claude entrera en plan mode de lui-même quand c'est approprié
- ASL4 (auto-amélioration récursive) est le scénario extrême à surveiller
- 4% de tous les commits publics sont déjà produits par Claude Code (source : Semi Analysis)

### Sur le recrutement à l'ère des agents
Boris valide les transcripts Claude Code comme signal de recrutement. Les critères : lit-on les logs ? Corrige-t-on l'agent quand il dévie ? Utilise-t-on plan mode ? Pense-t-on en systèmes ? Les meilleurs ingénieurs sont soit des hyper-spécialistes (maîtrise profonde d'un domaine), soit des hyper-généralistes (qui couvrent product + design + engineering + recherche). La "question magique" en entretien : "Donne-moi un exemple où tu avais tort."
