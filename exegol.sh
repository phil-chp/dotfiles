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
