# Lint-staged Setup Notes

## Why lint-staged?
- AI agents don't trigger "format on save" in editors
- Need formatting to happen automatically before commits
- Only format staged files (fast, targeted)

## Typical setup:
```json
// package.json
"lint-staged": {
  "*": "prettier --write --ignore-unknown"
}
```

## With husky:
```bash
pnpm add -D lint-staged husky
npx husky init
echo "npx lint-staged" > .husky/pre-commit
```

## Note:
This solves the "AI makes unformatted changes" problem while keeping commits fast!