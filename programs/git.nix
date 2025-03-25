{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "vodchella";
    userEmail = "twister.kz@gmail.com";
  };
}
