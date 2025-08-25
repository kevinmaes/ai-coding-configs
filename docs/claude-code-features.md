# Claude Code Features & How We Enhance Them

This document explains how AI Coding Configs complements Claude Code's built-in features.

## Our Relationship to Claude Code

AI Coding Configs **enhances** Claude Code by providing:
- **Multi-tool configuration management** (Claude Code + Cursor + future tools)
- **Version-controlled agent library** with pre-built, useful agents
- **Unified principles** that sync across different AI coding assistants

## Feature Comparison

### Custom Agents / Subagents
- **Claude Code**: Supports custom subagents in `~/.claude/agents/`
- **Our Enhancement**: 
  - Pre-built agents (config-sync, quality-checker, etc.)
  - Version control for agent definitions
  - Easy sharing and distribution
  - Automatic sync to Claude's expected location

### Configuration Files
- **Claude Code**: Uses `CLAUDE.md` for instructions
- **Our Enhancement**: 
  - Unified `shared/principles.md` as source of truth
  - Syncs to both Claude's `CLAUDE.md` and Cursor's `.cursorrules`
  - Maintains consistency across multiple AI tools

### Design Specs Integration
- **Claude Code**: Reference files with `@/path/to/file.md` syntax
- **Our Approach**: 
  - Establishes `/design-specs/` convention across projects
  - Use `@/design-specs/feature.md` in conversations to include specs

### Slash Commands
- **Claude Code**: Supports custom commands in `~/.claude/commands/`
- **Future Enhancement**: We plan to add example commands

## Using Claude Code's Built-in Features

### File References
In any conversation, reference files directly:
```
@/design-specs/main-spec.md
@/src/components/Button.tsx
```

### Built-in Commands
- `/help` - Get help with Claude Code
- `/feedback` - Report issues
- `/clear` - Clear conversation

### Official Documentation
For complete Claude Code features, see: https://docs.anthropic.com/en/docs/claude-code

## Why Use AI Coding Configs?

1. **Multi-Tool Support**: Manage configurations for Claude Code, Cursor, and future AI assistants from one place
2. **Best Practices**: Curated coding standards and patterns that work well with AI
3. **Team Consistency**: Share configurations across your team via Git
4. **Version Control**: Track changes to your AI assistant configurations over time