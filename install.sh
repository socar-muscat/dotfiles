#!/bin/bash
set -e

echo "🛠  Installing .dotfiles..."

ZSHRC="$HOME/.zshrc"
DOTFILES_LINE='source $HOME/.dotfiles/.zshrc.dotfiles'

# 중복 방지: 이미 포함됐으면 진행 안함
if ! grep -Fxq "$DOTFILES_LINE" "$ZSHRC"; then
  echo "Adding .dotfiles include to .zshrc"
  echo "" >> "$ZSHRC"
  echo "# Load personal dotfiles config" >> "$ZSHRC"
  echo "$DOTFILES_LINE" >> "$ZSHRC"
else
  echo "✅ .zshrc already includes .dotfiles config"
fi

echo "✅ Installed. Please restart terminal or run: source ~/.zshrc"
