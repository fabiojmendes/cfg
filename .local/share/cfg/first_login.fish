#!/usr/bin/env fish

echo "Executing first login configs"

curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
fisher install PatrickF1/fzf.fish

# Configure git prompt
set -U __fish_git_prompt_showcolorhints
set -U __fish_git_prompt_showdirtystate
set -U __fish_git_prompt_showuntrackedfiles
set -U __fish_git_prompt_show_informative_status
