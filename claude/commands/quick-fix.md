---
name: quick-fix
description: Run format and lint fixes before committing
---

# Quick Fix

Run formatting and linting fixes to clean up code before committing.

## What it does:

- Formats all files with Prettier
- Shows any remaining errors that need manual fixes

## Commands:

```bash
bun run format
```

If errors remain after auto-fix, they'll be shown for manual resolution.
