#!/bin/sh

set -eu

sudo=''
if [ $(id -u) -ne 0 ]; then
  sudo='sudo'
fi

echo "Installing shell goodies"
if [ -f /etc/redhat-release ]; then
  $sudo dnf install -y vim git-core fish fzf tmux curl sqlite
elif [ -f /etc/debian_version ]; then
  $sudo apt update && $sudo apt install -y git fish fzf tmux vim curl
fi

git clone --bare --recursive https://github.com/fabiojmendes/cfg.git $HOME/.local/share/cfg

alias cfg='git --git-dir=$HOME/.local/share/cfg/ --work-tree=$HOME'

cfg checkout
cfg submodule update --init
