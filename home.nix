{ config, pkgs, ... } @ args:
let
  configDir = builtins.toString ./.;
in
{
  _module.args.configDir = configDir;

  imports = [
    ./aliases.nix
    ./files.nix
    ./fonts.nix
    ./programs/all.nix
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
