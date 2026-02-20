#!/bin/bash

# Sync all AI coding assistant configurations
# This script syncs configurations for all supported tools
# 
# For an interactive setup experience, run: pnpm install && pnpm setup

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

# Sync statusline script
git show origin/main:claude/statusline.sh > ~/.claude/statusline.sh
chmod +x ~/.claude/statusline.sh
echo "✓ Synced statusline.sh"

# Check for jq dependency
if ! command -v jq &> /dev/null; then
    echo "⚠️  Warning: jq is required for statusline. Install with: brew install jq"
fi

# Sync Claude agents
for agent in $(git ls-tree --name-only origin/main:claude/agents/); do
    git show origin/main:claude/agents/$agent > ~/.claude/agents/$agent
    echo "✓ Synced agent: $agent"
done

# Sync Claude skills
mkdir -p ~/.claude/skills
for skill in $(git ls-tree --name-only -d origin/main:.claude/skills/); do
    mkdir -p ~/.claude/skills/"$skill"
    for file in $(git ls-tree --name-only origin/main:.claude/skills/$skill/); do
        git show origin/main:.claude/skills/$skill/$file > ~/.claude/skills/$skill/$file
    done
    echo "✓ Synced skill: $skill"
done

# Sync Cursor configuration
echo -e "\n🟣 Syncing Cursor..."
git show origin/main:cursor/.cursorrules > ~/.cursorrules
echo "✓ Synced .cursorrules to home directory"

# Note about shared principles
echo -e "\n📋 Shared principles available at:"
echo "   shared/principles.md"
echo "   Use 'config-sync' agent to propagate changes"

# Write sync version
git show origin/main:package.json | jq -r .version > ~/.claude/.sync-version
echo -e "\n📌 Synced version: $(cat ~/.claude/.sync-version)"

echo -e "\n✅ All configurations synced!"