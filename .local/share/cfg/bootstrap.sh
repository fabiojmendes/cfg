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

cfg_home=$HOME/.local/share/cfg

echo "Clone cfg repo"
git clone --bare --recursive https://github.com/fabiojmendes/cfg.git $cfg_home

alias cfg="git --git-dir=$cfg_home --work-tree=$HOME"

cfg config --local status.showUntrackedFiles no
cfg checkout
cfg submodule update --init

echo "Change default shell"
$sudo chsh -s /usr/bin/fish $USER

fish=$(which fish)

$fish $cfg_home/setup.fish
