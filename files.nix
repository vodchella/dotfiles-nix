{ config, pkgs, ... }:

{
  home.file.".ideavimrc" = {
    source = ./configs/.ideavimrc;
  };

  home.file.".config/compton.conf" = {
    source = ./configs/compton.conf;
  };

  home.file.".config/udiskie/config.yml" = {
    source = ./configs/udiskie.yml;
  };

  home.file.".config/alacritty/alacritty.toml" = {
    source = ./configs/alacritty.toml;
  };

  home.file.".config/regolith3/i3xrocks" = {
    source = ./configs/i3xrocks;
    recursive = true;
  };

  home.activation.emptySshKeys = /*bash*/ ''
    mkdir -p ~/.ssh
    chmod 700 ~/.ssh

    if [ ! -f ~/.ssh/github ]; then
      touch ~/.ssh/github
      chmod 600 ~/.ssh/github
    fi

    if [ ! -f ~/.ssh/vpn-srv ]; then
      touch ~/.ssh/vpn-srv
      chmod 600 ~/.ssh/vpn-srv
    fi
  '';
}
