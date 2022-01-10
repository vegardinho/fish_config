#Add fish tag to dynamic abbreviation file
function fish_tags $argv
    set ret_val (python3 /Users/vegardlandsverk/.config/fish/custom_scripts/add_tag.py $PWD $argv)
    if [ $ret_val -ne 0 ]
        set_color red
        echo "Please provide at least one tag." 
        return
    end

    source /Users/vegardlandsverk/.config/fish/conf.d/file_abbr.fish
    
    echo (set_color yellow)"Successfully added tag(s) " (set_color green)"\""$argv"\"" (set_color yellow)for folder (set_color green)$PWD
end