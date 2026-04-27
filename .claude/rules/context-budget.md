---
description: Keep Claude Code context focused by summarizing noisy exploration, using subagents for broad searches, and preserving continuity without pasting long logs.
---

# Context Budget Rules

## Main Principle
The main conversation should keep conclusions, not raw exploration.

## Rules
- Prefer structured context before broad scanning: local session state, architecture index, system cards, then targeted files.
- Prefer reading index files, templates, and relevant examples first.
- Do not scan entire folders unless necessary.
- Do not read more than a small set of large files before summarizing.
- For review or QA, identify changed files and affected systems before reading implementation details.
- Use subagents for broad code search or noisy investigation.
- Do not paste long logs into the final answer.
- Summarize long outputs before returning to the main conversation.
- If the session becomes long, create or update `.claude-local/SESSION_STATE.md`.
