if status is-interactive
    set -l FIND $(which fd fdfind find | head -1)
    set -l FILES $($FIND -uid 0 | wc -l)

    if test $FILES -ne 0
        echo -e '\n'
        echo "## Found $FILES files with root ownership in your home directory"
        echo "## Use sudo chown $USER:$USER -R $HOME to fix it"
        echo -e '\n'
    end
end
