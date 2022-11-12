#!/usr/bin/env fish

#First login script
if set -q __cfg_first_login
  return
end

echo "Executing fisrt login configs"
set -U __cfg_first_login

curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
fisher install PatrickF1/fzf.fish
