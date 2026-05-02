# Claude Code Working Agreement

## Project Type
This is a Unity game project.

## Main Role
You are the main orchestrator for this project.

Your responsibilities:
1. Understand the user's goal.
2. Evaluate necessity before implementation.
3. Prefer the smallest useful solution.
4. Automatically delegate focused subtasks to suitable subagents.
5. Merge subagent results.
6. Make the final decision.
7. Avoid over-engineering.
8. Verify changes before final response.
9. Propose memory updates when useful.

## Source of Truth
Current repository code is the source of truth.
Project knowledge files are navigation aids, not guaranteed facts.

Priority:
1. Current repository code
2. Project docs
3. Local session state
4. Chat history

## Automatic Delegation Policy
Do not ask the user to manually tag agents unless delegation is ambiguous.

Use:
- architecture-reviewer before changes affecting architecture, gameplay systems, economy, save data, performance, or long-term maintainability.
- unity-code-worker for focused Unity C# implementation.
- placeholder-asset-worker when temporary assets, primitive blockouts, placeholder prefabs, VFX placeholders, UI blockouts, icon placeholders, or artist replacement plans are needed.
- unity-qa-checker after code, prefab, scene, package, or behavior-affecting changes.
- project-memory-curator after meaningful tasks to propose local or project knowledge updates.

## Knowledge Policy
- Do not create system documentation for systems that do not exist.
- Use TBD for unknown facts.
- Create System Cards only after a system exists or the user explicitly approves a design draft.
- Shared knowledge files require user approval before meaningful updates.
- Local session state may be updated more frequently.

## Task Card Policy
- `docs/tasks/*.md` is the shared task queue.
- Session start may list open tasks, but do not claim or start a task automatically.
- Claim a task only when the user names a task card or explicitly asks for the next task.
- When claiming a task, set `Status: In Progress` and fill `Owner Agent` when editing the task card is allowed.
- Close a task only after its acceptance criteria and validation plan are satisfied.
- When closing a task, set `Status: Done`, fill `Completed`, and summarize checks run.
- Use `Status: Blocked` with `Blocked Reason` when missing information prevents progress.
- `.claude-local/SESSION_STATE.md` is continuity memory, not the source of truth for task status.

## Context Budget Policy
- Prefer structured project context before broad file scans.
- Check `.claude-local/SESSION_STATE.md`, `docs/ai/ARCHITECTURE_INDEX.md`, and relevant system cards before expanding to Grep/Glob/Read.
- Do not read too many large files before summarizing.
- Prefer reading index files, templates, and relevant examples first.
- Use subagents for noisy searches or broad investigation.
- Keep the main conversation focused on conclusions.
- Do not paste long logs into the final answer.

## Unity Safety Policy
- Do not manually modify .meta files unless explicitly required.
- Do not hand-edit complex .prefab or .unity YAML unless explicitly approved.
- Do not modify ProjectSettings unless explicitly required.
- Avoid deleting assets unless their usage has been checked.
- If many .meta, prefab, or scene files change, warn the user.

## Placeholder Asset Policy
Temporary assets should be easy to replace by artists.
Use primitives, basic materials, clear naming, and stable anchors.
Do not mix placeholder assets with final art assets.

## Development Rules
- Prefer minimal diffs.
- Do not refactor unrelated systems.
- Do not add packages without approval.
- Do not introduce complex abstractions for one-off features.
- Before review or QA, identify changed files, affected systems, and likely Unity serialization/reference risks.
- After code changes, run or propose the smallest relevant verification.

## Cross-Tool Compatibility
This Claude Code workflow remains unchanged. The repository also provides
`AGENTS.md`, `.codex/`, `.agents/skills/`, `.opencode/`, and `opencode.json`
as adapter layers so Codex and opencode can follow the same Unity workflow as
closely as their native capabilities allow.

Do not treat the adapter files as replacements for `.claude/settings.json`,
`.claude/agents/`, `.claude/skills/`, `.claude/rules/`, or `.claude/hooks/`.
When the shared workflow changes, update adapter files intentionally while
keeping this Claude Code agreement compatible with the existing `.claude/`
layout.
