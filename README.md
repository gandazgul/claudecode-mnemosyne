# Claude Code Mnemoteca Skill

A native Claude Code Skill that connects Claude to the
[`mnemoteca` CLI](https://github.com/gandazgul/mnemoteca). It provides
persistent project and cross-project memory that stays local.

## Prerequisites

Install the `mnemoteca` CLI globally:

```bash
curl -fsSL https://raw.githubusercontent.com/gandazgul/mnemoteca/main/install.sh | sh
mnemoteca setup
```

Windows users install the Mnemoteca release ZIP instead. See the
[Mnemoteca README](https://github.com/gandazgul/mnemoteca#installation).

Make sure the `mnemoteca` binary is accessible in your system `PATH`. Verify it
with:

```bash
mnemoteca version
```

## Install with skills

Install the skill from the repository:

```bash
npx skills@latest add https://github.com/gandazgul/claudecode-mnemoteca \
  --skill mnemoteca \
  --target claude-code
```

This installs the `mnemoteca` skill to `~/.claude/skills/mnemoteca`. Restart
active Claude Code sessions after installation.

## Manual installation

You can also copy the skill directory yourself on macOS or Linux:

```bash
mkdir -p ~/.claude/skills
cp -r skills/mnemoteca ~/.claude/skills/
```

On Windows PowerShell, copy the skill directory manually:

```powershell
$SkillRoot = "$env:USERPROFILE\.claude\skills"
New-Item -ItemType Directory -Force $SkillRoot | Out-Null
Copy-Item -Recurse -Force .\skills\mnemoteca "$SkillRoot\mnemoteca"
```

Or run the installer in this repository on macOS or Linux:

```bash
./install.sh
```

## Upgrade from claudecode-mnemosyne

If you already used the old Claude Code skill, stop active Claude Code sessions
before you change skills.

1. Migrate CLI data first if needed. Use the
   [Mnemoteca migration guide](https://github.com/gandazgul/mnemoteca/blob/main/docs/migrate-from-mnemosyne.md).
2. Install the new `mnemoteca` skill with `npx skills@latest add` or by copying
   `skills/mnemoteca` to `~/.claude/skills/mnemoteca`.
3. Start Claude Code and verify that the `mnemoteca` skill is available. Store
   and recall a harmless test memory if needed.
4. After the new skill works, optionally inspect and remove the old skill
   directory only if it is the old skill:
   ```bash
   ls -la ~/.claude/skills/mnemosyne
   rm -rf ~/.claude/skills/mnemosyne
   ```
   On Windows PowerShell, inspect the path first, then remove it only if it is
   the old skill:
   ```powershell
   Get-ChildItem "$env:USERPROFILE\.claude\skills\mnemosyne"
   Remove-Item -Recurse -Force "$env:USERPROFILE\.claude\skills\mnemosyne"
   ```
5. Restart Claude Code.

The old and new skill directories can coexist during verification, but do not
use both for normal work. The agent-facing `memory_*` capability names stay
stable.

Windows users must complete the skill replacement before restarting Claude Code.
There is no Windows `mnemosyne` compatibility shim, alias, copied executable, or
renamed executable.

## How it works

This skill uses the native `SKILL.md` format. It sets
`allowed-tools: Bash(mnemoteca)`, which grants Claude Code permission to execute
the `mnemoteca` CLI tool to store, recall, and delete memories.

## Commands taught to Claude

- Use `mnemoteca search -f plain [query]` and `mnemoteca search -g -f plain [query]` to search relevant memories.
- After significant decisions, use `mnemoteca add "memory content"` to save a concise fact. Use `mnemoteca add -g "memory content"` for cross-project preferences.
- Delete contradicted memories with `mnemoteca delete [memory id]` after storing updated memories.
- Mark critical, always-relevant context as core with `-t core`. You can also use repeated tags, such as `mnemoteca add "database is sqlite" -t core -t tech-stack`.

The skill calls the `mnemoteca` executable through `PATH`. It does not own data
storage, select databases, or run migrations.

## Memory tools

The natural-language capability names stay stable across the rename:

- `memory_recall`
- `memory_recall_global`
- `memory_store`
- `memory_store_global`
- `memory_delete`
