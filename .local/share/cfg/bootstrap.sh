#!/bin/sh

set -eu

sudo=''
if [ $(id -u) -ne 0 ]; then
  sudo='sudo'
fi

echo "Installing shell cfg"
if [ -f /etc/redhat-release ]; then
  $sudo dnf install -y vim git-core fish fzf tmux curl sqlite util-linux-user
elif [ -f /etc/debian_version ]; then
  $sudo apt update && $sudo apt install -y git fish fzf tmux vim curl
fi

# Git settings
git config --global init.defaultbranch master
git config --global user.email "fabiojmendes@gmail.com"
git config --global user.name "Fabio Mendes"
git config --global rebase.autoStash true
git config --global pull.rebase true

# Cfg
echo "Clone cfg repo"
cfg_home=$HOME/.local/share/cfg
git clone --bare --recursive https://github.com/fabiojmendes/cfg.git $cfg_home/.git
alias cfg="git --git-dir=$cfg_home/.git --work-tree=$HOME"
cfg config --local status.showUntrackedFiles no
cfg checkout
cfg submodule update --init

echo "Change default shell to fish"
fish=$(which fish)
$sudo chsh -s $fish $USER

$fish $cfg_home/first_login.fish
