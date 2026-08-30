---
name: mnemoteca
description: Persistent project memory. Store, search, and recall project memories, decisions, and context. Use this whenever you start a session to recall past context, or after completing a task to store important decisions.
argument-hint: "[action] [query]"
user-invocable: true
allowed-tools: Bash(mnemoteca)
---

# Mnemoteca Skill

You are equipped with the `mnemoteca` CLI tool for managing persistent project memory. This tool lets you store, search, and recall important context, decisions, preferences, and architecture guidelines.

## Memory System

Use the `Bash` tool to execute `mnemoteca` commands. Because `allowed-tools: Bash(mnemoteca)` is set, you have permission to run the `mnemoteca` command directly.

- Use `mnemoteca search -f plain [query]` and `mnemoteca search -g -f plain [query]` to search relevant memories. Use this before making decisions or taking actions.
- After significant decisions, use `mnemoteca add "memory content"` to save a concise fact. Use `mnemoteca add -g "memory content"` for cross-project preferences.
- Delete contradicted memories with `mnemoteca delete [memory id]` after storing updated ones with `mnemoteca add ...` or `mnemoteca add -g ...`.
- Mark critical, always-relevant context as core with `-t core`, but use it sparingly. You can also use other tags with repeated `-t` flags, such as `mnemoteca add "database is sqlite" -t core -t tech-stack`.
- When you are done with a session, store memories that are relevant to the user and the project. This helps you recall important information in future sessions.
