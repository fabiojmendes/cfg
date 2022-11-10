#!/usr/bin/env fish

echo "Running fish setup"

#Install fisher
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
fisher install PatrickF1/fzf.fish
