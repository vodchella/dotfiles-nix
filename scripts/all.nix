{ config, pkgs, ... }:

{
  home.file.".local/bin/run-posting" = {
    source = ./run-posting;
  };

  home.file.".local/bin/run-harlequin" = {
    source = ./run-harlequin;
  };
}
