---
description: Guide Unity C# implementation toward simple, focused, serialization-safe, performance-aware gameplay code.
---

# Unity C# Rules

## General
- Prefer simple, explicit C# code.
- Avoid over-engineering for one-off features.
- Do not refactor unrelated systems.
- Keep MonoBehaviour responsibilities focused.

## Serialization
- Be careful when renaming serialized fields.
- Prefer `[SerializeField] private` fields over public mutable fields.
- Do not change serialized field names without considering existing Inspector data.

## Scene / UI Reference Rules
- Do not use string/name/path-based lookups for runtime scene, prefab, or UI wiring, such as `GameObject.Find("...")`, `transform.Find("...")`, `GetComponent("TypeName")`, or `Find(...).GetComponent<...>()`.
- Prefer `[SerializeField] private` typed references assigned in the Inspector, prefab, or controlled Editor/generator scripts.
- `GetComponent<T>()` is allowed for type-safe same-object or already-referenced-object dependencies, preferably in `Awake`, `Reset`, `OnValidate`, or setup code, and the result should be cached.
- Do not repeatedly call `Find`, `GetComponent`, LINQ, or scene-wide discovery APIs in `Update` / `FixedUpdate`.
- For UI and child nodes, prefer serialized typed view/component references instead of relying on hierarchy display names.
- Exceptions are limited to editor-only migration/setup/test scripts and must include a short reason plus validation/null handling.

## ScriptableObject Config Rules
- Prefer ScriptableObject or the existing config system for skills, items, characters, levels, and balance data.
- Do not hardcode long-term configuration in MonoBehaviours.
- ScriptableObjects should store configuration/static data, not runtime combat state.
- Runtime state should live in runtime components or dedicated state objects.
- Before adding new config types, inspect existing config patterns.

## Runtime Performance
- Avoid expensive operations in Update / FixedUpdate.
- Avoid frequent Find, GetComponent, LINQ, or allocations in hot paths.
- Use object pooling for frequently spawned temporary objects when appropriate.

## Assembly Definition Policy
- Do not introduce many asmdef files early.
- Consider asmdef only when compile time or module boundaries become real problems.
- Separate Runtime, Editor, and Tests only when the project structure justifies it.
