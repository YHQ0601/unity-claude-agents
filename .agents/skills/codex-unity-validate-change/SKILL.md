---
name: codex-unity-validate-change
description: Use after Unity code, prefab, scene, asset, package, or behavior-affecting changes to assess compile, runtime, serialization, reference, performance, and manual Unity Editor validation risks.
---

# codex-unity-validate-change

This is the Codex wrapper for the canonical Claude Code skill at
`.claude/skills/unity-validate-change/SKILL.md`.

Read that file when available and treat it as the source workflow. If the file
cannot be loaded, follow this workflow:

1. Identify changed files and changed area.
2. Map affected systems using available structured context first.
3. Check Unity serialization, prefab, scene, asset, and reference risks.
4. Check runtime scene/UI reference wiring for fragile string/name/path-based lookups.
5. Check compile, runtime, and performance risks.
6. Identify existing or missing test coverage.
7. Recommend the smallest useful EditMode, PlayMode, or manual Unity Editor checks.
8. Expand file reading only when the initial risk map is insufficient.
