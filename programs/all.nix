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
    htop = {
      enable = true;
      settings = {
        hide_kernel_threads = 1;
        hide_userland_threads = 1;
        shadow_other_users = 1;
        highlight_base_name = 1;
      };
    };
    oh-my-posh = {
      enable = true;
      enableFishIntegration = true;
      useTheme = "emodipt-extend";
    };
    fzf = {
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
    home-manager.enable = true;
    ssh.enable = true;
  };
}
