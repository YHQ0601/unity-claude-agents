# unity-claude-agents

Unity Claude Code Lite Workflow v0.1 skeleton.

## Included in v0.1
- `CLAUDE.md` project working agreement.
- 5 subagents in `.claude/agents/`.
- 2 hooks in `.claude/hooks/`.
- 4 skills in `.claude/skills/` (`task-intake`, `implement-unity-feature`, `build-placeholder-assets`, `handoff`).
- 3 rules in `.claude/rules/` (`unity-csharp`, `placeholder-assets`, `context-budget`).
- Minimal docs in `docs/ai/` and `docs/templates/`.
- `docs/systems/` kept empty by default (`.gitkeep`).

## Notes
- `.claude-local/` is local-only state and is ignored by Git.
- Do not prefill system facts before those systems exist in code.
- Create system cards only after systems are actually present.
