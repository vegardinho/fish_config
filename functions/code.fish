function code
    set workspace_file (find . -maxdepth 1 -name '*.code-workspace' 2>/dev/null)
    if test -n "$workspace_file"
        open "$workspace_file" -a "Visual Studio Code"
    else
        open "$argv" -a "Visual Studio Code"
    end
end