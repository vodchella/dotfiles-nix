{ config, pkgs, ... }:

{
  imports = [
    ./hard_files.nix
    ./programs/all.nix
  ];

  home.username = builtins.getEnv "USER";
  home.homeDirectory = builtins.getEnv "HOME";
  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    gcc
    most
    openssh
  ];

  home.sessionVariables = {
    TZ = "Asia/Almaty";
    EDITOR = "nvim";
    PAGER = "most";
  };

  home.shellAliases = {
    "cd.." = "cd ..";
    r ="ranger --choosedir=$HOME/.config/ranger/.rangerdir; cd (cat $HOME/.config/ranger/.rangerdir)";
    v="nvim";
    z="zellij";
  };
}
