{ config, pkgs, ... }:

{
  programs.oh-my-posh = {
    enable = true;
    enableFishIntegration = true;
    # useTheme = "emodipt-extend";
    # configFile = "$HOME/.config/oh-my-posh/vodchella.omp.json";
    settings = builtins.fromJSON (
      builtins.readFile ../configs/oh-my-posh/vodchella.omp.json
    );
  };
}
