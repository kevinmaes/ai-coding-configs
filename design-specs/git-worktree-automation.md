# Git Worktree Automation Project Brief

## Context

Working on automating Git worktree management for multi-branch development with the following requirements:

### Core Workflow Needs

- Create new worktree + branch in one command
- Auto-assign unused localhost ports for dev servers
- Copy `.env.local` to new worktree directories
- Run `bun install` / `pnpm install` automatically
- Integrate with VS Code/Claude Code workflow

### Current Tech Stack

- TypeScript primary language
- VS Code development environment
- Bun or pnpm package manager
- Next.js (implied from port 3000 default)

## Proposed Solutions Discussed

1. **Shell script approach** - Simple bash automation
2. **TypeScript CLI tool** - More sophisticated port management and error handling
3. **VS Code tasks integration** - Quick command palette access
4. **Claude Code templates** - Reusable project patterns

## Next Steps

- Implement core worktree creation script
- Add intelligent port detection/assignment
- Create VS Code task configuration
- Build error handling and cleanup procedures
- Consider packaging as npm script or standalone CLI

## Key Implementation Details

- Worktrees stored in `../worktrees/[branch-name]` structure
- Port scanning starting from 3000, incrementing until available
- Environment file copying from project root
- Package.json script modification for custom ports

Please help implement this automation system, starting with the most practical approach for immediate use.
