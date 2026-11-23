#!/usr/bin/env bash
# Copy the shared question bank into every skill so each skill folder is self-contained.
set -eu
root="$(cd "$(dirname "$0")/.." && pwd)"
for d in "$root"/skills/*/; do
  mkdir -p "$d/references"
  cp "$root/shared/question-bank.md" "$d/references/question-bank.md"
done
echo "synced shared/question-bank.md into $(ls -d "$root"/skills/*/ | wc -l | tr -d ' ') skills"
