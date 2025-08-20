# Shared Coding Principles

This is the source of truth for coding standards across all AI assistants.

## Programming Paradigm
- Functional programming over OOP (pure functions, factory functions)
- Exception: Classes for performance-critical code with many instances

## Language & Syntax
- TypeScript always, never plain JavaScript
- Named exports only (no default exports)
- File naming: kebab-case (PascalCase for React components only)

## TypeScript Specifics
- Interfaces over types (especially when extending)
- Type unions over enums
- Strict mode always enabled

## React Patterns
- Functional components with hooks only
- Props as interfaces
- Context over prop drilling
- Error boundaries at appropriate levels

## State Management
- Single useState/useReducer for grouped state
- XState for complex state machines

## Data Layer
- React Query for server state
- Handle all loading/error/success states
- Mutations for updates

## Styling
- Tailwind CSS (default)
- Alternatives: Chakra UI, CSS Modules, Emotion
- Never: styled-components

## Testing
- Co-locate test files
- AAA pattern (Arrange, Act, Assert)
- .test.ts(x) for unit, .spec.ts(x) for E2E

## Developer Experience
- pnpm for package management
- Vite for build (unless Next.js)
- Prettier with default settings
- ESLint with eslint.config.js

## Documentation
- Concise over verbose
- "Why" over "what"
- One question at a time in conversations
- Avoid using em dashes in documentation and writing

## Git Workflow
- Clear, concise commit messages
- Be direct. Avoid overusing words like "Enhanced" or "Enhancing"
- Simply state what was done

## Accessibility
- Semantic HTML
- Keyboard navigation
- Proper ARIA labels
- Alt text for images

## UI Standards
- Sentence case for buttons ("Save changes")