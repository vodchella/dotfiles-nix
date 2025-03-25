{ config, pkgs, ... }:

{
  programs.zellij = {
    enable = true;
    enableFishIntegration = false;
    settings = {
      pane_frames = false;
      default_mode = "locked";
      session_name = "vodchella";
      attach_to_session = true;
      show_startup_tips = false;
    };
  };
}
