# Greeting
function fish_greeting 
   printf "\033c"
end

# Real clear
function new
    source $__fish_config_dir/config.fish
    fish_greeting
end

# Autocomplete test
# complete -c myprog -a "~/Documents/Progging"
# complete -c myprog -a "yes no"

# Fix for å kunne kopiere utf-8-tegn (tidligere export LC_ALL=en_US.UTF-8 i bash_profile)
set -gx LC_ALL en_US.UTF-8

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
abbr -a -g rm rm -iv
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
## TODO: lage tmp networkshare og slett etterpå (sjekk om eksisterer først)
function mku
   mount_smbfs //vegalan@samba.samfundet.no/ku ~/networkshare 
   set_color yellow
   printf "Successfully connected to samba.samfundet.no/ku\n"
   cd ~/networkshare
   printf "Changed directory to ~/networkshare"
end

function um
   if test $PWD = "/Users/vegardlandsverk/networkshare"
      cd
      printf "Changed directory to ~\n"
   end
   umount ~/networkshare 
   set_color yellow
   printf "Successfully disconnected from samba.samfundet.no"
end

function mkw
   mount_smbfs //vegalan@samba.samfundet.no/ku-web ~/networkshare 
   set_color yellow
   printf "Successfully connected to samba.samfundet.no/ku\n"
   cd ~/networkshare
   printf "Changed directory to ~/networkshare"
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

function save2
    set -U fish_tmp_save_dir2 $PWD
    set_color yellow
    printf "Saved"
    set_color normal
end

function back2
    cd $fish_tmp_save_dir2
end

function back
    cd $fish_tmp_save_dir
end

# Python
abbr -a -g py python3
abbr -a -g pip pip3
abbr -a -g py2 python
abbr -a -g pip2 pip

# Python scripts manager
function mypy 
    if test (count $argv) = 0 || test $argv[1] = "-l"
        if test -e $__fish_config_dir/mypy/".list.py"
            python3 $__fish_config_dir/mypy/".list.py"
        else
            set_color green
            echo '-------------------------'
            set_color red
            ls $__fish_config_dir/mypy
            set_color green
            echo '-------------------------'
            set_color normal
        end
    else if test $argv[1] = "-h"
        set_color green
        echo "  Usage"
        set_color yellow
        echo '  run     mypy <name>'
        echo '  add     mypy -a <file>'
        echo '  new     mypy -n <name>'
        echo '  edit    mypy -e <name>'
        echo '  rename  mypy -r <name> <new_name>'
        echo '  open    mypy -o'
        echo '  list    mypy -l'
        set_color normal
    else if test $argv[1] = "-e"
        if test (count $argv) = 2
            if test -e $__fish_config_dir/mypy/$argv[2]".py"
                code $__fish_config_dir/mypy/$argv[2]".py"
                set_color green
                echo "Script opened in code."
                set_color normal
            else
                set_color red
                echo "File not found."
                set_color normal
            end
        else
            set_color yellow
            echo "Usage: mypy -e <name>"
            set_color normal
        end
    else if test $argv[1] = "-a"
        if test (count $argv) = 2
            if test -e $argv[2]
                if test -e $__fish_config_dir/mypy/$argv[2]
                    set_color red
                    echo "Name already in use."
                    set_color normal
                else
                    cp $argv[2] $__fish_config_dir/mypy/
                    set_color green
                    echo "Script added to mypys."
                    set_color normal
                end
            else
                set_color red
                echo "File not found."
                set_color normal
            end
        else
            set_color yellow
            echo "Usage: mypy -a <file>"
            set_color normal
        end
    else if test $argv[1] = "-n"
        if test (count $argv) = 2
            if test -e $__fish_config_dir/mypy/$argv[2]".py"
                set_color red
                echo "Name already exists."
                set_color normal
            else
                touch $__fish_config_dir/mypy/$argv[2]".py"
                set_color green
                echo "Created new mypy script."
                set_color normal
                code $__fish_config_dir/mypy/$argv[2]".py"
            end
        else
            set_color yellow
            echo "Usage: mypy -n <name>"
            set_color normal
        end
    else if test $argv[1] = "-r"
        if test (count $argv) = 3
            if test -e $__fish_config_dir/mypy/$argv[2]".py"
                if test -e $__fish_config_dir/mypy/$argv[3]".py"
                    set_color red
                    echo "Name already exists."
                    set_color normal
                else
                    mv $__fish_config_dir/mypy/$argv[2]".py" $__fish_config_dir/mypy/$argv[3]".py"
                    set_color green
                    echo "Renamed script."
                    set_color normal
                end
            else
                set_color red
                echo "Script not found."
                set_color normal
            end
        else
            set_color yellow
            echo "Usage: mypy -r <name> <new_name>"
            set_color normal
        end
    else if test $argv[1] = "-o"
        open $__fish_config_dir/mypy/
    else
        if test -e $__fish_config_dir/mypy/$argv[1]".py"
            python3 $__fish_config_dir/mypy/$argv[1]".py" $argv[2..-1]
        else
            set_color red
            echo "Script not found."
            set_color normal
        end
    end
end



set theme_color_scheme gruvbox
