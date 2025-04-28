#!/usr/bin/env bash

set -euo pipefail

REPO_URL="https://github.com/vodchella/dotfiles-nix.git"
TARGET_DIR="$HOME/.config/home-manager"

if [[ -d "$TARGET_DIR" ]]; then
    echo "Directory $TARGET_DIR already exists. Aborting."
    exit 1
fi

clone_and_switch() {
    echo "Cloning repository into $TARGET_DIR..."
    git clone "$REPO_URL" "$TARGET_DIR"

    cd "$TARGET_DIR"

    echo "Running home-manager switch..."
    home-manager switch
}

if command -v git &>/dev/null; then
    clone_and_switch
else
    echo "Git not found. Using nix-shell to run git temporarily..."
    nix-shell -p git --run "$(declare -f clone_and_switch); clone_and_switch"
fi

echo "Done!"
