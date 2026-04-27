---
description: Prefer mobile-friendly Unity performance practices, bounded hot paths, measured optimization, and simple placeholder rendering.
---

# Unity Performance Rules

## Target
Prefer mobile-friendly implementation unless the project explicitly targets another platform.

## Hot Path Rules
Avoid in Update / FixedUpdate:
- GameObject.Find
- FindObjectsOfType
- repeated GetComponent
- LINQ allocations
- new allocations in loops
- large physics queries without limits

## Object Lifecycle
- Avoid frequent Instantiate / Destroy for repeated effects or projectiles.
- Prefer pooling when objects are spawned frequently.
- Do not introduce pooling prematurely for one-off objects.

## Rendering / VFX
- Placeholder VFX should stay simple.
- Avoid complex shaders for temporary visuals.
- Avoid high particle counts unless needed and validated.

## Physics / Search
- Range checks, pathfinding, and target searches should be bounded.
- Explain performance risks when adding repeated physics queries.

## Optimization Policy
- First make behavior correct and measurable.
- Do not add complex optimization without evidence.
- For suspected performance issues, recommend profiling instead of guessing.
