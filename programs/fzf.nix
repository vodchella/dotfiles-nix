{ config, pkgs, ... }:

{
  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
    defaultOptions = [
      "--height 40%"
      "--border rounded"
      "--layout reverse"
      "--pointer ▶"
      "--marker ⇒"
      "--margin=1,3"
    ];
  };
}
