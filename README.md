My nix-dotfiles
===========

Installation
-------------
* Make sure that you are not the `root` user and that the environment variables `$USER` and `$HOME` are correctly set
* Install `nix`:
  - `sh <(curl -L https://nixos.org/nix/install) --no-daemon`
* Install `home-manager`:
  - `nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager`
  - `nix-channel --update`
  - `nix-shell '<home-manager>' -A install`
* Apply this config:
  - Run `curl -sL https://raw.githubusercontent.com/vodchella/dotfiles-nix/main/install.sh | bash`
  - Change repo protocol after ssh-keys installed: `git remote set-url origin git@github.com:vodchella/dotfiles-nix.git`
