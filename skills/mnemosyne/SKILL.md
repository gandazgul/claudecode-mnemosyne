---
name: mnemosyne
description: Persistent project memory. Store, search, and recall project memories, decisions, and context. Use this whenever you start a session to recall past context, or after completing a task to store important decisions.
argument-hint: "[action] [query]"
user-invocable: true
allowed-tools: Bash(mnemosyne)
---

# Mnemosyne Skill

You are equipped with the `mnemosyne` CLI tool for managing persistent project memory. This tool allows you to store, search, and recall important context, decisions, preferences, and architectural guidelines.

## Capabilities and Commands

Use the `Bash` tool to execute `mnemosyne` commands. Because `allowed-tools: Bash(mnemosyne)` is set, you have permission to run the `mnemosyne` command directly.

Here are the primary operations you should perform:

### 1. Recall Memory (Search)
Use this at the start of conversations or whenever past context would be helpful.

**Project-Specific Context:**
```bash
mnemosyne search --limit 5 "your search query"
```

**Global/Cross-Project Context:**
```bash
mnemosyne search --global --limit 5 "your search query"
```

### 2. Store Memory (Add)
Use this after making decisions, when the user asks you to remember something, or when completing a significant task. Store one concise concept per memory.

**Project-Specific Memory:**
```bash
mnemosyne add "The detailed memory content or decision"
```

**Global/Cross-Project Preference:**
```bash
mnemosyne add --global "Personal preference, coding style, or tool choice"
```

### 3. Delete Memory
Use this to delete outdated, contradicted, or incorrect memories before storing updated ones. You will need the ID of the memory, which is shown in brackets (e.g., `[123]`) in search results.

```bash
mnemosyne delete <id>
```

## Workflows

- **Starting a Session:** Always start by searching both project-specific and global memory for context related to the user's initial prompt.
- **Completing a Task:** When finishing a task, evaluate if any new patterns, decisions, or important context emerged. If so, summarize them concisely and store them using `mnemosyne add`.
- **Handling Contradictions:** If you find a stored memory that conflicts with new instructions or decisions, use `mnemosyne delete <id>` to remove the old memory, then add the new one.
