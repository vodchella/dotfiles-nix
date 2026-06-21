{ config, pkgs, ... }:

{
  imports = [
    ./git.nix
    ./htop.nix
    ./fish.nix
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
    lazygit
    most
    fastfetch
    neovim-remote
    openssh
    posting
    ripgrep
    rlwrap
    serpl
    tldr
    unzip
    xclip
  ];

  programs = {
    home-manager.enable = true;
    ssh.enable = true;
  };
}
