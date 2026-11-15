function lsh
    # Find all hidden items (files or directories) in the current directory (not recursive)
    set hidden_items (find . -maxdepth 1 -mindepth 1 -name ".*" 2> /dev/null)

    if test (count $hidden_items) -eq 0
        set_color red
        echo "No hidden files or directories"
        set_color normal
    else
        # Use ls to display nicely formatted list
        ls -lhAd --color=always $hidden_items
    end
end

