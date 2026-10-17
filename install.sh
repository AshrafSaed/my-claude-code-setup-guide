#!/usr/bin/env bash
# Auto-install for my-claude-code-setup. Reads no secrets, uses no sudo.
set -euo pipefail
command -v git >/dev/null || { echo "git is required"; exit 1; }
echo "Installing my-claude-code-setup ..."
PROJECT_DIR="$(pwd)"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT
git clone --depth 1 https://github.com/centminmod/my-claude-code-setup "$TMP/src"
cd "$TMP/src"
copy_new() { # copy a path into the current project only if it does not exist
  src="$1"; dst="$PROJECT_DIR/$1"
  if [ -e "$dst" ]; then echo "skip (exists): $1"; else mkdir -p "$(dirname "$dst")"; cp -R "$src" "$dst"; echo "copied: $1"; fi
}
for f in CLAUDE.md CLAUDE-template-1.md CLAUDE-template-2.md CLAUDE-template-3.md; do copy_new "$f"; done
for d in .claude/agents .claude/commands .claude/skills .claude/rules .claude/hooks; do copy_new "$d"; done
echo "Skipped .claude/settings.json on purpose - review upstream file before using it."
echo "Done. Next: Open Claude Code in the project and run /init."
