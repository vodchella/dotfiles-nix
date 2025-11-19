{ config, pkgs, ... }:

{
  home.file.".local/bin/run-posting" = {
    source = ./run-posting;
  };
}
