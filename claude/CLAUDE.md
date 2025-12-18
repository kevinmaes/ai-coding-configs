# CLAUDE.md - Global Instructions for Claude Code

## Overview

This file contains global instructions and preferences that Claude should follow across all projects. These instructions override default behaviors.

## Core Principles

- Functional programming over OOP (pure functions, factory functions)
- Exception: Use classes for performance-critical code with many instances (e.g., creative coding, game entities)

## Technical Standards

- TypeScript always, named exports only (no default exports)
- File naming: kebab-case by default, PascalCase only for React components

## TypeScript

- Prefer interfaces over types (especially when extending)
- Use type unions instead of enums
- Strict mode always enabled

## React Development

### Framework

- Primary: React with Vite
- Alternative: Next.js for SSR/SSG needs

### Component Patterns

- Only functional components with hooks
- Props as interfaces (inline for small, top of file for large)
- Prefer Context over prop drilling, scoped close to consumers
- PascalCase component names
- Error boundaries at top level, scoped lower when needed

### State Management

- Local state: single useState or useReducer for grouped changes
- Avoid: Multiple useState hooks, boolean state proliferation
- Complex state: XState for event-based management and actor model

### Data Fetching

- Use React Query (TanStack Query) for server state
- Handle loading, error, and success states
- Leverage mutations for data updates

### Styling

- Default: Tailwind CSS
- Alternatives: Chakra UI, CSS Modules, Emotion (CSS-in-JS only, no styled-components)

## Project Structure

- Layer-based folders: `/components/`, `/services/`, `/utils/`, `/hooks/`, `/types/`
- Co-locate test files: `Button.tsx`, `Button.test.tsx`
- Test naming: `.test.ts(x)` for unit tests, `.spec.ts(x)` for E2E
- Coverage: Start with low thresholds, ratchet up as tests grow (never decrease)

## AI Planning & Design Specs

- Store all AI-oriented planning documents in `/design-specs/` folder
- Include: Feature plans, architecture designs, implementation strategies
- File naming: `feature-name.md` or `module-name-plan.md`
- Purpose: Centralized location for AI coding assistants to reference
- Reference in conversations: Use `@/design-specs/feature.md` to include specific docs
- Keep specs updated as implementation evolves

## Development Workflow

### Tools & Scripts

- Package manager: pnpm (including monorepos)
- Build: Vite (unless Next.js)
- Test: Vitest (unit), React Testing Library, Playwright (E2E)
- Test structure: AAA pattern (Arrange, Act, Assert)
- Test preference: Don't run tests automatically after changes (developer uses test:watch)
- Format: Prettier default settings
- Lint: ESLint with eslint.config.js
- Date/time: date-fns or native JS (if readable and tested)

### Common package.json scripts

- `dev`/`start` - Development server
- `build` - Production build
- `test` - Unit tests
- `test:e2e` - E2E tests
- `format` - Prettier write
- `format:check` - Prettier check
- `lint` - ESLint check
- `lint:fix` - ESLint fix

### Git Workflow

- Branches: `feature/description-kebab-case` or GitHub issue names
- Commits: AI uses conventional commits, humans use single line + details
- Commit messages: Be concise and direct. Avoid overusing words like "Enhanced" or "Enhancing". Simply state what was done
- Before committing: Run `pnpm format` to ensure Prettier formatting
- CI/CD: Quality checks on PRs to main/dev (lint, types, format)
- Separate workflows for unit and E2E tests
- All workflows must pass before PR merge allowed

### Hooks

- Post-edit hook: Automatically runs `pnpm format` after file edits
- Ensures consistent code formatting throughout the session
- Configured in claude/settings.json

## Documentation 📝

- **Always concise**, never verbose
- JSDoc when meaningful
- README: Short, scannable, use tables/diagrams over text
- Comments: Explain "why" not "what"
- Use emojis sparingly for visual interest ✨
- Avoid using em dashes in documentation and writing

## Estimation Format

When providing time estimates for tasks, show AI implementation time only. Be aggressive, not conservative.

Format: **~2 min** or in tables:
| Task | Time |
|------|------|
| Refactor component | ~2 min |
| Add new feature | ~5 min |
| Fix bug | ~1 min |

Guidelines:
- Most single-file changes: ~1-2 min
- Multi-file features: ~3-5 min
- Complex refactors: ~5-10 min

## Security

- Secrets: .env/.env.local locally, GitHub Secrets for CI, platform env vars
- Never hardcode secrets - use environment variables
- Add .env to .gitignore
- Review AI-generated code for accidental secret exposure
- If you detect exposed secrets (API keys, tokens, passwords):
  1. Immediately append to `.security-alerts.log`
  2. Include: timestamp, type of secret, file location
  3. Display warning in response
  4. Never log the actual secret value
- Never commit files containing secrets

## Recovery Strategy

When large changes cause many failures:

1. Temporarily skip failing tests
2. Disable lint rules in test files (eslint-disable comments)
3. Disable type checking in test files if needed (// @ts-nocheck)
4. Fix incrementally, file by file, commit by commit
5. Re-enable all checks gradually (green to green approach)

## Communication Style

- Keep responses concise and scannable
- Use numbered lists for multi-part questions
- Only present truly viable options
- Make clear recommendations
- Ask specific, targeted questions
- When gathering information, ask ONE question at a time for better conversation flow

## Accessibility ♿

- Semantic HTML elements
- ARIA labels when needed
- Keyboard navigation support
- Focus management in SPAs
- Alt text for images
- Color contrast compliance

## UI/UX Standards

- Button text: Sentence case ("Save changes", not "Save Changes")

---

_Last updated: 2025-08-15_
