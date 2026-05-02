#!/bin/bash

cd "$(dirname "$0")" || exit

git submodule update --init --recursive --remote

for dir in */ ; do
    if [[ -d "$dir" && "$dir" != .* ]]; then
        stow -t ~ --dotfiles "${dir%/}"
    fi
done

nvim --headless "+TSUpdateSync" +qa
