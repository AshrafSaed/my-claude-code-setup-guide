# Power Commands for Claude Code and ChatGPT

Five popular "power prompt" shortcuts (`/ooda`, `/ghost`, `/l99`, `/artifacts`, `/godmode`), packaged as real, installable commands.

> **Important:** these shortcuts are **not official features** of Claude or ChatGPT. They are community prompt conventions. This repo turns each one into an explicit, well-defined instruction so it behaves consistently instead of relying on the model guessing what the keyword means.

Developed by MIGATRONIX – Automation & Control Solutions (Ashraf Saed).

---

## The five commands

| Command | What it does | Best used for |
|---|---|---|
| `/ooda` | Forces the answer into 4 sections: Observe, Orient, Decide, Act | Troubleshooting, bottleneck analysis, decisions under uncertainty |
| `/ghost` | Rewrites text to sound natural and human, without AI-style filler | Emails, messages, reports sent under your name |
| `/l99` | Expert-level answer with a committed recommendation, trade-offs and failure modes | Engineering/technical questions where "it depends" is not useful |
| `/artifacts` | Builds a single self-contained interactive HTML file | Calculators, dashboards, comparison tools, quick prototypes |
| `/godmode` | Exhaustive, structured coverage of a topic with an action plan | Research, feasibility studies, exam preparation |

### 1. `/ooda`
Based on John Boyd's Observe-Orient-Decide-Act loop. Output sections: **Observe** (facts only, missing data flagged), **Orient** (meaning, constraints, root causes, risks), **Decide** (one committed decision + main trade-off), **Act** (ordered next steps: Immediate / Today / This week).
Example: `/ooda Cycle time at the packing station is 12 s too long`

### 2. `/ghost`
Removes typical AI writing patterns: corporate filler, buzzwords, repetitive summaries. Keeps meaning and facts unchanged and keeps the input language. Returns only the final text.
Example: `/ghost Rewrite this email to the supplier so it sounds direct and human: ...`

### 3. `/l99`
Answers as a senior domain expert. Commits to one recommendation, lists the 2-3 trade-offs that matter, failure modes, and what would change the recommendation. Marks uncertainty instead of inventing facts.
Example: `/l99 Cobot or industrial robot for palletizing 15 kg boxes at 8 cycles/min?`

### 4. `/artifacts`
Builds one HTML file (inline CSS/JS, works offline, handles invalid input) and tells you how to open it.
Example: `/artifacts Payback calculator: CAPEX, annual savings, labor cost, sensitivity table`

### 5. `/godmode`
Maximum-depth treatment: scope, angles, edge cases, alternatives, risks, action plan, with a short executive conclusion first.
Example: `/godmode Feasibility of end-of-line automation for a cabinet production line`

---

## Install: Claude Code

Custom slash commands are markdown files in a `commands` folder. The file name becomes the command name.

1. Copy the files from `claude-code/commands/` into:
   - **All projects (recommended):** `~/.claude/commands/`
   - **Windows:** `C:\Users\<your-user>\.claude\commands\`
   - **One project only:** `<project>/.claude/commands/`
2. Restart Claude Code.
3. Type `/` and you will see `ooda`, `ghost`, `l99`, `artifacts`, `godmode`.

Terminal one-liner (macOS/Linux):

```bash
mkdir -p ~/.claude/commands && cp claude-code/commands/*.md ~/.claude/commands/
```

Windows PowerShell:

```powershell
New-Item -ItemType Directory -Force "$HOME\.claude\commands"; Copy-Item .\claude-code\commands\*.md "$HOME\.claude\commands\"
```

`$ARGUMENTS` inside each file is replaced by whatever you type after the command.

## Install: Claude.ai (web / mobile app)

Files in `~/.claude/commands` are only read by **Claude Code**, not by the regular chat. In the chat, the `/` menu lists **Skills**, so use the five skills in `skills/` instead:

1. Each skill is a folder with one `SKILL.md` file (`skills/ooda/`, `skills/ghost/`, `skills/l99/`, `skills/artifacts/`, `skills/godmode/`).
2. Zip each skill folder so that `SKILL.md` sits inside the folder inside the zip (for example `ooda.zip` containing `ooda/SKILL.md`).
3. In Claude, open the skills/capabilities settings and upload the zip files. Menu names can differ between app versions.
4. Start a new chat and type `/ooda`, `/ghost`, `/l99`, `/artifacts` or `/godmode`. Names are lower-case.

Alternative without skills: paste `chatgpt/custom-instructions.md` into **Settings → Profile → preferences**, or into a Project's instructions. Then type e.g. `/ooda ...` in the chat.

### The five skills

| Skill | Triggers when you type | What it does |
|---|---|---|
| `ooda` | `/ooda` | Observe, Orient, Decide, Act: structured analysis of a problem or decision |
| `ghost` | `/ghost` | Writes or rewrites text to sound natural and human |
| `l99` | `/l99` | Senior-expert answer with one committed recommendation, trade-offs and failure modes |
| `artifacts` | `/artifacts` | Builds a self-contained interactive HTML page (calculator, dashboard, tool) |
| `godmode` | `/godmode` | Most comprehensive structured treatment of a topic, with risks and an action plan |

Claude Code commands and chat skills do the same job in different places: use `claude-code/commands/` for Claude Code and `skills/` for the chat.

## Install: ChatGPT

ChatGPT has no custom slash-command files. Two options:

**Option A - Custom Instructions (all chats).** Open ChatGPT settings, go to Personalization → Custom instructions, and paste the content of `chatgpt/custom-instructions.md` into the "How would you like ChatGPT to respond?" box. After that, starting a message with `/ooda`, `/ghost`, etc. triggers the behavior.

**Option B - Custom GPT or Project.** Create a Custom GPT (or a Project) and paste the same text into its Instructions field. Use this if you do not want the commands active in every chat.

Menu names can change between app versions; look for "Custom instructions" or "Instructions" if a label differs.

## Repository layout

```
claude-code/commands/   ooda.md ghost.md l99.md artifacts.md godmode.md   (Claude Code)
skills/<name>/SKILL.md  ooda ghost l99 artifacts godmode                    (Claude chat skills)
chatgpt/custom-instructions.md   all five definitions in one block
install.ps1             Windows installer for the Claude Code commands
README.md
```

## Notes

- Behavior depends on the model and prompt; a clear request still matters more than the keyword.
- Edit the files freely to match your own standards (for example add your own units, template or language rules).
