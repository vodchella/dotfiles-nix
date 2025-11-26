{ config, pkgs, ... }:

{
  programs.oh-my-posh = {
    enable = true;
    enableFishIntegration = true;
    # useTheme = "emodipt-extend";
    configFile = "$HOME/.config/oh-my-posh/vodchella.omp.json";
  };
}
