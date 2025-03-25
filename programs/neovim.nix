{ config, pkgs, ... }:

{
  home.file.".config/nvim" = {
    source = ../configs/neovim;
    recursive = true;
  };

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };
}
