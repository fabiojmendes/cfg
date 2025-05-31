function cfg --wraps='git --git-dir=$HOME/.local/share/cfg/.git --work-tree=$HOME' --description 'Cfg utils'
    set -l git_args --git-dir=$HOME/.local/share/cfg/.git --work-tree=$HOME
    if [ $argv[1] = update ]
        echo 'Performing cfg update'
        git $git_args pull
        git $git_args submodule update --remote
        fisher update
    else
        git $git_args $argv
    end
end
