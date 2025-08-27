#!/bin/bash

for dir in */ ; do
    if [[ -d "$dir" && "$dir" != .* ]]; then
        stow "${dir%/}"
    fi
done
