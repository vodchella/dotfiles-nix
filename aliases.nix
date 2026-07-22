{ configDir, config, pkgs, ... }:

{
  home.shellAliases = {
    "cd.." = "cd ..";
    gc  = "cd ${configDir}";
    gp  = /*fish*/ "cd (find ~/projects -mindepth 1 -maxdepth 1 -type d -not -path '*/.git*' | fzf)";
    hms = "home-manager switch";
    gg  = "nvim '+Neogit kind=replace'";
    nd  = /*fish*/ "nix develop --command fish";
    p   = "run-posting";
    s   = "serpl";
    v   = "nvim";
    vv  = "nvr -s";
    vr  = "nvr";
    reboot   = "sudo reboot";
    poweroff = "sudo poweroff";
    # r   = /*fish*/ "ranger --choosedir=$HOME/.config/ranger/.rangerdir; cd (cat $HOME/.config/ranger/.rangerdir)";
  };
}
