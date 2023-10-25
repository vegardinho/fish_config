#Add fish tag to dynamic abbreviation file
function fish-tags $argv
    set print_val (python3 $__fish_config_dir/custom_scripts/add_tag_new.py $PWD $argv)
    set ret_val $status

    if [ $ret_val -eq 50 ]
        set_color yellow
        echo "Successfully deleted tags "(set_color green)(cat $TMPDIR/fish_tags.txt)(set_color yellow)" for directory "(set_color green)"\""$PWD"\""(set_color yellow)"."
        return
    else if [ $ret_val -eq 20 ]
        # Get list of tags from tmp file (stored by python script)
        echo (set_color yellow)"Fish tags "(set_color green)(cat $TMPDIR/fish_tags.txt)(set_color yellow)" stored for directory"\
            (set_color green)""$PWD""(set_color yellow)
        set_color green
    else if [ $ret_val -eq 10 ]
        echo (set_color red)"Valid use:"(set_color yellow)\n\
        "fish-tags [options]"\n\n\
        "-a -add"\t"TAGS"\t\t"adds specified tags"\n\
        "-d -delete"\t"TAGS"\t\t"deletes specified tags"\n\
        \t\t"--all"\t\t"deletes all tags"\n\
        "-l -list"\t\t\t"lists all tags for current directory"
    else if [ $ret_val -eq 0 ]
        source $__fish_config_dir/conf.d/dynamic_abbr.fish
        set_color yellow
        echo "Successfully added tag(s) "(set_color green)(cat $TMPDIR/fish_tags.txt) (set_color yellow)for folder (set_color green)$PWD
        return
    else
        set_color red
        echo "Oops, something went wrong." 
    end

end
