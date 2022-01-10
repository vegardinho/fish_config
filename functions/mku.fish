# Mount samba samfundet/ku
## TODO: make tmp folder instead (sjekk om eksisterer først)
function mku $argv
    set chd false
    set path ""
    set_color red
    set pwd (security 2>&1 >/dev/null find-internet-password -s samba.samfundet.no \                                                                         Wed Aug 12 00:30:02 2020 |ruby -e 'print $1 if STDIN.gets =~ /^password: "(.*)"$/')
    echo $pwd
   
    if test $argv && test $argv = w
        set path //vegalan@samba.samfundet.no/ku-web
    else
        set path //vegalan@samba.samfundet.no/ku
    end
       mount_smbfs $path ~/networkshare 
       echo $pwd
    set ret_val $status

    set_color yellow
    if test $ret_val = 0
    	printf "Successfully connected to %s.\n" $path 
    	set chd true
    else if test $ret_val = 64
	    set chd true
	    printf "Already connected.\n"
    end

    if test $chd = true
	    cd ~/networkshare
        printf "Changing directory to ~/networkshare"
    end
end