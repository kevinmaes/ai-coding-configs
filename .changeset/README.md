# Changesets

This directory contains changeset files that describe changes for each PR.

## Creating a changeset

Run `pnpm changeset` and follow the prompts, then commit the generated file with your PR.

## Changeset types

- **patch** (0.0.x): Bug fixes, documentation updates, minor improvements
- **minor** (0.x.0): New features, backward-compatible changes
- **major** (x.0.0): Breaking changes, API changes

## Workflow

### Single Branch Workflow

1. Create feature branch from `main`
2. Make changes and create changeset (`pnpm changeset`)
3. Create PR to `main`
4. Merge PR - Release workflow creates "Version Packages" PR
5. Merge "Version Packages" PR - Creates git tags and GitHub releases

For more information, see the [changesets documentation](https://github.com/changesets/changesets).
