{ config, pkgs, ... }:

{
  home.file.".ideavimrc" = {
    source = ./configs/.ideavimrc;
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
