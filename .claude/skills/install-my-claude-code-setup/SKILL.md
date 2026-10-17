---
name: install-my-claude-code-setup
description: Install and verify my-claude-code-setup. Use when the user asks to install, set up or reinstall my-claude-code-setup.
---

# install-my-claude-code-setup

1. Read `install.sh` in the repository root and tell the user what it will run.
2. Run `bash install.sh`. If a prerequisite is missing, report it and stop; do not install system packages without asking.
3. Verify: Open Claude Code in the project and run `/init`.
4. Report the result honestly. If a step failed, show the error and do not claim success.

Notes: Copies templates from the upstream repo into the CURRENT project folder. It does not overwrite existing files and skips `.claude/settings.json` (it pre-approves many shell commands; review it first).
