#!/bin/bash

# Validate AI coding assistant configuration files

echo "🔍 Validating configuration files..."

# Check if jq is installed for JSON validation
if ! command -v jq &> /dev/null; then
    echo "⚠️  jq is not installed. Install with: brew install jq"
    echo "   Skipping JSON validation..."
else
    # Validate Claude settings.json
    echo -n "Checking claude/settings.json... "
    if jq empty claude/settings.json 2>/dev/null; then
        # Additional checks for Claude-specific requirements
        if jq -e '.hooks | to_entries[] | select(.value | contains("#"))' claude/settings.json >/dev/null 2>&1; then
            echo "❌ Invalid: hooks cannot contain comments"
            exit 1
        else
            echo "✅ Valid"
        fi
    else
        echo "❌ Invalid JSON"
        exit 1
    fi
fi

# Validate .cursorrules (basic check - should exist and not be empty)
echo -n "Checking cursor/.cursorrules... "
if [ -f "cursor/.cursorrules" ] && [ -s "cursor/.cursorrules" ]; then
    echo "✅ Exists"
else
    echo "❌ Missing or empty"
    exit 1
fi

# Validate shared principles
echo -n "Checking shared/principles.md... "
if [ -f "shared/principles.md" ] && [ -s "shared/principles.md" ]; then
    echo "✅ Exists"
else
    echo "❌ Missing or empty"
    exit 1
fi

echo "✨ All configuration files are valid!"