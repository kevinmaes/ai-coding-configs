#!/usr/bin/env bash

# Validate that principles are synced across all tool configurations
# Uses keyword matching to verify concepts are present

set -e

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

# Files to check
PRINCIPLES="shared/principles.md"
CLAUDE_CONFIG="claude/CLAUDE.md"
CURSOR_CONFIG="cursor/.cursorrules"

# Track validation results
MISSING_COUNT=0
MISSING_ITEMS=""

# Extract principles from a section
extract_principles() {
    local file=$1
    local section=$2
    
    # Get content between section header and next section
    sed -n "/^## $section/,/^##/p" "$file" | grep "^-" | sed 's/^- //'
}

# Extract keywords from a principle (first 3-4 meaningful words)
get_keywords() {
    local principle=$1
    # Remove common words and extract key terms
    echo "$principle" | \
        sed 's/\b\(always\|never\|only\|use\|prefer\|over\|with\|for\|the\|a\|an\)\b//gi' | \
        tr -s ' ' | \
        awk '{for(i=1;i<=NF && i<=4;i++) print tolower($i)}' | \
        grep -v '^$' | \
        head -3
}

# Check if keywords exist in target file
check_keywords_in_file() {
    local keywords=$1
    local target_file=$2
    local section=$3
    
    if [[ ! -f "$target_file" ]]; then
        return 1
    fi
    
    # Check each keyword
    for keyword in $keywords; do
        # Case insensitive search within relevant section
        if ! grep -i "$keyword" "$target_file" > /dev/null 2>&1; then
            return 1
        fi
    done
    
    return 0
}

# Main validation
echo "🔍 Validating principle synchronization..."
echo ""

# Get all sections from principles.md
sections=$(grep "^## " "$PRINCIPLES" | sed 's/## //' | grep -v "^#")

for section in $sections; do
    echo -e "${YELLOW}Checking section: $section${NC}"
    
    # Extract principles from this section
    principles=$(extract_principles "$PRINCIPLES" "$section")
    
    if [[ -z "$principles" ]]; then
        continue
    fi
    
    # Check each principle
    while IFS= read -r principle; do
        if [[ -z "$principle" ]]; then
            continue
        fi
        
        # Get keywords from principle
        keywords=$(get_keywords "$principle")
        
        if [[ -z "$keywords" ]]; then
            continue
        fi
        
        # Display what we're checking (truncate long principles)
        display_principle=$(echo "$principle" | cut -c1-50)
        if [[ ${#principle} -gt 50 ]]; then
            display_principle="${display_principle}..."
        fi
        
        printf "  %-55s" "$display_principle"
        
        # Check in CLAUDE.md
        claude_found=false
        if check_keywords_in_file "$keywords" "$CLAUDE_CONFIG" "$section"; then
            claude_found=true
        fi
        
        # Check in .cursorrules (if it exists)
        cursor_found=false
        if [[ -f "$CURSOR_CONFIG" ]]; then
            if check_keywords_in_file "$keywords" "$CURSOR_CONFIG" "$section"; then
                cursor_found=true
            fi
        fi
        
        # Report results
        if $claude_found && $cursor_found; then
            echo -e "${GREEN}✓ Synced${NC}"
        elif $claude_found && ! $cursor_found; then
            echo -e "${YELLOW}⚠ Missing in Cursor${NC}"
            ((MISSING_COUNT++))
            MISSING_ITEMS="${MISSING_ITEMS}\n  - $display_principle (missing in Cursor)"
        elif ! $claude_found && $cursor_found; then
            echo -e "${YELLOW}⚠ Missing in Claude${NC}"
            ((MISSING_COUNT++))
            MISSING_ITEMS="${MISSING_ITEMS}\n  - $display_principle (missing in Claude)"
        else
            echo -e "${RED}✗ Missing in both${NC}"
            ((MISSING_COUNT++))
            MISSING_ITEMS="${MISSING_ITEMS}\n  - $display_principle (missing in both)"
        fi
        
    done <<< "$principles"
    
    echo ""
done

# Summary
if [[ $MISSING_COUNT -eq 0 ]]; then
    echo -e "${GREEN}✅ All principles are synced!${NC}"
    exit 0
else
    echo -e "${RED}❌ Found $MISSING_COUNT unsynced principles:${NC}"
    echo -e "$MISSING_ITEMS"
    echo ""
    echo -e "${YELLOW}Run 'ai-config sync' to synchronize configurations${NC}"
    exit 1
fi