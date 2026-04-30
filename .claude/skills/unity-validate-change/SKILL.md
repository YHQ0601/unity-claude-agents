---
name: unity-validate-change
description: Use this skill after Unity code, prefab, scene, asset, package, or behavior-affecting changes to assess compile, runtime, serialization, reference, performance, and manual Unity Editor validation risks.
---

# unity-validate-change

Purpose: Unity-specific post-change validation.

## Workflow
1. Identify changed files and changed area.
2. Map affected systems using available structured context first.
3. Check Unity serialization, prefab, scene, asset, and reference risks.
4. Check runtime scene/UI reference wiring for fragile string/name/path-based lookups, including `GameObject.Find(...)`, `transform.Find(...)`, `GetComponent("...")`, and `Find(...).GetComponent<...>()`.
5. Check compile, runtime, and performance risks.
6. Identify existing or missing test coverage.
7. Recommend the smallest useful EditMode, PlayMode, or manual Unity Editor checks.
8. Expand file reading only when the initial risk map is insufficient.

## Output Format
## Changed Area

## Affected Systems

## Unity Risks

## Serialization / Reference Risks

## Runtime Risks

## Performance Risks

## Test Recommendation

## Manual Unity Editor Checks

## Pass / Risky / Fail
