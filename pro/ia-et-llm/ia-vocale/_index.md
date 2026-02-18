# IA Vocale — Synthèse

## Vue d'ensemble
Ce dossier couvre l'état de l'art et les tendances de l'IA vocale : modèles de synthèse (TTS), de transcription (STT), d'interaction conversationnelle (voice agents), et les innovations architecturales comme le full duplex.

## Fiches

| Fiche | Date | Points clés |
|-------|------|-------------|
| [État de l'art IA vocale — Naïl Zeghidour & Gradium](2026-02-18-ia-vocale-etat-art-gradium.md) | 2026-02-18 | Audio LLMs, full duplex vs cascade, Moshi, Gradium, voice cloning 10s |

## Thèmes récurrents
- **Audio LLMs** : unification de la synthèse, transcription et génération musicale sous un seul paradigme (AudioLM, MusicLM, SoundStream)
- **Full duplex** : Moshi (Kyutai) comme seul modèle conversation nativement full duplex — 160ms de latence
- **Systèmes cascade** : STT → LLM → TTS — composables, déployables en 10 min, mais latence ~0,5–1s
- **Voice cloning** : Gradium, leader mondial avec 10 secondes d'audio suffisantes
- **Frontières actuelles** : compréhension émotionnelle, composabilité des modèles speech-to-speech

## Connexions
→ [Agents IA](../agents/_index.md) — les voice agents s'appuient sur les mêmes patterns d'orchestration LLM
→ [Design IA](../design-ia/_index.md) — UX et modalités de l'interaction voix

---
*Dernière mise à jour : 2026-02-18 — 1 fiche*
