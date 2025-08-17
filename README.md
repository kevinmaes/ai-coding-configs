# claude
Global Claude Code configuration - settings and AI agents for all projects

## What's included

- **CLAUDE.md** - Global instructions (coding standards, preferences)
- **settings.json** - Tool permissions (what Claude can run without asking)
- **agents/** - Custom AI agents (quality-checker, dependency-updater, etc.)

## Syncing

The `sync-claude.sh` script deploys everything to `~/.claude/`:

```bash
# From anywhere on your machine
./path/to/sync-claude.sh

# Or from within this repo
./sync-claude.sh
```

### What it syncs

1. Fetches latest `main` branch
2. Copies `CLAUDE.md` → `~/.claude/CLAUDE.md`
3. Copies `settings.json` → `~/.claude/settings.json`
4. Copies all agents → `~/.claude/agents/`

### Prerequisites

- Git installed
- This repo cloned locally
- `~/.claude/` directory exists

### Making the script executable

```bash
chmod +x sync-claude.sh
```
