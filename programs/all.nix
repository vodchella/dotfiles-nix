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
    fontconfig
    gcc
    most
    neofetch
    openssh
    posting
    rlwrap
    tldr
    xclip
  ];

  programs = {
    home-manager.enable = true;
    ssh.enable = true;
  };
}
