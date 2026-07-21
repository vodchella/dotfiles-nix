{ config, pkgs, ... }:

{
  home.file.".ideavimrc" = {
    source = ./.ideavimrc;
  };

  home.file.".xxkbrc" = {
    source = ./.xxkbrc;
  };

  home.file.".gdu.yaml" = {
    source = ./.gdu.yaml;
  };

  home.file.".config/X11" = {
    source = ./X11;
    recursive = true;
  };

  home.file.".config/i3" = {
    source = ./i3;
    recursive = true;
  };

  home.file.".config/regolith3/picom" = {
    source = ./picom;
    recursive = true;
  };

  home.file.".config/picom.conf" = {
    source = ./picom/config;
  };

  home.file.".config/flameshot" = {
    source = ./flameshot;
    recursive = true;
  };

  home.file.".config/udiskie/config.yml" = {
    source = ./udiskie.yml;
  };

  home.file.".config/posting/config.yaml" = {
    source = ./posting/config.yaml;
  };

  home.file.".config/alacritty/alacritty.toml" = {
    source = ./alacritty.toml;
  };

  home.file.".config/regolith3/i3xrocks" = {
    source = ./i3xrocks;
    recursive = true;
  };

  home.file.".config/i3blocks" = {
    source = ./i3blocks;
    recursive = true;
  };

  home.file.".config/rofi" = {
    source = ./rofi;
    recursive = true;
  };

  # home.file.".config/oh-my-posh" = {
  #   source = ./oh-my-posh;
  #   recursive = true;
  # };

  home.file.".config/fish/functions" = {
    source = ./fish/functions;
    recursive = true;
  };

  home.file.".config/nvim" = {
    source = ./neovim;
    recursive = true;
  };

  home.file.".config/nix" = {
    source = ./nix;
    recursive = true;
  };

  home.file.".config/ghostty" = {
    source = ./ghostty;
    recursive = true;
  };

  home.file.".config/yazi" = {
    source = ./yazi;
    recursive = true;
  };

  home.file.".config/nvimpager" = {
    source = ./nvimpager;
    recursive = true;
  };
}
