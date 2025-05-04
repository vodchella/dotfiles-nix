{ config, pkgs, ... }:

{
  imports = [
    ./aliases.nix
    ./files.nix
    ./fonts.nix
    ./programs/all.nix
  ];

  home.username = builtins.getEnv "USER";
  home.homeDirectory = builtins.getEnv "HOME";
  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    fontconfig
    gcc
    most
    openssh
  ];

  home.sessionVariables = {
    TZ = "Asia/Almaty";
    EDITOR = "nvim";
    PAGER = "most";
  };
}
