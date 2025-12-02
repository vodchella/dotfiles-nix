My nix-dotfiles
===========

Installation
-------------
* Make sure that you are not the `root` user and that the environment variables `$USER` and `$HOME` are correctly set
* Install everything needed and apply the configs: `curl -sL https://raw.githubusercontent.com/vodchella/dotfiles-nix/refs/heads/master/install.sh | bash`
  - Repo will be cloned to the `~/.config/home-manager`
* Go to the clonned repo and set up the SSH keys using the `./setup-ssh-keys.sh`
* Change the repo protocol after the `github` ssh-key has been set up: `git remote set-url origin git@github.com:vodchella/dotfiles-nix.git`
* Set up environment variables if needed in the `~/.config/fish/conf.d/00-env.fish`:
  - `set -gx RUN_TMUX_ON_FISH_STARTUP 1` -- to run `Tmux` on `Fish` startup

Resources
-------------
* https://www.nixhub.io
* https://search.nixos.org/packages
* https://github.com/nix-community/home-manager/tree/master/modules/programs
