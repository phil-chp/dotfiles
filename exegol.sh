#!/bin/bash
set -e

DOTFILES_DIR="$(dirname "$0")"
NVIM_SRC="$DOTFILES_DIR/nvim/dot-config/nvim"
NVIM_DST="$HOME/.exegol/my-resources/setup/nvim"

if [ -d "$NVIM_SRC" ]; then
    rm -rf "$NVIM_DST"
    mkdir -p "$(dirname "$NVIM_DST")"
    cp -r "$NVIM_SRC" "$NVIM_DST"
fi

if [ -z "$HOME/Documents/exegol-start" ]; then
    cp "$DOTFILES_DIR/exegol-start" "$HOME/Documents/exegol-start"
fi
