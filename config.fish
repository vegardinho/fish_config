#Fix for copying utf-8 chars (export LC_ALL=en_US.UTF-8 in bash_profile)
set -gx LC_ALL en_US.UTF-8

#Export options
set -gx PATH "/usr/local/sbin:$PATH"
set -gx PATH "$PATH:/home/pi/.config/fish/config.fish"
set -gx PATH "$PATH:/home/pi/.local/bin"
set -gx PYTHON_TOOLS ~/Documents/python-tools
#set -gx PYTHONPATH "~/Documents/python-tools:$PYTHONPATH"


#Set color theme
set theme_color_scheme gruvbox

#BobTheFish settings
set -g theme_date_timezone Europe/Oslo

#For python scripts requirering this variable 
set -Ux FISH_DIR $__fish_config_dir


## SEE conf.d FOLDER FOR OTHER AUTO-LOADED CONFIGS, ##
## AND functions FOLDER FOR FUNCTIONS ##
