# Python
abbr -a -g py python3
abbr -a -g py2 python
abbr -a -g piprun pipenv run python3

# ssh
#abbr -a -g ssh ~/bin/ssh-ident

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
abbr -a -g ls ls -GFho
abbr -a -g lst ls -GFhort #List based on date, in reversed order
abbr -a -g lsa ls -GFhoa #Show all
abbr -a -g lsh "ls -GFhod \.?*" #Show all hidden files, hide folders
abbr -a -g less less -S
abbr -a -g rm rm -ivr
abbr -a -g mv mv -vi
abbr -a -g cp cp -vnr
abbr -a -g tree tree --filelimit 30
abbr -a -g tgz tar -czvf
abbr -a -g utgz tar -xzvf

# Other abbreviations
abbr -a -g efish code $__fish_config_dir/config.fish
abbr -a -g estat code $__fish_config_dir/conf.d/static_abbr.fish
# abbr -a -g sfish 'for f in $__fish_config_dir/conf.d/*; source $f; end' # Source every file in conf.d
abbr -a -g evim nvim ~/.vim/vimrc
abbr -a -g sact source .venv/bin/activate.fish

# Destinations
abbr -a -g fish-dir $__fish_config_dir
abbr -a -g fish-conf code $__fish_config_dir/config.fish
