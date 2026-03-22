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

You can install the skill automatically using the provided script:

```bash
./install.sh
```

### Manual Installation

To manually make the memory skill available to Claude Code globally, simply copy the `skills/mnemosyne` directory to
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
