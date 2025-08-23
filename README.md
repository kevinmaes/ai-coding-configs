# AI Coding Configs

Unified configuration for AI coding assistants (Claude and Cursor).

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

### Option 1: Interactive Setup (Recommended)
```bash
# Clone the repository
git clone https://github.com/[username]/ai-coding-configs.git
cd ai-coding-configs

# Run interactive setup
pnpm install
pnpm setup

# Add ai-config to PATH
echo "export PATH=\"\$PATH:$(pwd)\"" >> ~/.bashrc  # or ~/.zshrc
source ~/.bashrc  # or ~/.zshrc
```

### Option 2: Quick Sync
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

## CLI Commands

The `ai-config` script provides convenient commands for common tasks:

| Command | Description | Example |
|---------|-------------|---------|
| `ai-config sync` | Sync shared principles to all AI tools | `ai-config sync` |
| `ai-config check` | Run quality checks (lint, types, tests) | `ai-config check --fix` |
| `ai-config update-deps` | Update dependencies safely | `ai-config update-deps --major` |
| `ai-config validate` | Validate all config files | `ai-config validate` |
| `ai-config help` | Show available commands | `ai-config help` |

### Usage with AI Assistants

Tell Claude or Cursor to run these commands:
- "Run `ai-config sync` to update configurations"
- "Execute `ai-config check` to validate code quality"

## Custom Agents

- **config-sync** - Translates principles across tools
- **quality-checker** - Runs tests, lint, typecheck
- **dependency-updater** - Updates packages safely
- **monorepo-navigator** - pnpm workspace helper

## Prerequisites

- Git
- `~/.claude/` directory exists
- Tools installed (Claude Code, Cursor, etc.)
