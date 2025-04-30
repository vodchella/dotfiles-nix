My nix-dotfiles
===========

Installation
-------------
* Make sure that you are not the `root` user and that the environment variables `$USER` and `$HOME` are correctly set
* Install everything needed and apply the configs: `curl -sL https://raw.githubusercontent.com/vodchella/dotfiles-nix/refs/heads/master/install.sh | bash`
  - Repo will be cloned to the `$HOME/.config/home-manager`
* Change the repo protocol after the `github` ssh-key has been set up: `git remote set-url origin git@github.com:vodchella/dotfiles-nix.git`

Resources
-------------
* https://search.nixos.org/packages
* https://github.com/nix-community/home-manager/tree/master/modules/programs
