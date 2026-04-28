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

OPEN_TASKS=""

while IFS= read -r task_file; do
  [ -n "$task_file" ] || continue
  status="$(grep -Eim1 '^Status:[[:space:]]*(Todo|In Progress|Blocked)' "$task_file" | sed -E 's/^Status:[[:space:]]*//I' || true)"
  if [ -n "$status" ]; then
    OPEN_TASKS="${OPEN_TASKS}- ${task_file} [${status}]
"
  fi
done <<EOF
$(find docs/tasks -maxdepth 1 -type f -name '*.md' ! -name '.gitkeep' 2>/dev/null | sort || true)
EOF

if [ -n "$OPEN_TASKS" ]; then
  echo
  echo "## Open Tasks"
  printf "%s" "$OPEN_TASKS"
  echo "- Do not claim a task automatically. Wait for the user to name a task or ask for the next task."
fi
