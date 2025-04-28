{ config, pkgs, ... }:

{
  home.shellAliases = {
    "cd.." = "cd ..";
    hms="home-manager switch";
    r = /*bash*/ "ranger --choosedir=$HOME/.config/ranger/.rangerdir; cd (cat $HOME/.config/ranger/.rangerdir)";
    v="nvim";
    vt="nvim -c terminal";
    z="zellij";
  };
}
