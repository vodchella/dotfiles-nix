{ config, pkgs, ... }:

{
  programs.oh-my-posh = {
    enable = true;
    enableFishIntegration = true;
    useTheme = "emodipt-extend";
  };
}
