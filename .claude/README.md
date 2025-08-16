# Claude Code Configuration

This directory contains project-specific configurations for Claude Code.

## Structure

```
.claude/
├── settings.json    # Permission controls and environment settings
├── agents/         # Custom AI agents for specialized tasks
│   └── monorepo-navigator.md
└── README.md       # This file
```

## Settings.json

Controls what Claude can do without asking permission:
- **allow**: Commands that run automatically
- **deny**: Commands that are always blocked
- **ask**: Commands that require confirmation
- **hooks**: Pre/post command scripts
- **env**: Environment variables for Claude sessions

## Custom Agents

Specialized AI assistants for specific tasks:
- `monorepo-navigator`: Helps with pnpm workspace navigation

To use an agent: "Use the monorepo-navigator agent to..."

## Customization Needed

- [ ] Configure pre-commit hooks for code quality
- [ ] Add project-specific allowed commands
- [ ] Create additional custom agents as needed
- [ ] Set up environment variables

## Notes

These settings override global Claude settings at `~/.claude/`