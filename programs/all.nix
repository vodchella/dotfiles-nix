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
    ./zellij.nix
    ./zoxide.nix
  ];

  home.packages = with pkgs; [
    alacritty
    atac
    fontconfig
    gcc
    most
    openssh
    rlwrap
    udiskie
  ];

  programs = {
    home-manager.enable = true;
    ssh.enable = true;
  };
}
