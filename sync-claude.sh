#!/bin/bash

# Fetch latest from origin/main
git fetch origin main

# Copy CLAUDE.md
git show origin/main:CLAUDE.md > ~/.claude/CLAUDE.md
echo "✓ Synced CLAUDE.md from origin/main to ~/.claude/"

# Copy settings.json
git show origin/main:settings.json > ~/.claude/settings.json
echo "✓ Synced settings.json from origin/main to ~/.claude/"

# Sync agents directory
mkdir -p ~/.claude/agents
for agent in $(git ls-tree --name-only origin/main:agents/); do
    git show origin/main:agents/$agent > ~/.claude/agents/$agent
    echo "✓ Synced agent: $agent"
done