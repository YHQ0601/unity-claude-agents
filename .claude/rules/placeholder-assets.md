# Placeholder Assets Rules

## Naming
- Placeholder assets must use `_PH` suffix.
- Placeholder materials must use `MAT_PH_` prefix.
- Placeholder prefabs must use clear functional names.

## Foldering
Temporary assets should live under:
- Assets/_Project/Art/Placeholders/
- Assets/_Project/Art/Materials/Placeholder/
- Assets/_Project/Editor/AIPlaceholderTools/

Do not mix placeholder assets with final art assets.

## Anchor Protocol
Use stable anchors when needed:
- GameplayRoot
- VisualRoot
- Model_ReplaceHere
- VFX_Anchor
- SFX_Anchor
- UI_Anchor
- HitboxPreview
- ReplaceNotes

Gameplay references should prefer stable roots/anchors over temporary meshes.

## Materials
Use simple functional colors for readability, not final look.

## Do Not
- Do not create final art.
- Do not hand-edit complex Unity prefab YAML unless explicitly approved.
- Do not overwrite artist-created assets.
- Do not introduce complex shaders for placeholders.
