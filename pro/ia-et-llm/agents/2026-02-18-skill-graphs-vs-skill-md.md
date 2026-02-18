# Skill Graphs : dépasser les limites du SKILL.md monolithique

## Métadonnées
- **Source** : [Tweet Heinrich (@arscontexta)](https://x.com/arscontexta/status/2023957499183829467?s=12&t=l7NF5i6ZAzn8oKo4baCXXg)
- **Type** : tweet
- **Auteur** : Heinrich (@arscontexta)
- **Date publication** : 2026-02-18
- **Date ajout** : 2026-02-18
- **Domaine** : pro
- **Tags** : #skills #knowledge-graph #claude-code #agents #structured-knowledge
- **Confiance** : ⭐⭐⭐ (auteur praticien reconnu dans l'écosystème Claude Code, concept bien argumenté mais source courte)

## TL;DR
> Les gens sous-estiment le pouvoir de la connaissance structurée. Heinrich propose de remplacer le fichier SKILL.md unique par un graphe de skills — un réseau de fichiers markdown interconnectés par des wikilinks, rendant la connaissance traversable et composable à n'importe quelle profondeur.

## Points clés
- **Limite du SKILL.md monolithique** : un seul fichier ne peut capturer qu'un aspect d'un domaine — il sature rapidement pour les domaines complexes
- **Skill Graph = réseau de fichiers** : chaque fichier est une pensée, technique ou skill complète ; les wikilinks créent un graphe traversable récursivement
- **Nouveaux types d'applications** : la connaissance structurée en graphe permet des usages impossibles avec un fichier plat (traversée contextuelle, chargement sélectif, mise à jour modulaire)
- **Implémentation arscontexta** : plugin Claude Code avec 249 fichiers interconnectés qui génère un système de connaissance adapté au workflow de chaque utilisateur

## Concepts & Méthodologies

**Skill Graph vs SKILL.md**

| Dimension | SKILL.md | Skill Graph |
|-----------|----------|-------------|
| Structure | Fichier unique | Réseau de fichiers liés |
| Profondeur | Limitée par la taille | Illimitée (traversée récursive) |
| Composabilité | Non | Oui — chaque nœud est autonome |
| Mise à jour | Tout-ou-rien | Granulaire par nœud |
| Chargement | Tout en contexte | Sélectif selon le chemin |

**Principe de traversée récursive** : un skill graph applique le même pattern de découverte de skills à l'intérieur du graphe lui-même. Le point d'entrée résout vers d'autres nœuds selon le contexte, comme un graphe de connaissance classique mais pour les connaissances procédurales des agents.

**Exemple de domaine** : un skill graph juridique pourrait inclure des nœuds "patterns de contrats", "exigences de conformité", "spécificités de juridiction", "chaînes de précédents" — tous traversables depuis un point d'entrée unique.

Liens vers des fiches connexes :
→ Voir aussi : [[2026-02-10-agent-skills-paradigme.md]] — paradigme original des skills Anthropic
→ Voir aussi : [[2026-02-14-agentic-team-memory.md]] — encoder le savoir dans des fichiers de contexte
→ Voir aussi : [[2026-02-10-compound-engineering.md]] — accumulation de learnings via skills

## Pense-bêtes
- Structurer ma knowledge base comme un skill graph : chaque `_index.md` devient un nœud d'entrée vers des fiches spécialisées
- Pour tout domaine avec ≥5 fiches : créer un fichier `_map.md` qui relie les fiches par concept, pas seulement par date
- Les wikilinks `[[fiche.md]]` sont la clé — ils rendent la structure traversable par un agent
- Un skill graph pour Claude Code = CLAUDE.md comme point d'entrée → liens vers des fichiers thématiques spécialisés

## Citation notable
> "people underestimate the power of structured knowledge. it enables entirely new kinds of applications" — Heinrich (@arscontexta)

## Contenu détaillé

Heinrich (@arscontexta) publie un thread court mais dense sur Twitter/X le 18 février 2026, en réaction au pattern SKILL.md devenu standard dans l'écosystème Claude Code.

**Le constat de départ** : les practitioners écrivent des skills qui ne capturent qu'un aspect d'un problème — un skill de résumé, un skill de revue de code. Cette approche fonctionne pour les cas simples mais atteint rapidement ses limites dès qu'un domaine devient complexe. Un seul fichier SKILL.md ne peut pas contenir la profondeur nécessaire à une expertise réelle.

**La proposition : Skill Graphs**

Au lieu d'un fichier monolithique, un Skill Graph est un réseau de fichiers markdown où chaque nœud représente une pensée, technique ou skill complète. Les wikilinks (`[[fichier.md]]`) entre les nœuds créent un graphe traversable. L'agent — Claude Code en l'occurrence — peut explorer ce graphe en suivant les liens selon le contexte de la requête.

La propriété clé est la **récursivité** : le mécanisme de découverte de skills s'applique à l'intérieur du graphe lui-même. Cela signifie que l'agent peut naviguer vers la profondeur exacte de connaissance nécessaire, sans charger tout le contexte inutilement.

**L'implémentation arscontexta**

Le projet arscontexta (plugin Claude Code open source sur GitHub) est la concrétisation de cette idée : 249 fichiers de connaissance structurée que l'agent traverse pour dériver un système de connaissance local adapté au workflow de l'utilisateur. L'utilisateur décrit comment il pense et travaille, une conversation génère un "second cerveau" complet sous forme de fichiers markdown qu'il possède.

**Pourquoi c'est important**

La connaissance structurée en graphe débloquerait des types d'applications radicalement nouveaux : personnalisation fine par domaine, chargement sélectif du contexte, mise à jour modulaire sans réécriture complète, collaboration sur des sous-graphes. C'est l'application aux agents IA du principe des knowledge graphs académiques, mais optimisée pour les connaissances procédurales et le chargement en contexte.
