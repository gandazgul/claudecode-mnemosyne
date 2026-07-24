# Claude Code Mnemosyne Plugin

A native Claude Code Skill that connects Claude to the [`mnemosyne` CLI](https://github.com/gandazgul/mnemosyne), providing persistent project and cross-project
memory without using MCP or requiring background servers.

## Prerequisites

You **must** have the [`mnemosyne` CLI tool](https://github.com/gandazgul/mnemosyne) installed globally on your system.

If you are building from the repository:

```bash
git clone https://github.com/gandazgul/mnemosyne.git
cd mnemosyne
go install .
```

Alternatively, if `taskfile.dev` runner is installed:

```bash
task install
```

Make sure the `mnemosyne` binary is accessible in your system's `$PATH`. You can verify this by running:

```bash
mnemosyne --version
```

## Installation

Recommended: install the skill globally for Claude Code with [`npx skills`](https://github.com/vercel-labs/skills):

```bash
npx skills@latest add https://github.com/gandazgul/claudecode-mnemosyne \
  --skill mnemosyne \
  --agent claude-code \
  --global \
  --yes
```

This installs the `mnemosyne` skill to `~/.claude/skills/mnemosyne`. Restart any active Claude Code sessions after installation.

### Script Installation

You can also install the skill using the provided script from a local clone:

```bash
./install.sh
```

### Manual Installation

To manually make the memory skill available to Claude Code globally, copy the `skills/mnemosyne` directory to
your Claude Code skills directory (`~/.claude/skills/`).

```bash
mkdir -p ~/.claude/skills/
cp -r skills/mnemosyne ~/.claude/skills/
```

After installing, the next time you start a Claude Code session, it will automatically have access to the `mnemosyne`
skill.

## How It Works

This skill utilizes the native `SKILL.md` format. It sets `allowed-tools: Bash(mnemosyne)`, which automatically grants
Claude Code permission to execute the `mnemosyne` CLI tool to store, recall, and delete memories for you, without
intrusive confirmation prompts.

## Memory System

The installed skill tells Claude Code to follow this command-based memory workflow:

- Use `mnemosyne search -f plain [query]` and `mnemosyne search -g -f plain [query]` to search relevant memories. Use this before making any decisions or taking any actions.
- After significant decisions, use `mnemosyne add "memory content"` to save a concise fact you want to remember. Also do this if the user explicitly asks you to remember something. Use `mnemosyne add -g "memory content"` for cross-project preferences.
- Delete contradicted memories with `mnemosyne delete [memory id]` after storing updated ones with `mnemosyne add ...` or `mnemosyne add -g ...`.
- Mark critical, always-relevant context as core with `-t core`, but use it sparingly. You can also use other tags with repeated `-t` flags, such as `mnemosyne add "database is sqlite" -t core -t tech-stack`.
- When you are done with a session, store any memories that you think are relevant to the user and the project. This will help you recall important information in future sessions.
