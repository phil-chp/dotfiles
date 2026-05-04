#!/bin/bash
set -e

if ! command -v exegol >/dev/null 2>&1; then
    echo "[-] Exegol not found. pipx install exegol"
    exit 0
fi

DOTFILES_DIR="$(dirname "$0")"
MY_RES_PATH="$HOME/.exegol/my-resources"
NVIM_SRC="$DOTFILES_DIR/nvim/dot-config/nvim"
NVIM_DST="$MY_RES_PATH/setup/nvim"

if [ ! -d "$MY_RES_PATH/.git" ]; then
    echo "[*] Cloning my-resources repo..."
    if [ -d "$MY_RES_PATH" ]; then
        rm -rf "$MY_RES_PATH"
    fi
    git clone --recurse-submodules https://github.com/phil-chp/Exegol-my-resources "$MY_RES_PATH"
fi

if [ -d "$NVIM_SRC" ]; then
    mkdir -p $(dirname "$NVIM_DST")
    rm -rf "$NVIM_DST"
    cp -r "$NVIM_SRC" "$NVIM_DST" # copy instead of symlink to avoid mount issues
fi

if [ ! -f "$HOME/Documents/exegol-start" ]; then
    cp "$DOTFILES_DIR/exegol-start" "$HOME/Documents/exegol-start"
    chmod +x "$HOME/Documents/exegol-start"
fi

echo "[+] Exegol environment ready"
