#Unmount networkshare (for example due to mku command)
function um
    set_color yellow
    if test $PWD = "/Users/vegardlandsverk/networkshare"
        cd
        printf "Changed directory to ~\n"
    end
    umount ~/networkshare 
    printf "Successfully disconnected from samba.samfundet.no"
end