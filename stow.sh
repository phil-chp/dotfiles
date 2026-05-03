#!/bin/bash


cd "$(dirname "$0")" || exit

if ! command -v stow &> /dev/null; then
    echo "Stow is not installed. Please install it and try again."
    exit 1
fi

git submodule update --init --recursive --remote

OS="$(uname -s)"

for dir in */ ; do
    d="${dir%/}"
    if [[ "$d" == *-mac && "$OS" != "Darwin" ]]; then
        continue
    fi
    if [[ "$d" == *-linux && "$OS" != "Linux" ]]; then
        continue
    fi

    if [[ -d "$d" && "$d" != .* ]]; then
        echo "- Stowing $d..."
        stow -t ~ --dotfiles "$d"
    fi
done

if command -v nvim &> /dev/null; then
    nvim --headless "+TSUpdateSync" +qa
else
    echo "Neovim is not installed. Please install v0.12 or later."
fi
