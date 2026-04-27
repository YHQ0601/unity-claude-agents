---
description: Keep Unity asset import behavior predictable and avoid accidental quality, memory, platform, or placeholder/final-art regressions.
---

# Unity Asset Import Rules

## Purpose
Keep Unity asset import behavior predictable and avoid accidental quality, memory, or platform regressions.

## General
- Do not change import settings casually.
- Do not batch-modify import settings without a bounded folder and naming rule.
- Prefer Unity Presets or AssetPostprocessor only when the rule is stable.

## Texture Categories
Separate assets by purpose when possible:
- UI icons
- Character textures
- Environment textures
- VFX textures
- Placeholder textures

## Placeholder Assets
Placeholder textures or materials should stay under placeholder folders.
Do not mix placeholder import rules with final art rules.

## Platform Settings
- Do not modify platform compression settings unless explicitly required.
- If texture size, compression, mipmap, or readability changes are needed, explain the reason.

## Automation
If import automation is needed:
- Prefer a narrowly scoped AssetPostprocessor.
- Limit by folder path and naming convention.
- Document the rule in this file or related system card.
