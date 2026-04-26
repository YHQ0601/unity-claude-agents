#!/usr/bin/env bash
set -euo pipefail

echo "## Stop Quality Gate Reminder"
echo "- If C# files were changed, final response should include QA or verification summary."
echo "- If placeholder asset work was involved, final response should include Placeholder Assets / Replacement Anchors / Artist Replacement Notes."
echo "- If architecture or system cards changed, final response should include memory update decision."
