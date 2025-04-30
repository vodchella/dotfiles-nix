{ config, pkgs, ... }:

{
  home.shellAliases = {
    "cd.." = "cd ..";
    a = /*fish*/ "atac -d (find ~/.config/atac -mindepth 1 -maxdepth 1 -type d -not -path "*/.git*" | fzf)";
    gp = /*fish*/ "cd (find ~/projects -mindepth 1 -maxdepth 1 -type d -not -path "*/.git*" | fzf)";
    hms="home-manager switch";
    r = /*fish*/ "ranger --choosedir=$HOME/.config/ranger/.rangerdir; cd (cat $HOME/.config/ranger/.rangerdir)";
    v="nvim";
    vt="nvim -c terminal";
    z="zellij";
  };
}
