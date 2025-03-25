{ config, pkgs, ... }:

{
  programs.ranger = {
    enable = true;
    settings = {
      viewmode = "multipane";
      show_hidden = true;
      line_numbers = "relative";
    };
    mappings = {
      v = "shell nvim %s";
      a = "mark_files all=True toggle=True";
      r = "rename_append";
      gc = "cd ~/.config";
    };
    plugins = [
      {
        name = "ranger_devicons";
        src = builtins.fetchGit {
          url = "https://github.com/alexanderjeurissen/ranger_devicons";
          rev = "f227f212e14996fbb366f945ec3ecaf5dc5f44b0";
        };
      }
    ];
    extraConfig = ''
      default_linemode devicons
    '';
  };
}
