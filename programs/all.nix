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
    ./zellij.nix
    ./zoxide.nix
  ];

  programs = {
    home-manager.enable = true;
    ssh.enable = true;
  };
}
