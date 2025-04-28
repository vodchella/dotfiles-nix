{ config, pkgs, ... }:

{
  imports = [
    ./aliases.nix
    ./files.nix
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
}
