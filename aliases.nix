{ configDir, config, pkgs, ... }:

{
  home.shellAliases = {
    "cd.." = "cd ..";
    gc = "cd ${configDir}";
    gp = /*fish*/ "cd (find ~/projects -mindepth 1 -maxdepth 1 -type d -not -path '*/.git*' | fzf)";
    hms="home-manager switch";
    p = /*fish*/ "posting --collection (find ~/.config/posting/collections -mindepth 1 -maxdepth 1 -type d -not -path '*/.git*' | fzf)";
    r = /*fish*/ "ranger --choosedir=$HOME/.config/ranger/.rangerdir; cd (cat $HOME/.config/ranger/.rangerdir)";
    t="tmux";
    v="nvim";
    vt="nvim -c terminal";
    z="zellij";
  };
}
