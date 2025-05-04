{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    nerd-fonts.terminess-ttf
  ];
  fonts.fontconfig.enable = true;
}
