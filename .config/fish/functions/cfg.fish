function cfg --wraps='git --git-dir=$HOME/.local/share/cfg --work-tree=$HOME' --description 'alias cfg=git --git-dir=$HOME/.local/share/cfg --work-tree=$HOME'
    set -l git_args --git-dir=$HOME/.local/share/cfg --work-tree=$HOME
    if [ $argv[1] = 'update' ]
        echo 'Performing cfg update'
        git $git_args pull
        git $git_args submodule update --remote --merge
    else
        git $git_args $argv
    end
end 
