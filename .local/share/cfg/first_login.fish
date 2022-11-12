#!/usr/bin/env fish

echo "Executing first login configs"

curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
fisher install PatrickF1/fzf.fish
