#!/bin/bash

# Fetch latest and copy CLAUDE.md directly from origin/main
git fetch origin main && git show origin/main:CLAUDE.md > ~/.claude/CLAUDE.md

echo "✓ Synced CLAUDE.md from origin/main to ~/.claude/"