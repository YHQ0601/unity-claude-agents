# Unity Placeholder Asset Rules

## Naming
- Placeholder assets must use `_PH` suffix.
- Placeholder materials must use `MAT_PH_` prefix.
- Placeholder prefabs must use clear functional names.

Examples:
- WhirlwindSlash_PH.prefab
- MAT_PH_Skill_AOE_Blue.mat
- EnemyBoss_Blockout_PH.prefab

## Foldering
Temporary assets should live under:
- Assets/_Project/Art/Placeholders/
- Assets/_Project/Art/Materials/Placeholder/
- Assets/_Project/Editor/AIPlaceholderTools/

Do not mix placeholder assets with final art assets.

## Replacement
Every placeholder prefab should include stable child anchors when needed:
- VisualRoot
- VFX_Anchor
- SFX_Anchor
- HitboxPreview
- Model_ReplaceHere
- Icon_ReplaceHere

Gameplay scripts should reference the stable root or anchor, not a specific temporary mesh whenever possible.

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
