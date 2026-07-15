{ config, pkgs, ... }:

{
  imports = [
    ./git.nix
    ./htop.nix
    ./fish.nix  # /home/vodchella/.nix-profile/bin/fish
    ./fzf.nix
    ./neovim.nix
    ./oh-my-posh.nix
    ./ranger.nix
    ./tmux.nix
    ./zoxide.nix
  ];

  home.packages = with pkgs; [
    checkstyle
    direnv
    fd
    fontconfig
    gcc
    gdu
    lazygit
    fastfetch
    neovim-remote
    nvimpager
    openssh
    posting
    ripgrep
    rlwrap
    serpl
    tldr
    unzip
    xclip
    yazi
  ];

  programs = {
    home-manager.enable = true;
    ssh.enable = true;
  };
}
