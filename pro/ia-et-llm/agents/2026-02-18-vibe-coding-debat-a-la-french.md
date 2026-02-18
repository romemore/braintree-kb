# Vibe Coding en 2026 : coder ou vibe coder ?

## Métadonnées
- **Source** : [Vibecoding: Ce que l'IA change VRAIMENT pour les Développeurs](https://youtu.be/25MwBEWxQG0?si=jqn_5Tw8V6c1c_Vf)
- **Type** : vidéo
- **Auteur** : À la French (Jules, Steve Borin, Jean-Baptiste Le Kem)
- **Date publication** : 2026-02-18
- **Date ajout** : 2026-02-18
- **Domaine** : pro
- **Tags** : #vibe-coding #ia-coding #developpement #outils #claude-code #codex #devstral #education
- **Confiance** : ⭐⭐⭐⭐ (praticiens expérimentés — JB = core VLC/FFmpeg, Steve = entrepreneur tech, retours terrain concrets)

## TL;DR
> Le vibe coding (terme de Karpathy, fév. 2025) désigne la délégation totale de l'écriture de code à l'IA au niveau d'abstraction maximal, avec boucle itérative de tests. C'est un outil formidable pour les seniors qui brisent la page blanche et intègrent des APIs externes — mais dangereux entre les mains de juniors qui n'ont pas encore mangé les problèmes de bas niveau. L'IA = très bon stagiaire avec beaucoup de connaissances, mais peu intelligent.

## Points clés
- **Définition stricte** : vibe coding = abstraction maximale + boucle test/correction entièrement gérée par l'IA (Karpathy, tweet vocal, fév. 2025)
- **Cas d'usage #1** : page blanche — l'IA permet de passer de 0 à une V1 en minutes, cassant la barrière d'entrée dans le flow
- **Force de l'IA** : elle lit vraiment la documentation, comble le fossé "RTFM" que les développeurs évitent
- **Modèle mental** : IA = stagiaire avec énorme base de connaissances mais peu intelligent — fonctionne parfaitement pour des tâches déléguées précises
- **Limite hard** : SIMD/assembleur (NEON, AVX, SSE) — données d'entraînement insuffisantes, l'IA échoue même avec RAG
- **Ce qui tue vraiment** : pas l'écriture de code (facile), c'est la maintenance — le vibe coding exacerbe ce problème

## Concepts & Méthodologies

### Le spectre du vibe coding
Pas binaire : entre "prompt haut niveau → accepte tout" (pur Karpathy) et "assistant inline" (Copilot), il y a un continuum. JB utilise un fichier Markdown plan → checkbox → étapes + arrêts intermédiaires = vibe coding guidé.

### Pattern plan/exécution séparé
Un modèle génère le plan (fichier MD vivant, à la Redis creator), un autre l'exécute. Les agents de planning et d'exécution différenciés donnent de meilleurs résultats. Double IA : une génère, une vérifie.

### Disposable software vs maintenance
Scripts de migration, one-shots de conversion (PDF→texte, dump→Perfetto) : le code vibe-codé est parfait s'il n'est jamais maintenu. Dès qu'il est réutilisé régulièrement → problème de maintenabilité inévitable.

### Retour aux fondamentaux
L'IA va générer le code, donc la valeur ajoutée du dev se déplace vers l'architecture, la compréhension OS/mémoire, la calling convention, les trade-offs vectoriels. Apprendre le C avant Python (et non l'inverse) reste pertinent — la feuille pliée dans l'autre sens est plus difficile à déplier.

### Personal software revival
Des non-devs (directeur juridique) deviennent "vibe devs" — capables de construire des outils internes métiers sans écrire une ligne de code. Retour du personal computing, mais par les usages professionnels.

### L'IA lit la doc (le vrai avantage)
L'IA a indexé Stack Overflow, la documentation officielle, les millions de dépôts GitHub. Elle exécute le "RTFM" que le développeur n'a pas le temps (ou l'envie) de faire. Corollaire : la doc doit être à jour plus que jamais (conférence "AI the Doc").

Liens vers d'autres fiches :
→ Voir aussi : [[pro/ia-et-llm/agents/2026-02-18-boris-cherny-claude-code-genese.md]] (Claude Code, architecture multi-agents)
→ Voir aussi : [[pro/ia-et-llm/agents/2026-02-10-workflows-dev-tools-ia.md]] (workflows dev tools personnalisés)
→ Voir aussi : [[pro/ia-et-llm/design-ia/2026-02-16-design-ia-vibe-coding.md]] (vibe coding côté design)
→ Voir aussi : [[pro/veille-marche/saas-et-ia/2026-02-18-predictions-ia-2026-a-la-french.md]] (même émission, prédictions 2026)

## Pense-bêtes
- Utiliser le vibe coding **comme outil de démarrage**, pas de livraison finale : casser la page blanche, puis refactorer à ma main
- Pour tout projet, écrire un fichier Markdown plan avant de lancer l'IA — checkbox par étape, "arrête et on revoit" après chaque étape
- Ne jamais laisser un vibe-codé non relu en production dès qu'il y a une surface d'exposition (sécurité, CORS, CSRF)
- Pour les scripts one-shot (conversion, migration, visualisation) → vibe coding sans état d'âme
- Distinguer les deux rôles : IA de planning (haut niveau) vs IA d'exécution (implémentation)
- Devstral 2 (Mistral) : option viable pour faire tourner en local, gap comblé avec Claude Code à surveiller

## Citation notable
> "Écrire du code, c'est facile. Ce qui te met dedans, ce qui te tue, c'est maintenir le code." — JB Le Kem

> "Il a énormément de connaissances mais il est pas très intelligent." — JB sur le LLM comme stagiaire

## Contenu détaillé

### Définition et origines
Le terme "vibe coding" a été introduit par Andrej Karpathy dans un tweet de février 2025 : il décrit son usage d'un pipeline vocal (Whisper → commandes) où il accepte tout ce que l'IA propose et la laisse gérer la boucle itérative de build/test/correction. La clé : non seulement l'IA écrit le code, mais elle gère aussi la boucle de feedback (erreurs de compilation → réinjection → correction).

### Ce que vibe coding veut dire vraiment
Il existe une confusion entre "j'utilise l'IA pour coder" et "je vibe code". La définition stricte = abstraction maximale, l'IA fait tout, y compris les tests. Dans la pratique, la plupart des développeurs se situent sur un spectre : du vibe pur (V0 par Vercel, "génère-moi un site web à partir de ce PDF investisseur") jusqu'à l'assistant de code (suggestions inline, refactoring ciblé).

### Cas d'usage concrets (retours terrain)
- **V0 / Vercel** : site web complet en 1h depuis une présentation PDF — époustouflant pour des cas simples
- **Portage VLC sur Vega OS (Amazon Fire TV)** : démo CES en 24h, un module audio output généré en 30 min à partir des autres modules existants + doc système Vega
- **Décodeur AV2 au CES** : adaptation du code AOM/AV1 vers AV2 en 1h15 (contre une journée complète sans IA)
- **Script Perfetto** : conversion dump cycles CPU → traces Perfetto en 15 min, valeur énorme (X10 sur la visualisation) pour du code one-shot dont la qualité importe peu
- **Documentation Doxygen** : génération et vérification de doc technique propre, sans typo, syntaxe correcte

### Les limites réelles
L'assembleur SIMD (NEON, AVX, SSE2/MMX) est hors de portée : trop peu de données d'entraînement spécialisées, même avec du RAG ou du contexte injecté. Le Zig reste fragile (langage en évolution rapide, STD lib changeante — solution : injecter la STD lib dans le contexte). La codebase enterprise complexe nécessite toujours un développeur senior pour guider.

### Impact sur l'éducation et les fondamentaux
La vraie valeur du développeur se déplace vers la compréhension bas-niveau : OS, mémoire virtuelle, MMU/TLB, calling conventions, hiérarchie mémoire (registres → L1/L2/L3 → RAM → SSD → cloud, ordres de grandeur 10^8). Les écoles qui suppriment le C au profit du Python seul créent des "vibe codeurs" sans fondamentaux. Le modèle mental est similaire à la compta à la main : le faire une fois pour comprendre, déléguer ensuite.

### Stacks outils mentionnées
- **JB** : Vim (pas Neovim), plugin tags, Claude Code CLI + Codex CLI + Devstral 2 (objectif : tourner en local)
- **Steve** : Z editor (héritier VS Code/Emacs), GitHub Copilot intégré, agents avec boucle de build, choix de modèle selon tâche
- **Commun** : CLI dans le terminal, pas d'IDE imposé — débat terminal vs éditeur pour le contexte optimal

### L'IA et Stack Overflow
Stack Overflow a perdu 50% de son trafic avant même ChatGPT (toxicité communautaire), puis l'IA a "plié le game". Aujourd'hui, le CEO revend la codebase aux entreprises pour entraîner des modèles internes. La valeur s'est déplacée de "répondre aux questions" vers "donner le contexte précis de mon problème".
