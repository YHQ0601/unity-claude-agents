---
name: sync-knowledge
description: Use after git pull, branch switch, major file changes, or when .claude-local/NEEDS_KB_REVIEW exists. It checks whether project knowledge files are stale and proposes updates without automatically rewriting shared knowledge.
---

# Sync Knowledge

Process:
1. Read .claude-local/PULL_SUMMARY.md if present.
2. Read .claude-local/REPO_STATE.md if present.
3. Compare changed files with known system paths.
4. Decide whether knowledge files need review.
5. Do not rewrite shared docs unless explicitly approved.

Return:
## Verdict
No update needed / Local state update only / Project knowledge update recommended

## Git Range Checked

## Relevant Changes

## Knowledge Files Affected

## Suggested Update

## Do Not Update
