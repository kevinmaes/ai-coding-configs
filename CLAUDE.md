# CLAUDE.md - Global Instructions for Claude Code

## Overview
This file contains global instructions and preferences that Claude should follow across all projects. These instructions override default behaviors.

## Core Principles
- Functional programming over OOP (pure functions, factory functions)
- Error boundaries at top level, scoped lower when needed
- TypeScript always, named exports only (no default exports)
- File naming: kebab-case by default, PascalCase only for React components

## React Development
### Framework
- Primary: React with Vite
- Alternative: Next.js for SSR/SSG needs

### Component Patterns
- Only functional components with hooks
- Props as interfaces (inline for small, top of file for large)
- Prefer Context over prop drilling, scoped close to consumers
- PascalCase component names

### State Management
- Local state: single useState or useReducer for grouped changes
- Avoid: Multiple useState hooks, boolean state proliferation
- Complex state: XState for event-based management and actor model

### Styling
- Default: Tailwind CSS
- Alternatives: Chakra UI, CSS Modules, Emotion (CSS-in-JS only, no styled-components)

## Project Structure
- Layer-based folders: `/components/`, `/services/`, `/utils/`, `/hooks/`, `/types/`
- Co-locate test files: `Button.tsx`, `Button.test.tsx`
- Test naming: `.test.ts(x)` for unit tests, `.spec.ts(x)` for E2E
- Coverage: Start with low thresholds, ratchet up as tests grow (never decrease)

## Development Workflow
### Tools & Scripts
- Package manager: pnpm (including monorepos)
- Build: Vite (unless Next.js)
- Test: Vitest (unit), React Testing Library, Playwright (E2E)
- Test structure: AAA pattern (Arrange, Act, Assert)
- Format: Prettier default settings
- Lint: ESLint with eslint.config.js

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
- CI/CD: Quality checks on PRs to main/dev (lint, types, format)
- Separate workflows for unit and E2E tests
- All workflows must pass before PR merge allowed

## Documentation
- JSDoc when meaningful
- README: Short, scannable, use tables/diagrams over text
- Comments: Explain "why" not "what"

## Security
- Secrets: .env/.env.local locally, GitHub Secrets for CI, platform env vars
- LLM/MCP: [Prevent sensitive data leaks - to be defined]

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

## UI/UX Standards
- Button text: Sentence case ("Save changes", not "Save Changes")

---
_Last updated: 2025-08-15_