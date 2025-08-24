#!/usr/bin/env bash

# Setup auto-completion for ai-config command

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Detect shell
if [[ -n "$ZSH_VERSION" ]]; then
    # Zsh
    echo "Setting up zsh completion..."
    echo "" >> ~/.zshrc
    echo "# AI Config auto-completion" >> ~/.zshrc
    echo "export PATH=\"\$PATH:$SCRIPT_DIR\"" >> ~/.zshrc
    echo "compdef '_arguments \"1: :(sync check update-deps validate help)\"' ai-config" >> ~/.zshrc
    echo "✅ Added to ~/.zshrc. Run 'source ~/.zshrc' to activate."
    
elif [[ -n "$BASH_VERSION" ]]; then
    # Bash
    echo "Setting up bash completion..."
    echo "" >> ~/.bashrc
    echo "# AI Config auto-completion" >> ~/.bashrc
    echo "export PATH=\"\$PATH:$SCRIPT_DIR\"" >> ~/.bashrc
    echo "complete -W \"sync check update-deps validate help\" ai-config" >> ~/.bashrc
    echo "✅ Added to ~/.bashrc. Run 'source ~/.bashrc' to activate."
    
else
    echo "⚠️  Unknown shell. Please add this to your shell config:"
    echo "export PATH=\"\$PATH:$SCRIPT_DIR\""
    echo "And set up completion for: sync check update-deps validate help"
fi