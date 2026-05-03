#!/bin/bash


cd "$(dirname "$0")" || exit

if ! command -v stow &> /dev/null; then
    echo "Stow is not installed. Please install it and try again."
    exit 1
fi

git submodule update --init --recursive --remote

for dir in */ ; do
    if [[ -d "$dir" && "$dir" != .* ]]; then
        stow -t ~ --dotfiles "${dir%/}"
    fi
done

nvim --headless "+TSUpdateSync" +qa
