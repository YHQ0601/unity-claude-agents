---
description: Keep Unity placeholder assets temporary, replaceable, clearly named, and separated from final art while preserving stable replacement anchors.
---

# Placeholder Asset Rules

## Purpose
Placeholder assets are temporary, replaceable assets used to test gameplay and communicate intent before final art is ready.

## Naming
- Placeholder prefabs must use `_PH` suffix.
- Placeholder materials must use `MAT_PH_` prefix.
- Placeholder scripts or editor tools should use clear functional names.

Examples:
- WhirlwindSlash_PH.prefab
- MAT_PH_Skill_AOE_Blue.mat
- EnemyBoss_Blockout_PH.prefab

## Foldering
Temporary assets should live under a dedicated placeholder folder, for example:
- Assets/_Project/Art/Placeholders/
- Assets/_Project/Art/Materials/Placeholder/
- Assets/_Project/Editor/AIPlaceholderTools/

Do not mix placeholder assets with final art assets.

## Prefab Anchor Protocol
Every placeholder prefab should prefer this structure when applicable:

Root_PH
├── GameplayRoot
├── VisualRoot
├── Model_ReplaceHere
├── VFX_Anchor
├── SFX_Anchor
├── UI_Anchor
├── HitboxPreview
└── ReplaceNotes

## Replacement
- Gameplay code should reference stable anchors, not temporary primitive meshes.
- Artists should replace objects under VisualRoot or Model_ReplaceHere.
- Keep VFX_Anchor and SFX_Anchor stable when possible.
- Do not bind gameplay directly to temporary Cube/Sphere objects.

## Materials
Use simple functional colors:
- Red: damage / enemy / danger
- Blue: player skill / area / magic
- Green: healing / positive effect
- Yellow: interactable / pickup / highlight
- Gray: neutral blockout
- Purple: special / debuff / curse

## Do Not
- Do not create final art.
- Do not hand-edit complex Unity prefab YAML unless explicitly approved.
- Do not overwrite artist-created assets.
- Do not introduce complex shaders for placeholders.
