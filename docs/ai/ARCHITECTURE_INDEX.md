# ARCHITECTURE_INDEX

## Workflow Core
- `CLAUDE.md`: cross-session stable rules and delegation policy.
- `.claude/agents/`: subagent contracts.
- `.claude/skills/`: reusable progressive-disclosure workflows.
- `.claude/hooks/`: lifecycle automation scripts.
- `.claude/rules/`: operational guardrails (e.g. placeholder asset rules).
- `docs/systems/*.md`: system cards (map, not source of truth).
- `.claude-local/`: local continuity state (ignored by Git).

## v0.1 Enabled Components
- 5 subagents
- 3 hooks (`bootstrap-session`, `route-user-prompt`, `stop-quality-gate`)
- 2 skills (`implement-unity-feature`, `build-placeholder-assets`)
- 1 system card (`skill-system`)
- 1 placeholder asset rule set (`.claude/rules/unity-assets.md`)
