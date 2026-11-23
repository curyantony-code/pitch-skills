#!/usr/bin/env bash
# Build one upload-ready zip per skill into dist/. Claude desktop and claude.ai accept
# a zip whose top-level folder is the skill name and contains SKILL.md.
set -eu
root="$(cd "$(dirname "$0")/.." && pwd)"
"$root/scripts/sync-shared.sh"
mkdir -p "$root/dist"
rm -f "$root"/dist/*.zip
for d in "$root"/skills/*/; do
  name="$(basename "$d")"
  # Ship the skill itself; leave test cases (evals/) in the repo only.
  (cd "$root/skills" && zip -qr "$root/dist/$name.zip" "$name" -x "$name/evals/*" -x "*.DS_Store")
  echo "built dist/$name.zip"
done
