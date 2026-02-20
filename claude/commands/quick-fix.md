---
name: quick-fix
description: Run format and lint fixes before committing
---

# Quick Fix

Run formatting and linting fixes to clean up code before committing.

## What it does:

- Formats all files with Prettier
- Fixes auto-fixable ESLint issues
- Shows any remaining errors that need manual fixes

## Commands:

```bash
# Using Bun (default):
bun format
bun lint:fix

# Using pnpm:
pnpm format
pnpm lint:fix
```

If errors remain after auto-fix, they'll be shown for manual resolution.
