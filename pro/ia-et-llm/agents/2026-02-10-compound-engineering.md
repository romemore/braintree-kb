# Compound Engineering : rendre Claude Code meilleur à chaque utilisation

## Métadonnées
- **Source** : [How to Make Claude Code Better Every Time You Use It (50 Min Tutorial) | Kieran Klaassen](https://youtu.be/g6z_4TMDiaE?si=6nHZ7yPl-P9WyBpH)
- **Type** : vidéo
- **Auteur** : Peter Yang (interview de Kieran Klaassen, CTO de Kora / Every)
- **Date publication** : 2026-02-10
- **Date ajout** : 2026-02-10
- **Domaine** : pro
- **Tags** : #claude-code #compound-engineering #agents #workflow #automatisation #devtools
- **Confiance** : ⭐⭐⭐⭐ (praticien expérimenté, démonstration concrète, mais approche personnelle non encore standardisée)

## TL;DR
> Kieran Klaassen présente le "Compound Engineering" — une philosophie en 4 étapes (planifier, travailler, évaluer, capitaliser) qui rend Claude Code progressivement meilleur grâce à l'accumulation de learnings. Il montre son plugin open-source avec des slash commands pour la planification enrichie, l'exécution guidée, la revue multi-perspective et les tests automatisés via Playwright.

## Points clés
- **Boucle d'amélioration continue** : Plan → Work → Assess → Compound — chaque cycle capture les erreurs et apprentissages pour que l'IA ne les reproduise plus
- **Planification enrichie** : Contrairement au plan mode natif, le plugin lance des sub-agents parallèles pour analyser le code existant, rechercher les best practices en ligne, et vérifier les versions des frameworks
- **Skills comme contexte à la demande** : Des dossiers de connaissances procédurales chargés en just-in-time pour ne pas saturer la fenêtre de contexte
- **Tests Playwright avec Opus 4.5** : Premier modèle où le contrôle navigateur via Playwright fonctionne de manière fiable — permet de tester comme un QA sans écrire de tests
- **Revue multi-perspective** : Agents de revue spécialisés (sécurité, architecture, simplicité, style DHH) dont les résultats sont synthétisés et triés par priorité (P1/P2/P3)
- **Commande LFG** : Orchestration end-to-end — planification, implémentation, tests, vidéo de démo et création de PR en une seule commande

## Concepts & Méthodologies

### La boucle Compound Engineering
```
1. PLAN   → Recherche approfondie (code, web, frameworks) via sub-agents parallèles
2. WORK   → Exécution du plan avec questions de clarification initiales
3. ASSESS → Revue multi-perspective + triage interactif des findings
4. COMPOUND → Capture des learnings dans des fichiers docs/ consultés lors des futurs plans
```

### Architecture des slash commands
- `/workflows plan` — Planification enrichie avec sub-agents de recherche
- `/workflows work` — Exécution guidée depuis le plan
- `/compound` — Capture les learnings du contexte courant
- `/review` — Lance les agents de revue multi-perspective
- `/triage` — Walk-through conversationnel des findings
- `/resolve` — Résolution parallèle des to-dos via sub-agents
- `/lfg` — Orchestration complète end-to-end

### Taxonomie des outils Claude Code
| Outil | Usage | Déclenchement |
|-------|-------|---------------|
| Slash commands | Actions déclenchées (commit, PR, plan) | Manuel ou par agent |
| Sub-agents | Tâches spécialisées en contexte séparé | Via slash commands |
| Skills | Contexte de domaine chargé à la demande | Automatique par le modèle |
| Hooks | Scripts déclenchés par événements | Automatique |

### Mode dangerously-skip-permissions
- Alias `cc` = `claude --dangerously-skip-permissions`
- Adapté pour les flows automatisés où les checks sont déportés au moment de la PR/merge
- Précaution : s'assurer que l'environnement sandbox est sûr

→ Voir aussi : [[2026-02-10-agent-skills-paradigme.md]] (architecture des skills et progressive disclosure)

## Pense-bêtes
- La capitalisation (`/compound`) est le levier principal — chaque erreur corrigée est une erreur en moins pour toujours
- Le plus simple pour commencer : après chaque correction, dire "ajoute ça à CLAUDE.md"
- Investir dans la phase plan paie exponentiellement — corriger un mauvais design coûte cher en tokens et temps
- Playwright + Opus 4.5 = QA automatisé sans écrire de tests → tester comme un humain
- Les sub-agents protègent le contexte principal et permettent la parallélisation
- Le plugin compound-engineering est open-source et modulaire — on peut n'utiliser qu'une partie

## Citation notable
> "AI can learn, which is really cool. So if you invest time to have the AI learn what you like and learn what it does wrong, it won't do it the next time. That's the seed for compound engineering." — Kieran Klaassen

## Contenu détaillé

Kieran Klaassen, CTO de Kora (un assistant email chez Every), présente le **Compound Engineering** — une philosophie qu'il a développée en un an d'utilisation intensive de Claude Code. Le principe fondamental : l'IA peut apprendre de ses erreurs si on capture systématiquement les feedbacks.

La **boucle en 4 étapes** structure chaque cycle de développement. La **planification** (`/workflows plan`) est la plus riche : elle lance plusieurs sub-agents en parallèle qui analysent le code existant pour détecter les patterns, recherchent les best practices en ligne, vérifient les versions des frameworks utilisés, et analysent les flux utilisateur pour détecter les oublis. Ces sub-agents consomment beaucoup de tokens (50-80k chacun) mais produisent des plans de haute qualité ancrés dans la réalité du code.

L'étape **work** (`/workflows work`) prend le plan et commence par poser des questions de clarification — un mécanisme de "thinking mode" forcé qui améliore la qualité avant l'exécution. Kieran recommande de laisser l'agent décider plutôt que de micro-manager chaque réponse.

L'**assessment** (`/review`) est particulièrement innovant : des agents spécialisés (sécurité, architecture, simplicité de code, style "DHH") examinent le code produit et génèrent des findings classés P1 à P3. Un `/triage` conversationnel permet ensuite de décider quoi traiter, et `/resolve` lance la résolution en parallèle.

Le **compound** (`/compound`) capture les apprentissages dans un dossier `docs/` avec du front matter pour le référencement. Ces fichiers sont consultés automatiquement lors des futures planifications. L'alternative minimaliste : simplement dire "ajoute ça à CLAUDE.md" pour les règles générales.

Un point fort de la démonstration : l'utilisation de **Playwright** avec Opus 4.5 pour des tests end-to-end visuels. L'agent contrôle Chrome, prend des screenshots, lit la console, et peut corriger immédiatement les bugs détectés. Il peut aussi enregistrer des vidéos de démo automatiquement attachées aux PR.

La commande **LFG** représente la vision finale : une seule instruction déclenche planification, implémentation, tests, revue, vidéo de démo et création de PR. Kieran note que cette automatisation complète nécessite un système compound bien entraîné pour fonctionner de manière fiable.

Côté setup pratique, Kieran utilise le terminal **Warp**, tourne en mode `--dangerously-skip-permissions` avec un alias, et utilise **Typora** (thème Witty) pour lire les plans markdown. Il recommande le plan Max d'Anthropic pour les développeurs professionnels, soulignant que le coût est négligeable comparé au salaire d'un développeur.
