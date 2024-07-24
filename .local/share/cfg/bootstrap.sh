#!/bin/sh

set -eu

cfg_home=$HOME/.local/share/cfg
if [ -d $cfg_home ]; then
  echo "cfg already installed"
  exit
fi

echo "Installing shell cfg"

sudo=''
if [ $(id -u) -ne 0 ]; then
  sudo='sudo'
fi

. /etc/os-release

add_deb_repo() {
  $sudo apt update && $sudo apt install -y gpg curl
  echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/3/Debian_11/ /' |
    $sudo tee /etc/apt/sources.list.d/shells:fish:release:3.list
  curl -fsSL https://download.opensuse.org/repositories/shells:fish:release:3/Debian_11/Release.key |
    gpg --dearmor | $sudo tee /etc/apt/trusted.gpg.d/shells_fish_release_3.gpg >/dev/null
}

add_rhel_repo() {
  curl -fsSL https://download.opensuse.org/repositories/shells:fish:release:3/CentOS-9_Stream/shells:fish:release:3.repo |
    $sudo tee /etc/yum.repos.d/fish3.repo
}

install_fzf() {
  git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf
  $HOME/.fzf/install --no-bash --no-zsh --no-completion --no-key-bindings --update-rc
}

install_packages_apt() {
  $sudo apt update && $sudo apt install -y git fish tmux vim curl $@
}

install_packages_dnf() {
  $sudo dnf install -y vim git-core fish tmux curl sqlite util-linux-user $@
}

echo "Installing dependencies"
case "$ID" in
debian)
  install_packages_apt fzf
  ;;
ubuntu)
  install_packages_apt fzf
  ;;
fedora)
  install_packages_dnf fzf
  ;;
rocky)
  add_rhel_repo
  install_packages_dnf fzf
  ;;
centos)
  $sudo dnf install -y epel-release
  install_packages_dnf
  install_fzf
  ;;
esac

# Git settings
git config --global init.defaultbranch master
git config --global user.email "fabiojmendes@gmail.com"
git config --global user.name "Fabio Mendes"
git config --global rebase.autoStash true
git config --global pull.rebase true

# Cfg
echo "Clone cfg repo"
git clone --bare --recursive https://github.com/fabiojmendes/cfg.git $cfg_home/.git
alias cfg="git --git-dir=$cfg_home/.git --work-tree=$HOME"
cfg config --local status.showUntrackedFiles no
# Remove old files
rm -f $HOME/.tmux.conf $HOME/.vimrc $HOME/.toprc
cfg checkout
cfg submodule update --init --remote

echo "Change default shell to fish"
fish=$(which fish)
$sudo chsh -s $fish $USER

# First login setup
$fish -l $cfg_home/first_login.fish
