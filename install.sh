#!/usr/bin/env bash

echo "Installing ai-riksarkivet-dotfiles"

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Copying bash configs..."
cp "$DOTFILES_DIR/shell/bash/.bashrc" "$HOME/.bashrc" 2>/dev/null && echo "✓ .bashrc"
cp "$DOTFILES_DIR/shell/bash/.bash_profile" "$HOME/.bash_profile" 2>/dev/null && echo "✓ .bash_profile"

echo "Copying VS Code configs..."
VSCODE_DIR="$HOME/.config/Code/User"

if [ -d "$VSCODE_DIR" ]; then
    cp "$DOTFILES_DIR/code/vscode/settings.json" "$VSCODE_DIR/settings.json" 2>/dev/null && echo "✓ settings.json"
    cp "$DOTFILES_DIR/code/vscode/keybindings.json" "$VSCODE_DIR/keybindings.json" 2>/dev/null && echo "✓ keybindings.json"
    mkdir -p "$HOME/.vscode"
    cp "$DOTFILES_DIR/code/vscode/extensions.json" "$HOME/.vscode/extensions.json" 2>/dev/null && echo "✓ extensions.json"
else
    echo "VS Code not found"
fi

echo "Done. Run: source ~/.bashrc"
