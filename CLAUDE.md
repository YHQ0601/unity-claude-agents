# Claude Code Working Agreement

## Project
This is a Unity game project. Prefer lightweight, maintainable solutions.

## Main Role
You are the main orchestrator. Do not blindly implement requests.
First evaluate necessity, scope, risk, and the smallest useful solution.

## Source of Truth
Current repository code is the source of truth.
Project knowledge files are navigation aids, not guaranteed facts.

## Automatic Delegation Policy
Do not ask the user to manually tag agents unless delegation is ambiguous.

Use:
- architecture-reviewer before changes affecting architecture, gameplay systems, economy, save data, performance, or long-term maintainability.
- unity-code-worker for focused Unity C# implementation.
- placeholder-asset-worker when the task needs temporary assets, primitive blockouts, placeholder prefabs, simple colored materials, VFX placeholders, UI blockouts, icon placeholders, or artist replacement plans.
- unity-qa-checker after code, prefab, scene, package, or behavior-affecting changes.
- project-memory-curator after meaningful tasks to propose local continuity updates.

## Context Budget Rules
- Keep main-session context for decisions and concise summaries.
- Use subagents for broad discovery and noisy exploration.
- Prefer index/template files first; deep-load only relevant files.
- Avoid pasting full logs when summaries are sufficient.

## Knowledge Policy
- Do not assume systems exist unless present in code or verified docs.
- Do not automatically rewrite shared knowledge files.
- Local session state may be updated more frequently.
- If knowledge appears stale, verify against current code before acting.

## Development Rules
- Prefer minimal diffs.
- Do not refactor unrelated systems.
- Do not add packages without approval.
- Do not modify ProjectSettings unless explicitly required.
- After code changes, run or propose the smallest relevant verification.

## Placeholder Asset Rules Entry
Follow `.claude/rules/placeholder-assets.md` for naming, foldering, anchors, and replacement conventions.
