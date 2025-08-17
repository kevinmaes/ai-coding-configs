#!/bin/bash

# Sync all AI coding assistant configurations
# This script syncs configurations for all supported tools

echo "🤖 Syncing AI Coding Assistant Configurations..."

# Fetch latest from origin/main
git fetch origin main

# Sync Claude configurations
echo -e "\n📘 Syncing Claude..."
mkdir -p ~/.claude/agents

git show origin/main:claude/CLAUDE.md > ~/.claude/CLAUDE.md
echo "✓ Synced CLAUDE.md"

git show origin/main:claude/settings.json > ~/.claude/settings.json
echo "✓ Synced settings.json"

# Sync Claude agents
for agent in $(git ls-tree --name-only origin/main:claude/agents/); do
    git show origin/main:claude/agents/$agent > ~/.claude/agents/$agent
    echo "✓ Synced agent: $agent"
done

# Sync Cursor configuration
echo -e "\n🟣 Syncing Cursor..."
git show origin/main:cursor/.cursorrules > ~/.cursorrules
echo "✓ Synced .cursorrules to home directory"

# Note about shared principles
echo -e "\n📋 Shared principles available at:"
echo "   shared/principles.md"
echo "   Use 'config-sync' agent to propagate changes"

echo -e "\n✅ All configurations synced!"