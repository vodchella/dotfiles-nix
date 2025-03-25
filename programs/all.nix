{ config, pkgs, ... }:

{
  imports = [
    ./fish.nix
    ./ranger.nix
  ];

  programs = {
    git = {
      enable = true;
      userName = "vodchella";
      userEmail = "twister.kz@gmail.com";
    };
    oh-my-posh = {
      enable = true;
      enableFishIntegration = true;
      useTheme = "emodipt-extend";
    };
    home-manager.enable = true;
    ssh.enable = true;
  };
}
