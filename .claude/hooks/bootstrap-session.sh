#!/usr/bin/env bash
set -euo pipefail

echo "## Project Bootstrap"
echo "- This is a Unity game project."
echo "- Read CLAUDE.md first."
echo "- Use docs/ai/PROJECT_BRIEF.md for project overview."
echo "- Use docs/ai/ARCHITECTURE_INDEX.md for architecture status and constraints."
echo "- Use docs/templates/ when creating new system/task/ADR docs."
echo "- Do not assume systems exist unless present in code or documented as verified."

echo "- Use .claude-local/SESSION_STATE.md for local continuity if present."

if [ -f ".claude-local/NEEDS_KB_REVIEW" ]; then
  echo "- NEEDS_KB_REVIEW exists. Treat local knowledge as possibly stale and run sync-knowledge before relying on it."
fi

echo
echo "## Git State"
git branch --show-current 2>/dev/null | sed 's/^/- Branch: /' || true
git rev-parse --short HEAD 2>/dev/null | sed 's/^/- HEAD: /' || true
