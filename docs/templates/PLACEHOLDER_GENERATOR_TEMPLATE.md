# Placeholder Generator Template

## Purpose
Use this template when creating an Editor script that generates placeholder prefabs, materials, or blockout assets.

## Rules
- Prefer Editor scripts over hand-written .prefab YAML.
- Keep generated assets inside placeholder folders.
- Use `_PH` suffix for placeholder prefabs and objects.
- Use `MAT_PH_` prefix for placeholder materials.
- Include stable replacement anchors.
- Do not overwrite existing artist-created assets.

## Recommended Output Paths
- Assets/_Project/Art/Placeholders/
- Assets/_Project/Art/Materials/Placeholder/
- Assets/_Project/Editor/AIPlaceholderTools/

## Recommended Prefab Structure

Root_PH
├── GameplayRoot
├── VisualRoot
├── Model_ReplaceHere
├── VFX_Anchor
├── SFX_Anchor
├── UI_Anchor
├── HitboxPreview
└── ReplaceNotes

## Editor Script Requirements
The generated script should:
1. Create folders if missing.
2. Create basic materials if missing.
3. Create primitive objects.
4. Assign materials.
5. Create stable anchors.
6. Save the prefab.
7. Avoid overwriting existing prefabs unless explicitly approved.

## Artist Replacement Notes
The generated placeholder should include notes explaining:
- What each primitive represents.
- Which objects can be replaced.
- Which anchors should be preserved.
- Which gameplay references should not be broken.
