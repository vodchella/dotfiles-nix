{ config, pkgs, ... }:
let
  configDir = builtins.toString ./.;
in
{
  _module.args.configDir = configDir;

  imports = [
    ./aliases.nix
    ./files.nix
    ./fonts.nix
    ./configs/all.nix
    ./programs/all.nix
    ./scripts/all.nix
  ];

  home.username = builtins.getEnv "USER";
  home.homeDirectory = builtins.getEnv "HOME";
  home.stateVersion = "24.11";

  home.sessionVariables = {
    TZ = "Asia/Almaty";
    EDITOR = "nvim";
    PAGER = "most";
  };
}
