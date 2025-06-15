if status is-interactive
    set -l find_cmd $(which fd fdfind find 2> /dev/null | head -1)
    set -l file_list $($find_cmd -uid 0 | wc -l)

    if test $file_list -ne 0
        echo -e '\n'
        echo "## Found $file_list files with root ownership in your home directory"
        echo "## Use sudo chown $USER:$USER -R $HOME to fix it"
        echo -e '\n'
    end
end
