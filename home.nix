{ config, pkgs, ... }:

{
  imports = [
    ./programs/all.nix
  ];

  home.username = builtins.getEnv "USER";
  home.homeDirectory = builtins.getEnv "HOME";
  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    gcc
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
    EDITOR = "nvim";
  };

  home.shellAliases = {
    "cd.." = "cd ..";
    r ="ranger --choosedir=$HOME/.config/ranger/.rangerdir; cd (cat $HOME/.config/ranger/.rangerdir)";
    v="nvim";
  };
}
