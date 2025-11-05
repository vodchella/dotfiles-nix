{ config, pkgs, ... }:

{
  programs.oh-my-posh = {
    enable = true;
    enableFishIntegration = true;
    # useTheme = "emodipt-extend";
    configFile = "$HOME/.config/oh-my-posh/emodipt-extend.omp.json";
  };
}
