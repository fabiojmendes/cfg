#!/bin/sh

set -eu

add_rhel_repo() {
  curl -fsSL https://download.opensuse.org/repositories/shells:fish:release:3/CentOS-9_Stream/shells:fish:release:3.repo |
    sudo tee /etc/yum.repos.d/fish3.repo
}

install_packages_apt() {
  sudo apt update && sudo apt install -y git fish tmux vim $@
}

install_packages_dnf() {
  sudo dnf install -y vim git-core fish tmux util-linux-user $@
}

install_dependencies() {
  echo "Installing dependencies"
  . /etc/os-release
  case "$ID" in
  debian | ubuntu)
    install_packages_apt
    ;;
  rocky | centos | almalinux)
    add_rhel_repo
    sudo dnf install -y epel-release
    install_packages_dnf tar
    ;;
  fedora)
    install_packages_dnf
    ;;
  *)
    echo "Distro $ID not supported"
    exit 1
    ;;
  esac
}

sudo_no_reset() {
  # Sudo no reset
  echo "Install sudo preferences for $USER"
  NO_RESET=$(mktemp)
  cat >$NO_RESET <<EOF
Defaults:$USER !env_reset
Defaults:$USER !always_set_home
EOF

  if ! /usr/sbin/visudo -c $NO_RESET; then
    exit 1
  fi
  sudo install -o root -g root --mode 440 $NO_RESET /etc/sudoers.d/99-no-reset
}

configure_git() {
  # Git settings
  git config --global init.defaultbranch master
  git config --global user.email "fabiojmendes@gmail.com"
  git config --global user.name "Fabio Mendes"
  git config --global rebase.autoStash true
  git config --global pull.rebase true
}

echo "Installing shell cfg"
cfg_home=$HOME/.local/share/cfg
if [ -d $cfg_home ]; then
  echo "cfg already installed"
  exit 1
fi

sudo_no_reset
install_dependencies
configure_git

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
sudo chsh -s $fish $USER

# First login setup
$fish -l $cfg_home/first_login.fish
