# Context Budget Rules

## Principles
- Keep main-session context focused on conclusions.
- Use subagents for noisy exploration.
- Prefer reading indexes/templates before deep docs.
- Do not paste full logs into main context unless required.

## Retrieval Strategy
1. Read `CLAUDE.md` and relevant `docs/ai/*` first.
2. Read specific files only when task scope requires.
3. Summarize long findings; keep verbatim excerpts minimal.
4. Verify assumptions against current repository code.

## Guardrails
- Avoid broad, unnecessary file scans.
- Avoid loading unrelated system docs.
- Stop and restate smallest useful version before large edits.
