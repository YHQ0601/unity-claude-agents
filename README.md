# unity-claude-agents

Unity Claude Code Lite Workflow v0.2.

This repository provides a lightweight Claude Code workflow scaffold for Unity game projects. It focuses on practical project execution: clarify tasks, delegate focused work, protect Unity project files, validate changes, and keep project knowledge from drifting ahead of the actual codebase.

这个仓库是一套面向 Unity 项目的 Claude Code 工作流模板。它不是游戏框架，也不预设玩法系统；它提供的是一组 agents、skills、rules 和文档模板，用来帮助 AI 在 Unity 项目中更稳定地协作和交付。

## What It Includes

- `CLAUDE.md`: project-level working agreement for the main orchestrator.
- `.claude/agents/`: focused subagents for architecture review, Unity code work, placeholder assets, QA, and project memory.
- `.claude/skills/`: reusable workflows for task intake, Unity feature implementation, placeholder asset creation, handoff, and validation.
- `.claude/rules/`: Unity-specific guardrails for C#, asset import, performance, project safety, placeholders, and context budget.
- `.claude/hooks/`: lightweight hooks for session bootstrap and prompt routing.
- `docs/ai/`: high-level project brief and architecture index.
- `docs/templates/`: templates for tasks, ADRs, system cards, and placeholder asset generators.

## Intended Use

Use this scaffold when you want Claude Code to work inside a Unity repository with clearer boundaries:

- understand the user's goal before editing;
- prefer small, useful changes over broad refactors;
- route specialized work to the right subagent;
- avoid unsafe Unity file edits such as unnecessary `.meta`, prefab, scene, or `ProjectSettings` changes;
- document only systems that actually exist or have been explicitly approved.

## Task Cards

`docs/tasks/*.md` is the lightweight shared task queue. New sessions list open task cards when their status is `Todo`, `In Progress`, or `Blocked`, but Claude Code should not claim or start a task automatically.

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
