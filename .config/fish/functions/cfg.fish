function cfg --wraps='git --git-dir=$HOME/.local/share/cfg/.git --work-tree=$HOME' --description 'Cfg utils'

    set -l git_args --git-dir=$HOME/.local/share/cfg/.git --work-tree=$HOME

    switch $argv[1]
        case install
            git $git_args config --local status.showUntrackedFiles no
            git $git_args submodule update --init --remote
            _cfg_vim_tags
            _cfg_install
        case update
            echo 'Performing cfg update'
            git $git_args pull --recurse-submodules
            _cfg_vim_tags
            fisher update
        case fix-detached
            echo 'Fixing detached submodules'
            git $git_args submodule sync --recursive
            git $git_args submodule update --init --recursive
            git $git_args submodule foreach 'git switch master || git switch main'
            git $git_args pull --recurse-submodules
        case '*'
            git $git_args $argv
    end
end

function _cfg_install
    if functions -q fisher
        fisher update
    else
        echo "Installing fisher"
        curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
        fisher install PatrickF1/fzf.fish
    end

    # Configure git prompt
    set -U __fish_git_prompt_showcolorhints 1
    set -U __fish_git_prompt_showdirtystate 1
    set -U __fish_git_prompt_showuntrackedfiles 1
    set -U __fish_git_prompt_show_informative_status 1
end

function _cfg_vim_tags
    echo "Update vim tags"
    vim -e -c "helptags ALL" -c q >/dev/null || true
end
