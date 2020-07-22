# Fix for copying utf-8 chars (export LC_ALL=en_US.UTF-8 in bash_profile)
set -gx LC_ALL en_US.UTF-8

set theme_color_scheme gruvbox

#BobTheFish settings
set -g theme_date_timezone Europe/Oslo

# Quick tmp
function tmp
    cd $HOME/Development/.tmp
    set -lx TMP_PATH_NAME (date +"%d-%m-%Y_%T")
    mkdir $TMP_PATH_NAME
    cd $TMP_PATH_NAME
    set_color yellow
    echo "Created temporary directory "$TMP_PATH_NAME
    set_color normal
end

# Git abbreviations
abbr -a -g g git
abbr -a -g ga git add
abbr -a -g gaa git add --all
abbr -a -g gcmsg git commit -m
abbr -a -g gc git commit -m
abbr -a -g gp git push
abbr -a -g gl git pull
abbr -a -g glm git pull origin master
abbr -a -g gst git status --short
abbr -a -g glog git log --oneline --decorate --color --graph
abbr -a -g gco git checkout
abbr -a -g gba git branch -a
abbr -a -g gb git branch
abbr -a -g gcm git checkout master
abbr -a -g gd git diff
abbr -a -g gclone git clone
abbr -a -g git_dow "curl -s https://api.github.com/repos/vegardinho/alfred_bluetooth_controller/releases | egrep '\"name\"|\"download_count\"'"
abbr -a -g git_dow_tot "curl -s https://api.github.com/repos/vegardinho/alfred_bluetooth_controller/releases | egrep 'download_count'  | cut '-d:' -f 2 | sed 's/,/+/' | xargs echo | xargs -I N echo N 0  | bc"

# Basic functions abbreviations
abbr -a -g ls ls -GFhotr
abbr -a -g lsa ls -GFhotra
abbr -a -g lsh "ls -GFhotrd \.?*"
abbr -a -g rm rm -ivr
abbr -a -g mv mv -vi
abbr -a -g cp cp -vnr
abbr -a -g tgz tar -czvf
abbr -a -g utgz tar -xzvf

# Other abbreviations
abbr -a -g efish nvim $__fish_config_dir/config.fish
abbr -a -g sfish source $__fish_config_dir/config.fish
abbr -a -g sabbr "python3 $__fish_config_dir/conf.d/_les_metadata.py; source $__fish_config_dir/conf.d/file_abbr.fish"
abbr -a -g vim nvim
abbr -a -g evim nvim ~/.vimrc
abbr -a -g sact source bin/activate.fish

# Mount samba samfundet/ku
## TODO: make tmp folder instead (sjekk om eksisterer først)
function mku $argv
    set chd false
    set path ""
    set_color red
   
    if test $argv && test $argv = w
        set path //vegalan@samba.samfundet.no/ku
    else
        set path //vegalan@samba.samfundet.no/ku-web
    end
       mount_smbfs $path ~/networkshare 
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

function um
    set_color yellow
    if test $PWD = "/Users/vegardlandsverk/networkshare"
        cd
        printf "Changed directory to ~\n"
    end
    umount ~/networkshare 
    printf "Successfully disconnected from samba.samfundet.no"
end

# Destinations
abbr -a -g fish_dir $__fish_config_dir
abbr -a -g fish_conf code $__fish_config_dir/config.fish

# Quick directory jump
function save
    set -U fish_tmp_save_dir $PWD
    set_color yellow
    printf "Saved directory pointer" 
    set_color normal
end

function back
    cd $fish_tmp_save_dir
end

# Python
abbr -a -g py python3
abbr -a -g pip pip3
abbr -a -g py2 python
abbr -a -g pip2 pip
