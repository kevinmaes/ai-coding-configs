# claude
Claude configuration files, settings, or documentation applicable to all of my project repositories

## Syncing CLAUDE.md

The `sync-claude.sh` script syncs your machine-level CLAUDE.md with the one from this repo.

### Usage

```bash
# From anywhere on your machine
./path/to/sync-claude.sh

# Or from within this repo
./sync-claude.sh
```

### What it does

1. Fetches the latest `main` branch from origin
2. Copies `CLAUDE.md` from `origin/main` to `~/.claude/CLAUDE.md`
3. Shows a success message

### Prerequisites

- Git installed
- This repo cloned locally
- `~/.claude/` directory exists

### Making the script executable

```bash
chmod +x sync-claude.sh
```
