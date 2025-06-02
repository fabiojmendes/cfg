function cfg --wraps='git --git-dir=$HOME/.local/share/cfg/.git --work-tree=$HOME' --description 'Cfg utils'
    set -l git_args --git-dir=$HOME/.local/share/cfg/.git --work-tree=$HOME
    if [ $argv[1] = update ]
        echo 'Performing cfg update'
        git $git_args pull --recurse-submodules
        fisher update
    else if [ $argv[1] = fix-detached ]
        echo 'Fixing detached submodules'
        git $git_args submodule sync --recursive
        git $git_args submodule update --init --recursive
        git $git_args submodule foreach 'git switch master || git switch main'
        git $git_args pull --recurse-submodules
    else
        git $git_args $argv
    end
end
