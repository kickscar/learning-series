#!/usr/bin/env bash
set -euo pipefail

# Workspace scanner for reorg impact analysis.
# Non-destructive: prints summaries only.

ROOT_DIR="${1:-.}"

cd "$ROOT_DIR"

echo "== scan: plans =="
ls -1 ".cursor/plans" | sed "s/^/- /"

echo
echo "== scan: drafts =="
if [ -d ".cursor/draft" ]; then
  ls -1 ".cursor/draft" 2>/dev/null | sed "s/^/- /" || true
else
  echo "- (no .cursor/draft directory)"
fi

echo
echo "== scan: chapter directories (top-level) =="
find . -maxdepth 1 -type d -name "[0-9][0-9] *" -print | sed "s#^\\./#- #" || true

echo
echo "== scan: labs referenced (plans + root README) =="
rg -n --no-heading "lab[0-9]{2}|Lab: Gallery-[A-Za-z0-9-]+|Lab: Gallery - " ".cursor/plans" "README.md" 2>/dev/null | head -n 200 || true
