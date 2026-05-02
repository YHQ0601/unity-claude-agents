# Unity AI Agent Working Agreement

This repository is a Unity game project workflow scaffold for Claude Code,
Codex, and opencode.

The current repository code is the source of truth. Project knowledge files are
navigation aids, not proof that a gameplay system exists.

## Tool Entry Points

- Claude Code keeps using `CLAUDE.md`, `.claude/agents/`, `.claude/skills/`,
  `.claude/rules/`, and `.claude/hooks/`. Do not change that workflow when
  adding Codex or opencode support.
- Codex should read this `AGENTS.md`, use project agents from `.codex/agents/`,
  and use wrapper skills from `.agents/skills/`.
- opencode should read this `AGENTS.md`, use project agents from
  `.opencode/agents/`, and may also discover the canonical `.claude/skills/`
  through its Claude-compatible fallback.

If a tool cannot automatically delegate, route, or load a workflow exactly like
Claude Code, the main agent should follow the same role instructions manually
and say which automation is unavailable.

## Main Role

The main agent is the orchestrator for this project.

Responsibilities:
1. Understand the user's goal before editing.
2. Evaluate whether the change is necessary now.
3. Prefer the smallest useful solution.
4. Delegate focused subtasks when the active tool supports agents.
5. Merge agent results and make the final decision.
6. Avoid unrelated refactors and over-engineering.
7. Verify changes before the final response.
8. Propose memory or documentation updates only when useful.

## Source of Truth

Priority:
1. Current repository code
2. Project docs
3. Local session state
4. Chat history

Unknown project facts should stay as `TBD`. Do not create system documentation
for systems that do not exist in code unless the user explicitly approves a
design draft.

## Agent Routing

Use these role names consistently across tools:

- `architecture-reviewer`: use before implementation when work may affect
  architecture, gameplay system boundaries, data models, save data, economy,
  performance, extensibility, or long-term maintainability. This role must not
  edit files.
- `unity-code-worker`: use for focused Unity C# implementation, MonoBehaviour
  changes, ScriptableObject changes, gameplay logic, input handling, UI logic,
  compile fixes, and small refactors.
- `placeholder-asset-worker`: use when temporary assets, primitive blockouts,
  placeholder prefabs, VFX placeholders, UI blockouts, icon placeholders, or
  artist replacement plans are needed.
- `unity-qa-checker`: use after code, prefab, scene, package, or
  behavior-affecting changes, and when the user asks for verification or risk
  review. This role must not implement features.
- `project-memory-curator`: use after meaningful tasks, architecture decisions,
  major file moves, or stale memory risks. Shared knowledge updates require user
  approval; local session state may be updated more frequently.

Do not ask the user to manually tag agents unless routing is ambiguous.

## Task Cards

`docs/tasks/*.md` is the shared task queue.

- Session start may list open task cards with `Status: Todo`,
  `Status: In Progress`, or `Status: Blocked`.
- Do not claim or start a task automatically.
- Claim a task only when the user names a task card or explicitly asks for the
  next task.
- When claiming a task, set `Status: In Progress` and fill `Owner Agent` when
  editing the task card is allowed.
- Close a task only after acceptance criteria and validation plan are satisfied.
- When closing a task, set `Status: Done`, fill `Completed`, and summarize
  checks run.
- Use `Status: Blocked` with `Blocked Reason` when missing information prevents
  progress.

`.claude-local/SESSION_STATE.md` is continuity memory, not the source of truth
for task status.

## Context Budget

- Prefer structured project context before broad scanning:
  `.claude-local/SESSION_STATE.md`, `docs/ai/ARCHITECTURE_INDEX.md`, relevant
  system cards, then targeted files.
- Read index files, templates, and relevant examples before expanding to broad
  search.
- Do not read too many large files before summarizing.
- Use subagents for noisy searches or broad investigation when supported.
- Keep the main conversation focused on conclusions.
- Do not paste long logs into final answers.

## Unity Safety

Be careful with `.meta`, `.prefab`, `.unity`, `ProjectSettings`, and
`Packages/manifest.json`.

- Do not manually modify `.meta` files unless explicitly required.
- Do not hand-edit complex `.prefab` or `.unity` YAML unless explicitly
  approved.
- Do not modify `ProjectSettings` unless explicitly required.
- Avoid deleting assets unless their usage has been checked.
- If many `.meta`, prefab, or scene files change, warn the user.
- Do not add or remove Unity packages without approval.

## Placeholder Assets

Temporary assets should be easy to replace by artists.

- Use primitives, basic materials, clear naming, and stable anchors.
- Keep temporary assets separate from final art assets.
- Do not create final art or decide final art style.
- Include an artist replacement plan when placeholder assets are created.

## Development Rules

- Prefer minimal diffs.
- Do not refactor unrelated systems.
- Do not introduce complex abstractions for one-off features.
- Do not add packages without approval.
- Avoid fragile runtime scene or UI wiring such as `GameObject.Find(...)`,
  `transform.Find(...)`, `GetComponent("...")`, or
  `Find(...).GetComponent<...>()`.
- Before review or QA, identify changed files, affected systems, and likely
  Unity serialization/reference risks.
- After code changes, run or propose the smallest relevant verification.

## Compatibility Boundaries

- Claude Code hooks remain under `.claude/hooks/` and continue to be configured
  by `.claude/settings.json`.
- Codex can reuse those shell scripts through `.codex/hooks.json` when project
  hooks are trusted and enabled.
- opencode support in this scaffold uses `AGENTS.md`, `.opencode/agents/`, and
  skill discovery. This repository does not add an opencode plugin hook because
  opencode plugin events are not a drop-in equivalent to Claude or Codex command
  hooks.
- Tool-specific security, sandboxing, approvals, and model settings still apply.
