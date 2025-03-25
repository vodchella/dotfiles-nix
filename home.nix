{ config, pkgs, ... }:

{
  imports = [
    ./programs/all.nix
  ];

  home.username = "vodchella";
  home.homeDirectory = "/home/vodchella";

  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    openssh
  ];

  home.activation.sshPermissions = ''
    mkdir -p ~/.ssh
    chmod 700 ~/.ssh

    if [ ! -f ~/.ssh/github ]; then
      touch ~/.ssh/github
      chmod 600 ~/.ssh/github
    fi
  '';

  home.sessionVariables = {
    EDITOR = "vi";
  };

  home.shellAliases = {
    "cd.." = "cd ..";
    r ="ranger --choosedir=$HOME/.config/ranger/.rangerdir; cd (cat $HOME/.config/ranger/.rangerdir)";
    v="nvim";
    z="zellij";
  };
}
