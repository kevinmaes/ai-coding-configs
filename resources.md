# AI Coding Assistant Configuration Resources

Official documentation and community resources for maintaining configuration files for Claude Code and Cursor AI.

## Claude Code

### Official Documentation

- **[Claude Code Documentation](https://docs.anthropic.com/en/docs/claude-code)** - Main documentation hub
- **[Memory Management & CLAUDE.md](https://docs.anthropic.com/en/docs/claude-code/memory)** - How to use CLAUDE.md files effectively
- **[Settings Configuration](https://docs.anthropic.com/en/docs/claude-code/settings)** - settings.json configuration guide
- **[CLI Reference](https://docs.anthropic.com/en/docs/claude-code/cli-reference)** - Command-line interface documentation
- **[Common Workflows](https://docs.anthropic.com/en/docs/claude-code/common-workflows)** - Best practices and workflow patterns

### Configuration File Locations

- **User Memory**: `~/.claude/CLAUDE.md` - Personal preferences across all projects
- **User Settings**: `~/.claude/settings.json` - Global configuration
- **Project Memory**: `./CLAUDE.md` - Team-shared project instructions
- **Project Settings**: `.claude/settings.json` - Shared project configuration
- **Local Settings**: `.claude/settings.local.json` - Personal project overrides

### Key Features

- Hierarchical memory system with import support (`@path/to/import`)
- Granular permissions control for tools
- Custom hooks for tool executions
- Environment variable configuration

## Cursor AI

### Official Documentation

- **[Cursor Rules Documentation](https://docs.cursor.com/en/context/rules)** - Official rules system guide
- **[Cursor Changelog](https://cursor.com/en/changelog)** - Latest updates and features

### Configuration Systems

#### Modern Approach (Recommended)

- **Project Rules**: `.cursor/rules/*.mdc` files
- MDC format with frontmatter for metadata
- More organized and flexible than legacy system

#### Legacy Approach

- **Cursor Rules**: `.cursorrules` file in project root
- Still supported but migration to new system recommended

### Community Resources

- **[Awesome Cursor Rules](https://github.com/PatrickJS/awesome-cursorrules)** - Curated collection of .cursorrules configurations
- **[Cursor Community Forum](https://forum.cursor.com/)** - Discussion and examples
- **[Good Examples Thread](https://forum.cursor.com/t/good-examples-of-cursorrules-file/4346)** - Community-shared configurations

## Best Practices

### Claude Code

1. Be specific in memory instructions
2. Use structured markdown with bullet points
3. Periodically review and update memories
4. Use the `#` shortcut for quick memory additions
5. Configure permissions hierarchically

### Cursor

1. Migrate from `.cursorrules` to `.cursor/rules/*.mdc` format
2. Include project context and architecture guidelines
3. Define coding style and conventions
4. Use Auto Attached rules for file-specific guidance
5. Generate initial rules using `/Generate Cursor Rules` command

## Configuration Precedence

### Claude Code (Highest to Lowest)

1. Enterprise managed policies
2. Command line arguments
3. Local project settings (`.claude/settings.local.json`)
4. Shared project settings (`.claude/settings.json`)
5. User settings (`~/.claude/settings.json`)

### Cursor

1. Project Rules (`.cursor/rules/*.mdc`)
2. Legacy rules (`.cursorrules`)
3. Global user preferences

## Quick Start Commands

### Claude Code

```bash
# Edit user memory
claude memory edit --global

# Configure settings
claude config

# Add global settings
claude config -g
```

### Cursor

```bash
# Generate initial rules from chat
/Generate Cursor Rules

# Include files in context
@filename.ts
```

## Keeping Up to Date

- Check official documentation regularly for updates
- Follow changelogs for new features
- Participate in community forums for tips and best practices
- Review and update configurations periodically

---

_Last updated: 2025-01-18_
