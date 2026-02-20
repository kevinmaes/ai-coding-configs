#!/bin/bash

# Sync AI coding assistant configurations from local files (for development)
# This script syncs configurations from your local working directory
# Use this when testing changes before pushing to main

echo "🤖 Syncing AI Coding Assistant Configurations from LOCAL files..."

# Get the script directory to find the project root
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_ROOT="$( cd "$SCRIPT_DIR/.." && pwd )"

# Sync Claude configurations
echo -e "\n📘 Syncing Claude from local..."
mkdir -p ~/.claude/agents

cp "$PROJECT_ROOT/claude/CLAUDE.md" ~/.claude/CLAUDE.md
echo "✓ Synced CLAUDE.md"

cp "$PROJECT_ROOT/claude/settings.json" ~/.claude/settings.json
echo "✓ Synced settings.json"

# Sync statusline script
cp "$PROJECT_ROOT/claude/statusline.sh" ~/.claude/statusline.sh
chmod +x ~/.claude/statusline.sh
echo "✓ Synced statusline.sh"

# Check for jq dependency
if ! command -v jq &> /dev/null; then
    echo "⚠️  Warning: jq is required for statusline. Install with: brew install jq"
fi

# Sync Claude agents
for agent in "$PROJECT_ROOT"/claude/agents/*.md; do
    if [ -f "$agent" ]; then
        agent_name=$(basename "$agent")
        cp "$agent" ~/.claude/agents/"$agent_name"
        echo "✓ Synced agent: $agent_name"
    fi
done

# Sync Claude skills
mkdir -p ~/.claude/skills
for skill_dir in "$PROJECT_ROOT"/.claude/skills/*/; do
    if [ -d "$skill_dir" ]; then
        skill_name=$(basename "$skill_dir")
        mkdir -p ~/.claude/skills/"$skill_name"
        cp -r "$skill_dir"* ~/.claude/skills/"$skill_name"/
        echo "✓ Synced skill: $skill_name"
    fi
done

# Sync Cursor configuration if it exists
if [ -f "$PROJECT_ROOT/cursor/.cursorrules" ]; then
    echo -e "\n🟣 Syncing Cursor..."
    cp "$PROJECT_ROOT/cursor/.cursorrules" ~/.cursorrules
    echo "✓ Synced .cursorrules to home directory"
fi

# Note about shared principles
echo -e "\n📋 Shared principles available at:"
echo "   $PROJECT_ROOT/shared/principles.md"
echo "   Use 'config-sync' agent to propagate changes"

# Write sync version
jq -r .version "$PROJECT_ROOT/package.json" > ~/.claude/.sync-version
echo -e "\n📌 Synced version: $(cat ~/.claude/.sync-version)"

echo -e "\n✅ All configurations synced from local files!"
echo "⚠️  Remember to push and merge your changes to main for permanent sync"