---
name: init-react
description: Initialize a new React project with our preferred setup
---

# Initialize React Project

Set up a new React project with TypeScript, Vite, and our standard configuration.

## Steps:
1. Create Vite project with React TypeScript template
2. Install additional dependencies (React Query, React Router, etc.)
3. Set up folder structure (/components, /services, /utils, /hooks, /types)
4. Configure ESLint and Prettier
5. Add common package.json scripts
6. Create basic test setup with Vitest

## Command:
```bash
pnpm create vite . --template react-ts
pnpm install
pnpm add @tanstack/react-query react-router-dom
pnpm add -D @testing-library/react @testing-library/jest-dom vitest
```

Then create the standard folder structure and configuration files.