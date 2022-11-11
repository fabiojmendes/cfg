#!/usr/bin/env fish

echo "Running fish setup"

#Install fisher
fisher install PatrickF1/fzf.fish

# Cfg
cfg config --local alias.update 'submodule update --remote --merge'
cfg config --local status.showUntrackedFiles no

# Git settings
git config --global init.defaultbranch master
git config --global user.email "fabiojmendes@gmail.com"
git config --global user.name "Fabio Mendes"
git config --global rebase.autoStash true
git config --global pull.rebase true
