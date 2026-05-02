# unity-claude-agents

Unity AI Agent Lite Workflow v0.3.

This repository provides a lightweight AI agent workflow scaffold for Unity game projects. It keeps the original Claude Code workflow intact and adds adapter layers for Codex and opencode so developers can switch tools while following the same project rules.

这个仓库是一套面向 Unity 项目的 AI 工作流模板。它不是游戏框架，也不预设玩法系统；它提供的是一组 agents、skills、rules 和文档模板，用来帮助 Claude Code、Codex 和 opencode 在 Unity 项目中更稳定地协作和交付。

## What It Includes

- `CLAUDE.md`: Claude Code working agreement for the main orchestrator.
- `AGENTS.md`: shared working agreement for Codex, opencode, and other agent tools that support this convention.
- `.claude/agents/`: Claude Code subagents for architecture review, Unity code work, placeholder assets, QA, and project memory.
- `.claude/skills/`: canonical reusable workflows for task intake, Unity feature implementation, placeholder asset creation, handoff, and validation.
- `.claude/rules/`: Unity-specific guardrails for C#, asset import, performance, project safety, placeholders, and context budget.
- `.claude/hooks/`: Claude Code hooks for session bootstrap and prompt routing.
- `.codex/agents/`: Codex project-scoped agents mapped to the Claude Code roles.
- `.codex/config.toml` and `.codex/hooks.json`: Codex hook feature flag and hook adapters that reuse the existing `.claude/hooks/` scripts.
- `.agents/skills/`: Codex wrapper skills that point back to the canonical `.claude/skills/` workflows.
- `.opencode/agents/`: opencode project-scoped agents mapped to the Claude Code roles.
- `opencode.json`: opencode project configuration for extra instructions and skill permissions.
- `docs/ai/`: high-level project brief and architecture index.
- `docs/templates/`: templates for tasks, ADRs, system cards, and placeholder asset generators.

## Tool Entry Points

Claude Code remains unchanged:

- read `CLAUDE.md` first;
- use `.claude/agents/`, `.claude/skills/`, `.claude/rules/`, and `.claude/hooks/`;
- keep `.claude/settings.json` as the Claude Code hook configuration.

Codex support:

- read `AGENTS.md` for the shared project agreement;
- use `.codex/agents/*.toml` for the mapped subagent roles;
- use `.agents/skills/codex-*/SKILL.md` for wrapper skills;
- project hooks are enabled by `.codex/config.toml` and defined in `.codex/hooks.json`, but Codex only loads repo-local hooks when the project `.codex/` layer is trusted.

opencode support:

- read `AGENTS.md` for the shared project agreement;
- use `.opencode/agents/*.md` for the mapped subagent roles;
- use canonical `.claude/skills/*/SKILL.md` through opencode's Claude-compatible skill discovery;
- `opencode.json` denies `codex-*` wrapper skills so opencode does not show duplicate workflow entries.

## Intended Use

Use this scaffold when you want AI coding tools to work inside a Unity repository with clearer boundaries:

- understand the user's goal before editing;
- prefer small, useful changes over broad refactors;
- route specialized work to the right subagent;
- avoid unsafe Unity file edits such as unnecessary `.meta`, prefab, scene, or `ProjectSettings` changes;
- document only systems that actually exist or have been explicitly approved.

## Task Cards

`docs/tasks/*.md` is the lightweight shared task queue. New sessions may list open task cards when their status is `Todo`, `In Progress`, or `Blocked`, but agents should not claim or start a task automatically.

Use `docs/templates/TASK_TEMPLATE.md` when creating tasks. A task card should include status, source/design input, suggested agent, file ownership, do-not-touch boundaries, acceptance criteria, validation plan, and close criteria.

Typical task status flow:

- `Todo`: ready to claim.
- `In Progress`: explicitly claimed by the user or current agent.
- `Blocked`: waiting for missing information or approval.
- `Done`: acceptance criteria and validation plan are satisfied.

`.claude-local/SESSION_STATE.md` is local continuity memory, not the source of truth for task status.

## Project Knowledge Policy

The repository code is the source of truth. Documentation is used as navigation and memory, not as proof that a gameplay system exists.

Unknown project facts should stay as `TBD`. System cards should be created only after the system exists in code, or after the user explicitly approves a design draft.

## Local State

`.claude-local/` is reserved for local-only session state and is ignored by Git. Use it for temporary notes that should not be shared across the repository.

## Compatibility Boundaries

The Claude Code workflow is the original workflow and is intentionally preserved. Codex and opencode adapters should follow it as closely as their tool models allow.

- Claude Code has native `.claude/agents`, `.claude/skills`, and `.claude/hooks` support through this scaffold.
- Codex has its own project agent, skill, and hook locations, so this repository adds thin adapters instead of moving the Claude files.
- opencode supports `AGENTS.md`, project agents, and Claude-compatible skill fallback. This repository does not add an opencode hook plugin because opencode plugin events are not a drop-in equivalent to Claude or Codex command hooks.

References:

- [Codex AGENTS.md](https://developers.openai.com/codex/guides/agents-md)
- [Codex Subagents](https://developers.openai.com/codex/subagents)
- [Codex Skills](https://developers.openai.com/codex/skills)
- [Codex Hooks](https://developers.openai.com/codex/hooks)
- [opencode Rules](https://opencode.ai/docs/rules)
- [opencode Agents](https://opencode.ai/docs/agents)
- [opencode Skills](https://opencode.ai/docs/skills)
