{ config, pkgs, ... }:

{
  home.activation.sshPermissions = ''
    mkdir -p ~/.ssh
    chmod 700 ~/.ssh
    if [ ! -f ~/.ssh/github ]; then
      touch ~/.ssh/github
      chmod 600 ~/.ssh/github
    fi
  '';
}
