#!/usr/bin/env fish

echo "Executing first login configs"

curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
fisher install PatrickF1/fzf.fish

# Configure git prompt
set -U __fish_git_prompt_showcolorhints 1
set -U __fish_git_prompt_showdirtystate 1
set -U __fish_git_prompt_showuntrackedfiles 1
set -U __fish_git_prompt_show_informative_status 1
