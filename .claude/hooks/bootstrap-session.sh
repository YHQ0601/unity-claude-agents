#!/usr/bin/env bash
set -euo pipefail

echo "## Project Bootstrap"
echo "- This is a Unity game project."
echo "- Read CLAUDE.md first."
echo "- Current repository code is the source of truth."
echo "- Project docs are navigation aids, not guaranteed facts."
echo "- Do not assume gameplay systems exist unless they are present in code or confirmed docs."
echo "- Use docs/ai/PROJECT_BRIEF.md for project overview if needed."
echo "- Use docs/ai/ARCHITECTURE_INDEX.md for known system map if needed."
echo "- Use .claude-local/SESSION_STATE.md for local continuity if present."
echo
echo "## Git State"
git branch --show-current 2>/dev/null | sed 's/^/- Branch: /' || true
git rev-parse --short HEAD 2>/dev/null | sed 's/^/- HEAD: /' || true
