# Playas & Anastasia Stasenko : SLM, données synthétiques et open data souverain

## Métadonnées
- **Source** : [La French — Pionnier(e) de la Tech : Anastasia Stasenko / Playas](https://youtu.be/wirmd5kCWok?si=juhBmWikS3XuQvE9)
- **Type** : vidéo
- **Auteur** : Anastasia Stasenko (fondatrice & CEO Playas), avec Steve & JB (La French)
- **Date publication** : 2026-02
- **Date ajout** : 2026-02-18
- **Domaine** : pro
- **Tags** : #slm #llm #donnees-synthetiques #open-data #entrainement #modeles #playas #baguettetron #common-corpus #copyright-ia
- **Confiance** : ⭐⭐⭐⭐⭐ (experte de terrain, fondatrice, résultats publiés et démontrés)

## TL;DR
> Anastasia Stasenko (Playas) démontre qu'on peut entraîner des SLM compétitifs avec très peu de ressources en partant d'une donnée choisie par provenance plutôt que filtrée à posteriori. BaguetteTron (320M paramètres) surpasse des modèles 30× plus grands en raisonnement, entraîné en 1,5 jour sur 4 GPU à partir de 50 000 articles Wikipédia synthétisés en 200 milliards de tokens.

## Points clés
- **Qualité > quantité** : inclure de la donnée qualifiée par provenance (domaine public, open data certifié) bat le scraping + filtrage du Common Crawl
- **Model collapse** : la génération naïve de données synthétiques (prompt → output → ré-entraînement) détruit la diversité et les capacités de raisonnement — il faut des pipelines structurés avec données "seeds" réelles et vérification adversariale
- **SLM < 1 milliard de paramètres** est la nouvelle définition en 2025 (contre ~8B en 2024) ; BaguetteTron (320M) tourne sur 8 Go RAM
- **Le modèle est le produit** : un SLM spécialisé par data design surpasse un LLM généraliste sur des tâches ciblées (télécom, énergie nucléaire, finance)
- **Tout est entraînement** : ne pas séparer pré-entraînement / post-training / fine-tuning — penser à l'objectif dès la conception de la donnée

## Concepts & Méthodologies

### Approche par provenance (vs filtrage à posteriori)
Playas ne part pas du Common Crawl (archives du web) mais choisit les sources en amont : bibliothèques nationales (BNF, OCR), Wikipédia, licences Creative Commons vérifiées, open data gouvernemental. L'objectif : pas de risque légal, reproductibilité garantie, signal dense dès la source.

### Common Corpus
2 000 milliards de tokens à licence permissive exclusive. 3e dataset le plus téléchargé sur HuggingFace. Contribue aussi à Medical Commons et French public domain newspaper dataset.

### Données synthétiques non-naïves
Pipeline structuré : données seeds réelles → modèles fine-tunés générant des tâches RAG (query, contexte, contexte adversarial) → vérificateurs (compilateurs, prouveurs, TRM/HRM) → filtrage des données non conformes. Contrôle explicite de la diversité des "features" personnage/tâche/raisonnement.

### BaguetteTron (Playas)
- 320M paramètres, BF16 8-bit → 900 Mo sur zip-disk (anecdote marketing CES Las Vegas)
- Entraîné sur 200B tokens synthétiques dérivés de 50 000 articles Wikipédia
- 4 GPU × 1,5 jour d'entraînement effectif
- Meilleure performance en raisonnement que GemMa (270M, Google), Liquid et Qwen de taille analogue — tous entraînés sur ~10 trillions de tokens
- Parle bien français, capable de creative writing

### Small Language Models (SLM)
Définition glissante : ~8B params en 2024 → <1B params en 2025 (Tiny à 70M). Motivation : inférence locale souveraine, faible RAM, entreprises sans GPU farm. La décentralisation de l'IA comme levier d'automatisation réelle.

### Domaines semi-vérifiables
Après les domaines vérifiables (code, maths), le prochain enjeu : jurisprudence, finance, télécom, comportements agentiques en entreprise. Architecture Mixture of Experts (MoE) prometteuse pour ces domaines.

### HRM / TRM (Hierarchical / Tiny Reasoning Models)
Modèles de vérification (non-génératifs) intégrés dans le pipeline synthétique pour valider les chaînes de raisonnement. Inspirés du système 1 / système 2 de Kahneman.

→ Voir aussi : [[../agents/2026-02-14-agentic-team-memory.md]]
→ Voir aussi : [[../rag-et-context/]]

## Pense-bêtes
- Pour un SLM spécialisé : modéliser les tâches en amont, générer de la donnée synthétique structurée, vérifier avec des prouveurs/TRM — pas juste fine-tuner sur du texte brut
- L'entraînement bon marché (~4 GPU × 1,5 j) est possible si la donnée est bien conçue ; le coût réel est dans la **génération de données synthétiques**, pas le run d'entraînement
- Avant d'utiliser Common Crawl ou Anna's Archive, évaluer la provenance légale — risque copyright tangible (NYT vs OpenAI, Anthropic class action)
- SLM viable en prod local à partir de 8 Go RAM (BF8), déjà déployable sur Android offline

## Citation notable
> "Ce n'est pas nettoyer, c'est inclure. On a designé l'inclusion — une soirée privée où il n'y a que des données VIP." — Anastasia Stasenko

## Contenu détaillé

### Contexte : le problème de l'open source "de façade"
La plupart des modèles dits open source publient leurs poids mais pas leurs données d'entraînement — or c'est la donnée qui définit le modèle. Quand les données sont publiées (ex. The Pile / EleutherAI), elles se font dépublier sur Hugging Face pour copyright (livres entiers scrapés). Le Common Crawl contient du spam, du porno, des cookies et des contenus protégés reproduits par des tiers — difficile à nettoyer proprement.

### L'approche Playas : provenance d'abord
Playas part de sources vérifiées : domaine public via métadonnées BNF/bibliothèques nationales européennes, Wikipédia (wikidata structuré), open data gouvernemental (data.gouv.fr), Creative Commons strict. Résultat : Common Corpus (2T tokens), actuellement le plus grand dataset à licence permissive.

### Model collapse : pourquoi la synthèse naïve échoue
Entraîner sur des outputs d'autres modèles sans ancrage dans des données réelles détruit la diversité → les modèles "moyennisent" vers les cas les plus fréquents. Analogie : recompresser un JPEG en boucle. La solution : pipelines synthétiques avec seeds réelles variées, vérification adversariale, contrôle explicite de la diversité.

### BaguetteTron : preuve de concept
50 000 articles Wikipédia → 200B tokens synthétiques (via pipeline Playas) → 320M paramètres entraînés en 1,5 jour sur 4 GPU par une équipe de 5-6 personnes bootstrapée. Résultat : meilleur en raisonnement général que des modèles entraînés sur 10 000× plus de données. Fonctionne en français, deployable sur Android offline.

### Vision décentralisée
Playas croit en "l'IA comme primitive" (vs produit centralisé) : des petits modèles souverains que les entreprises installent et contrôlent elles-mêmes. Clients actuels : télécom, énergie nucléaire, transport — modèles 600M paramètres spécialisés, 4 GPU × 1,5 jour.

### Prochain chantier : domaines semi-vérifiables
Architecture MoE + pipeline synthétique structuré + TRM/HRM pour valider les raisonnements en jurisprudence, finance et comportements agentiques. Objectif : des modèles pensés de bout en bout dès la donnée, sans séparation pré/post-training.
