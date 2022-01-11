#Add fish tag to dynamic abbreviation file
function fish_tags $argv
    set print_val (python3 /Users/vegardlandsverk/.config/fish/custom_scripts/add_tag_new.py $PWD $argv)
    set ret_val $status
    if [ $ret_val -eq 10 ]
        set_color red
        echo "Please provide at least one tag." 
        return
    else if [ $ret_val -eq 50 ]
        set_color red
        echo "Successfully deleted all tags for directory "(set_color yellow)"\""$PWD"\""(set_color yellow)"."
        return
    else if [ $ret_val -ne 0 ]
        set_color red
        echo "Oops, something went wrong." 
        return
    end

    source /Users/vegardlandsverk/.config/fish/conf.d/dynamic_abbr.fish
    echo (set_color yellow)"Successfully added tag(s) " (set_color green)"\""$argv"\"" (set_color yellow)for folder (set_color green)$PWD
end