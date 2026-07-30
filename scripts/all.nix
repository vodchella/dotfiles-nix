{ config, pkgs, ... }:

{
  home.file.".local/bin/run-posting" = {
    source = ./run-posting;
  };

  home.file.".local/bin/i3-session" = {
    source = ./i3-session;
  };

  home.file.".local/bin/random-wallpaper" = {
    source = ./random-wallpaper;
  };
}
