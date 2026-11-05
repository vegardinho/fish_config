#Fix for copying utf-8 chars (export LC_ALL=en_US.UTF-8 in bash_profile)
set -gx LC_ALL en_US.UTF-8

#Export options
set -gx PATH $HOME/.local/bin /usr/local/sbin $PATH
#set -Uxa PYTHONPATH ~/Dokumenter/Progging/python-tools/
set -gx TMPDIR /tmp

#For python scripts requirering this variable 
set -Ux FISH_DIR $__fish_config_dir

#Configure restic
set -x RESTIC_PASSWORD_FILE ~/.restic_pswd

#Start fish ssh agent
fish_ssh_agent

## SEE conf.d FOLDER FOR OTHER AUTO-LOADED CONFIGS, ##
## AND functions FOLDER FOR FUNCTIONS ##

# Always run shells as tmux sessions, either existing or new
tmux new-session -A

# Set starship to manage prompts
starship init fish | source
