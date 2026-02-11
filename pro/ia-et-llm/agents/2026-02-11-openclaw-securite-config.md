# OpenClaw : sécurité et configuration essentielles

## Métadonnées
- **Source** : [Tweet David Ondrej — "every OpenClaw user must read this"](https://x.com/davidondrej1/status/2021220394611462641)
- **Type** : tweet
- **Auteur** : David Ondrej (@DavidOndrej1)
- **Date publication** : 2026-02-10
- **Date ajout** : 2026-02-11
- **Domaine** : pro
- **Tags** : #openclaw #sécurité #agents-ia #configuration #bonnes-pratiques
- **Confiance** : ⭐⭐⭐ (influenceur tech crédible, mais tweet très bref sans lien explicite ; contenu reconstruit à partir du contexte)

## TL;DR
> David Ondrej recommande vivement aux utilisateurs d'OpenClaw de se former aux bonnes pratiques de sécurité de l'outil. Le contexte : 40 000+ instances exposées, une CVE critique (CVE-2026-25253), et des skills malveillants sur ClawHub. La configuration sécurisée d'OpenClaw est non-négociable.

## Points clés
- **CVE-2026-25253** : vulnérabilité critique (CVSS 8.8) d'exécution de code à distance, divulguée le 30 janvier 2026 — les tokens pouvaient fuiter via les paramètres d'URL
- **40 000+ instances exposées** : dues à des configurations par défaut non sécurisées et des bugs non patchés
- **ClawHub compromis** : des centaines de skills malveillants déguisés en outils légitimes (exfiltration de données, backdoors, malware)

## Concepts & Méthodologies

### Architecture OpenClaw
OpenClaw est un agent IA local open-source (ex-Clawdbot/Moltbot, créé par Peter Steinberger) qui exécute des actions sur le système de l'utilisateur : commandes shell, accès fichiers, emails, APIs, automatisations multi-services.

### Configuration sécurisée (`openclaw.json`)
Cinq modules essentiels :
1. **Gateway** — port d'entrée (18789), tokens d'authentification, logging
2. **Channel** — plateformes de communication (WhatsApp, Telegram, Discord)
3. **Skills** — modules de capacités et permissions
4. **Provider** — modèles IA (Anthropic, OpenAI, modèles locaux)
5. **Security** — politiques de protection et contrôles d'accès

### Politique DM (`dmPolicy`)
- `pairing` (défaut) : code de vérification pour les expéditeurs inconnus
- `allowlist` : accès restreint aux contacts approuvés
- `open` : accès libre (**déconseillé**)
- `disabled` : DMs désactivés

→ Voir aussi : [[2026-02-10-sandbox-agent-patterns.md]] (patterns d'isolation agent-sandbox)

## Pense-bêtes
- **Rotation des tokens** : tous les trimestres minimum
- **Restreindre les skills à risque** : `exec` et `browser` doivent être désactivés ou fortement limités
- **Permissions fichiers** : `chmod 700` sur les dossiers, `chmod 600` sur les fichiers de config
- **Variables d'environnement** pour les API keys, jamais en dur dans `openclaw.json`
- **Sandbox mode** : toujours activé, surtout avec des modèles locaux (risque d'injection de prompt accru)
- **Audit régulier** : `openclaw security audit --deep`
- **Log redaction** : activer `logging.redactSensitive: "tools"` + patterns personnalisés

## Citation notable
> "every OpenClaw user must read this. trust me." — David Ondrej

## Contenu détaillé
OpenClaw, né comme projet weekend de Peter Steinberger fin 2025 sous le nom de Warelay, puis Clawdbot, est devenu viral début 2026 grâce à sa nature open-source et au projet Moltbook. L'outil transforme un Mac (ou toute machine) en agent IA capable d'agir directement sur les applications et fichiers de l'utilisateur — une puissance qui crée des vulnérabilités majeures si mal configurée.

Le tweet de David Ondrej du 10 février 2026 intervient dans un contexte critique : la veille, The Register révélait que des dizaines de milliers d'instances OpenClaw étaient exposées sur Internet sans protection. La CVE-2026-25253 (CVSS 8.8) permettait l'exécution de code à distance via une fuite de tokens dans les URLs. En parallèle, The Hacker News rapportait que ClawHub, le marketplace de skills d'OpenClaw, hébergeait des centaines de skills malveillants masqués en outils légitimes.

La configuration sécurisée passe par le fichier `openclaw.json`, structuré en cinq sections (Gateway, Channel, Skills, Provider, Security). Les mesures critiques incluent : activer le mode sandbox systématiquement, restreindre les skills à risque (exec, browser), utiliser le mode `allowlist` pour les DMs, ne jamais exposer les tokens d'authentification, et auditer régulièrement la configuration via les outils intégrés.

L'article de Northeastern du même jour qualifie OpenClaw de "cauchemar pour la vie privée", soulignant le compromis fondamental entre fonctionnalité et sécurité : plus l'agent est capable, plus les dégâts potentiels sont importants en cas de compromission. La priorité des valeurs de configuration (variables d'environnement > fichier config > valeurs par défaut) permet un hardening progressif sans modifier les sources.

Pour les modèles locaux, les risques d'injection de prompt sont démultipliés par rapport à l'API Claude d'Anthropic, rendant l'isolation sandbox et la restriction des permissions encore plus critiques.
