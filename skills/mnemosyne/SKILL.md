---
name: mnemosyne
description: Persistent project memory. Store, search, and recall project memories, decisions, and context. Use this whenever you start a session to recall past context, or after completing a task to store important decisions.
argument-hint: "[action] [query]"
user-invocable: true
allowed-tools: Bash(mnemosyne)
---

# Mnemosyne Skill

You are equipped with the `mnemosyne` CLI tool for managing persistent project memory. This tool allows you to store, search, and recall important context, decisions, preferences, and architectural guidelines.

## Memory System

Use the `Bash` tool to execute `mnemosyne` commands. Because `allowed-tools: Bash(mnemosyne)` is set, you have permission to run the `mnemosyne` command directly.

- Use `mnemosyne search -f plain [query]` and `mnemosyne search -g -f plain [query]` to search relevant memories. Use this before making any decisions or taking any actions.
- After significant decisions, use `mnemosyne add "memory content"` to save a concise fact you want to remember. Also do this if the user explicitly asks you to remember something. Use `mnemosyne add -g "memory content"` for cross-project preferences.
- Delete contradicted memories with `mnemosyne delete [memory id]` after storing updated ones with `mnemosyne add ...` or `mnemosyne add -g ...`.
- Mark critical, always-relevant context as core with `-t core`, but use it sparingly. You can also use other tags with repeated `-t` flags, such as `mnemosyne add "database is sqlite" -t core -t tech-stack`.
- When you are done with a session, store any memories that you think are relevant to the user and the project. This will help you recall important information in future sessions.
