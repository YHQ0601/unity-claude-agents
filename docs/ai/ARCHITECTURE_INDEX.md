# ARCHITECTURE_INDEX

## Workflow Core
- `CLAUDE.md`: cross-session stable rules and delegation policy.
- `.claude/agents/`: subagent contracts.
- `.claude/skills/`: reusable progressive-disclosure workflows.
- `.claude/hooks/`: lifecycle automation scripts.
- `docs/systems/*.md`: system cards (map, not source of truth).
- `.claude-local/`: local continuity state (ignored by Git).

## v0.1 Enabled Components
- 5 subagents
- 2 hooks (`bootstrap-session`, `route-user-prompt`)
- 2 skills (`implement-unity-feature`, `make-asset-brief`)
- 1 system card (`skill-system`)
