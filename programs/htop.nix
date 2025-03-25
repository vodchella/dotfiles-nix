{ config, pkgs, ... }:

{
  programs.htop = {
    enable = true;
    settings = {
      hide_kernel_threads = 1;
      hide_userland_threads = 1;
      shadow_other_users = 1;
      highlight_base_name = 1;
    };
  };
}
