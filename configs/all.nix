{ config, pkgs, ... }:

{
  home.file.".ideavimrc" = {
    source = ./.ideavimrc;
  };

  home.file.".config/regolith3/picom/config" = {
    source = ./picom/config;
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

  home.file.".config/oh-my-posh" = {
    source = ./oh-my-posh;
    recursive = true;
  };

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
}
