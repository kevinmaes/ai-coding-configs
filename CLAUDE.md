# CLAUDE.md - Global Instructions for Claude Code

## Overview

This file contains global instructions and preferences that Claude should follow across all projects. These instructions override default behaviors.

## Code Style & Conventions

### General Principles

- Prefer functional programming over OOP
- Use pure functions for testability
- Use factory functions instead of classes when instantiation is needed

### Language-Specific Guidelines

#### JavaScript/TypeScript

- Always use TypeScript
- Use named exports exclusively (no default exports)
- React: Use only functional components with hooks
- React: Use PascalCase for component names
- React: Define props as interfaces, inline for small props or at top of file for larger ones
- React: Prefer React Context over prop drilling, scoped close to consumers
- File naming: kebab-case for non-components, PascalCase for components

#### Other Languages

- [Add sections for other languages you work with]

## UI/UX Guidelines

### Text Standards

- **Call to action buttons**: Always use sentence case (e.g.,
  "Save changes", "Remove all overrides", "Reset to default")
- [Add more UI text conventions]

### Component Patterns

- [Preferred UI component libraries]
- [Naming conventions for components]
- [Accessibility requirements]

## Project Structure & Organization

### File Organization

- [Preferred folder structure]
- [Naming conventions for files/folders]
- [Where to place different types of files]

### Documentation Standards

- [When to create/update documentation]
- [Documentation format preferences]
- [Comment style preferences]

## Development Workflow

### Git & Version Control

- [Commit message format]
- [Branch naming conventions]
- [PR/MR guidelines]

### Testing

- [Testing philosophy]
- [Test file naming/organization]
- [Coverage requirements]

### Build & Deploy

- [Preferred build tools]
- [Environment management]
- [Deployment considerations]

## Communication & Interaction Style

### Response Format

- [How Claude should structure responses]
- [Level of detail preferences]
- [When to ask for clarification vs making assumptions]

### Proactivity Level

- [When to be proactive vs wait for instructions]
- [Types of suggestions to make/avoid]
- [Error handling approach]

## Security & Best Practices

### Security Guidelines

- [Security considerations to always check]
- [Sensitive data handling]
- [Authentication/authorization patterns]

### Performance Considerations

- [Performance patterns to follow]
- [Optimization priorities]
- [Resource management]

## Tool Usage Preferences

### Preferred Tools & Libraries

- Package manager: pnpm (including for monorepos)
- Formatting: Prettier with default settings
- Linting: ESLint with eslint.config.js
- Scripts: Add `pnpm format` (writes) and `pnpm format:check` (checks only)

### Claude Code Specific

- [When to use TodoWrite]
- [Search strategy preferences]
- [File editing approach]

## Project-Specific Overrides

_Note: Individual projects may have their own CLAUDE.md that overrides these global settings_

## Raw Ideas / To Be Organized

[Dump your ideas here and ask Claude to help organize them into the sections above]

---

_Last updated: 2025-08-14_
