#!/usr/bin/env bash

set -euo pipefail

REPO_URL="https://github.com/vodchella/dotfiles-nix.git"
TARGET_DIR="$HOME/.config/home-manager"

# Проверка наличия команды
command_exists() {
    command -v "$1" &> /dev/null
}

# Устанавливаем Nix, если его нет
if ! command_exists nix; then
    echo "Nix not found. Installing Nix..."
    sh <(curl -L https://nixos.org/nix/install) --no-daemon
    # После установки подгружаем окружение
    . "$HOME/.nix-profile/etc/profile.d/nix.sh"
fi

# Устанавливаем Home Manager, если его нет
if ! command_exists home-manager; then
    echo "Home Manager not found. Installing Home Manager..."
    nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
    nix-channel --update
    nix-shell '<home-manager>' -A install
fi

# Проверка: если директория уже существует, то удаляем её
if [[ -d "$TARGET_DIR" ]]; then
    echo "Directory $TARGET_DIR already exists. Removing..."
    rm -rf "$TARGET_DIR"
fi

# Функция клонирования репозитория и переключения
clone_and_switch() {
    echo "Cloning repository into $TARGET_DIR..."
    git clone "$REPO_URL" "$TARGET_DIR"

    cd "$TARGET_DIR"

    echo "Switching Home Manager configuration..."
    home-manager switch
}

# Проверяем наличие git
if command_exists git; then
    clone_and_switch
else
    echo "Git not found. Using nix-shell to run git temporarily..."
    nix-shell -p git --run "$(declare -f clone_and_switch); clone_and_switch"
fi

echo "Done!"
