# Unity Project Safety Rules

## Source Control Sensitive Files
Be careful with:
- .meta
- .prefab
- .unity
- ProjectSettings
- Packages/manifest.json

## Meta Files
- Do not manually modify .meta files unless explicitly required.
- Do not delete .meta files without confirming the corresponding asset deletion.
- If many .meta files change, warn the user.

## Prefab and Scene Files
- Do not hand-edit complex .prefab or .unity YAML unless explicitly approved.
- Prefer Unity Editor operations, Editor scripts, or controlled prefab generation.
- If prefab or scene files changed unexpectedly, report it.

## ProjectSettings
- Do not modify ProjectSettings unless the task explicitly requires it.
- Any ProjectSettings change must be summarized clearly.

## Asset Deletion
- Do not delete assets unless their usage has been checked.
- For uncertain assets, mark them for review instead of deleting them.

## Packages
- Do not add or remove Unity packages without approval.
- If Packages/manifest.json changes, explain why.
