{ config, pkgs, ... }:

{
  programs.fish = {
    enable = true;
    package = pkgs.fish.overrideAttrs (oldAttrs: {
      version = "4.1.0";
      src = pkgs.fetchurl {
        url = "https://github.com/fish-shell/fish-shell/releases/download/4.1.0/fish-4.1.0.tar.xz";
        sha256 = "07a76c67e161b9edc772e6f1d66ebead85d7056e86631d61577f9f9a529c4d9c";
        # url = "https://github.com/fish-shell/fish-shell/releases/download/3.7.1/fish-3.7.1.tar.xz";
        # sha256 = "614c9f5643cd0799df391395fa6bbc3649427bb839722ce3b114d3bbc1a3b250";
      };
      doCheck = false;
      doInstallCheck = false;
      doTest = false;
      buildInputs = oldAttrs.buildInputs ++ [ pkgs.ncurses ];
      cmakeFlags = (oldAttrs.cmakeFlags or []) ++ [ "-DBUILD_TESTING=OFF" ];
      patchPhase = ''
        echo "Skipping patchPhase"
      '';
      checkPhase = ''
        echo "Skipping checkPhase"
      '';
    });

    shellInit = /*fish*/ ''
      set -gx fish_greeting 'Hello, Max!'
      set -gx LANG en_US.UTF-8
      set -gx LC_ALL en_US.UTF-8

      set -gx PATH $PATH $HOME/.nix-profile/bin /nix/var/nix/profiles/default/bin
      set -gx NIX_PATH "nixpkgs=$HOME/.nix-defexpr/channels/nixpkgs"
      set -gx MANPATH $MANPATH $HOME/.nix-profile/share/man
      set -gx INFOPATH $INFOPATH $HOME/.nix-profile/share/info

      if test -e /nix/var/nix/profiles/default/etc/profile.d/nix.sh
          source /nix/var/nix/profiles/default/etc/profile.d/nix.sh
      end

      bind \cf fzf-file-widget
    '';

    interactiveShellInit = /*fish*/ ''
      set -gx PATH $PATH $HOME/.nix-profile/bin /run/current-system/sw/bin /nix/var/nix/profiles/default/bin

      if type -q opam
        eval (opam env)
      end

      if not set -q TMUX
        if set -q RUN_TMUX_ON_FISH_STARTUP; and test "$RUN_TMUX_ON_FISH_STARTUP" = "1"
          exec tmux
        end
      end

      if not pgrep -u (id -u) ssh-agent > /dev/null
        eval (ssh-agent -c) >/dev/null
      end

      if not ssh-add -l | grep -q github
        ssh-add ~/.ssh/github >/dev/null 2>&1
        ssh-add ~/.ssh/vpn-srv >/dev/null 2>&1
      end
    '';
  };
}
