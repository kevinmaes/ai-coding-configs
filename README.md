# AI Coding Configs

Unified configuration for AI coding assistants (Claude, Cursor, and future tools).

## Structure

```
├── claude/          # Claude Code specific
│   ├── CLAUDE.md    # Instructions
│   ├── settings.json # Permissions
│   └── agents/      # Custom AI agents
├── cursor/          # Cursor specific
│   └── .cursorrules # Instructions
├── shared/          # Common principles
│   └── principles.md # Source of truth
└── sync-all.sh      # Deploy configs
```

## Quick Start

```bash
# Clone and sync all configurations
git clone https://github.com/[username]/ai-coding-configs.git
cd ai-coding-configs
./sync-all.sh
```

## What Gets Synced

**Claude** → `~/.claude/`

- CLAUDE.md (coding standards)
- settings.json (permissions)
- Custom agents

**Cursor** → `~/`

- .cursorrules (coding standards)

## Updating Configurations

1. **Edit shared/principles.md** for universal changes
2. **Use config-sync agent** to propagate: "Use the config-sync agent to update all tools"
3. **Review and commit** changes

## Custom Agents

- **config-sync** - Translates principles across tools
- **quality-checker** - Runs tests, lint, typecheck
- **dependency-updater** - Updates packages safely
- **monorepo-navigator** - pnpm workspace helper

## Prerequisites

- Git
- `~/.claude/` directory exists
- Tools installed (Claude Code, Cursor, etc.)
