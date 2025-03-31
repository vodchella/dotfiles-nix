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
