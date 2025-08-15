# AI Commit Message Cleanup Design Spec

## Overview
A workflow to automatically improve commit messages using AI, without blocking the commit process.

## Requirements
- Non-blocking: Initial commit happens immediately
- AI processes the commit message after the fact
- Automatically amends the commit with improved message
- Should format to conventional commit style

## Proposed Workflow
1. User makes a commit with any message
2. Post-commit hook triggers AI cleanup script
3. AI reformats message to conventional commit format
4. Script amends the commit with improved message
5. Optional: Push the amended commit if configured

## Technical Approach
- Use git post-commit hook
- Call AI API to process commit message
- Use `git commit --amend` to update message
- Preserve original message in extended description if needed

## Configuration Options
- Enable/disable automatic amendment
- Choose AI model/service
- Custom conventional commit types
- Preserve original message as comment

## Open Questions
- How to handle commits that are already pushed?
- Should it work with interactive rebases?
- How to handle merge commits?

## Implementation Notes
[To be added during implementation]