# Claude Code Statusline Package Comparison

A comparison of available statusline packages for Claude Code CLI.

## Quick Summary

| Package | Context % | Cost Tracking | Git | Worktree | Themes | Dependencies |
|---------|:---------:|:-------------:|:---:|:--------:|:------:|--------------|
| [ccstatusline](https://github.com/sirmalloc/ccstatusline) | ✅ | ✅ | ✅ | ✅ | ✅ | Node/Bun |
| [@owloops/claude-powerline](https://github.com/illumin8ca/claude-statusline) | ✅ | ✅ | ✅ | ❓ | ✅ | Node 18+ |
| [@chongdashu/cc-statusline](https://github.com/chongdashu/cc-statusline) | ✅ | ✅ | ✅ | ❌ | ✅ | Node 16+, jq |
| [@sponzig/cc-statusline](https://www.npmjs.com/package/@sponzig/cc-statusline) | ❓ | ❓ | ✅ | ❓ | ✅ | Node |
| **Ours (statusline.sh)** | ❌ | ❌ | ✅ | ✅ | ❌ | jq, bash |

## Detailed Feature Comparison

### Context & Token Tracking

| Feature | ccstatusline | claude-powerline | cc-statusline | Ours |
|---------|:------------:|:----------------:|:-------------:|:----:|
| Context window % | ✅ | ✅ | ✅ | ❌ |
| Token count display | ✅ | ✅ | ✅ | ❌ |
| Input/output/cached breakdown | ✅ | ✅ | ❓ | ❌ |
| Auto-compact threshold | ✅ | ✅ | ❓ | ❌ |
| Dynamic context limits (model-aware) | ✅ | ❓ | ❓ | ❌ |

### Cost & Session Tracking

| Feature | ccstatusline | claude-powerline | cc-statusline | Ours |
|---------|:------------:|:----------------:|:-------------:|:----:|
| Session cost ($) | ✅ | ✅ | ✅ | ❌ |
| 5-hour block timer | ✅ | ✅ | ❓ | ❌ |
| Daily budget alerts | ❓ | ✅ | ❓ | ❌ |
| Burn rate ($/hr) | ❓ | ❓ | ✅ | ❌ |
| Session duration | ✅ | ✅ | ✅ | ❌ |

### Git Integration

| Feature | ccstatusline | claude-powerline | cc-statusline | Ours |
|---------|:------------:|:----------------:|:-------------:|:----:|
| Branch name | ✅ | ✅ | ✅ | ✅ |
| Staged/unstaged/untracked counts | ✅ | ✅ | ❓ | ✅ |
| Worktree indicator | ✅ | ❓ | ❌ | ✅ |
| Commits ahead/behind | ❓ | ✅ | ❓ | ❌ |
| Stash count | ❓ | ✅ | ❓ | ❌ |
| Current SHA | ❓ | ✅ | ❓ | ❌ |

### Visual Customization

| Feature | ccstatusline | claude-powerline | cc-statusline | Ours |
|---------|:------------:|:----------------:|:-------------:|:----:|
| Themes | ✅ Multiple | ✅ 5 built-in | ✅ 256-color | ❌ |
| Powerline style | ✅ | ✅ | ❌ | ❌ |
| Multi-line support | ✅ Unlimited | ✅ | ✅ 3-line | ❌ |
| Custom colors | ✅ | ✅ | ✅ | Partial |
| Compact mode | ✅ | ✅ | ✅ | N/A |

### Installation & Setup

| Feature | ccstatusline | claude-powerline | cc-statusline | Ours |
|---------|:------------:|:----------------:|:-------------:|:----:|
| Install command | `npx ccstatusline` | `npx @owloops/claude-powerline` | `npx @chongdashu/cc-statusline init` | Manual copy |
| Interactive TUI setup | ✅ | ❓ | ✅ | ❌ |
| Zero-config defaults | ✅ | ✅ | ✅ | ✅ |
| Config location | `~/.config/ccstatusline/` | `~/.claude/` | `~/.claude/` | `~/.claude/` |
| Cross-platform | ✅ Win/Mac/Linux | ✅ | ✅ | Mac/Linux |

### Performance

| Feature | ccstatusline | claude-powerline | cc-statusline | Ours |
|---------|:------------:|:----------------:|:-------------:|:----:|
| Target execution time | Fast | Fast | <100ms (45-80ms typical) | Fast |
| Caching | ❓ | ❓ | ✅ Multi-level | ❌ |

## What's Missing From Ours

Features we could add to compete:

1. **Context window %** - Most important! Shows when you're approaching auto-compact
2. **Cost tracking** - Session spend in USD
3. **Token breakdown** - Input/output/cached tokens
4. **Themes** - Color customization
5. **Multi-line layout** - More info without truncation

## Our Unique Features

What we have that some others don't:

1. **Worktree detection** - 🌳 indicator when in a git worktree
2. **Zero npm dependencies** - Pure bash (just needs jq)
3. **Simple** - Easy to understand and modify
4. **Emoji indicators** - 📂 🌿 🌳 for visual clarity

## Available JSON Fields from Claude Code

Claude Code passes this data to statusline commands via stdin:

| Category | Fields |
|----------|--------|
| **Context Window** | `context_window.current_usage.input_tokens`, `context_window.context_window_size`, `context_window.current_usage.output_tokens`, `context_window.current_usage.cache_creation_input_tokens`, `context_window.current_usage.cache_read_input_tokens` |
| **Cost** | `cost.total_cost_usd`, `cost.total_duration_ms`, `cost.total_api_duration_ms` |
| **Code Changes** | `cost.total_lines_added`, `cost.total_lines_removed` |
| **Model** | `model.id`, `model.display_name` |
| **Session** | `session_id`, `version`, `transcript_path` |
| **Workspace** | `workspace.current_dir`, `workspace.project_dir`, `cwd` |

This means **any bash script can calculate context window %**:
```bash
input_tokens=$(echo "$input" | jq -r '.context_window.current_usage.input_tokens // 0')
context_size=$(echo "$input" | jq -r '.context_window.context_window_size // 200000')
context_pct=$(echo "scale=0; ($input_tokens * 100) / $context_size" | bc)
```

## Installation Methods Comparison

| Method | Command | Pros | Cons |
|--------|---------|------|------|
| **npx** | `npx ccstatusline` | Familiar to Node devs, auto-updates | Requires Node.js |
| **curl** | `curl -fsSL url \| bash` | No Node needed, lightweight | Less familiar, security concerns |
| **Homebrew** | `brew install package` | Mac-native, manages deps | Mac-only, more setup |
| **Manual** | Clone + run script | Full control | More steps |

### Bash-only Installation (Our Approach)

```bash
# Install
curl -fsSL https://raw.githubusercontent.com/kevinmaes/claude-statusline/main/install.sh | bash

# Uninstall
curl -fsSL https://raw.githubusercontent.com/kevinmaes/claude-statusline/main/uninstall.sh | bash
```

**What the installer does:**
1. Checks for jq dependency (prompts to install if missing)
2. Creates `~/.claude/` if needed
3. Downloads `statusline.sh` to `~/.claude/`
4. Makes it executable
5. Merges `statusLine` config into existing `~/.claude/settings.json` (preserves other settings)

## Recommendation

If you need **full-featured with TUI**:
- **[ccstatusline](https://github.com/sirmalloc/ccstatusline)** - Most feature-rich, interactive TUI, worktree support

If you want **lightweight bash-only** (no Node.js):
- **Ours** - Simple bash script with context %, cost, git status, worktree detection

## Links

- [ccstatusline on npm](https://www.npmjs.com/package/ccstatusline)
- [@owloops/claude-powerline on npm](https://www.npmjs.com/package/@owloops/claude-powerline)
- [@chongdashu/cc-statusline on GitHub](https://github.com/chongdashu/cc-statusline)
- [Claude Code Status Line Docs](https://code.claude.com/docs/en/statusline)
