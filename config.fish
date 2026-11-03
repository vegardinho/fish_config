#Fix for copying utf-8 chars (export LC_ALL=en_US.UTF-8 in bash_profile)
set -gx LC_ALL en_US.UTF-8

#Export options
set -gx PATH /usr/local/sbin $PATH $HOME/.local/bin
#set -Uxa PYTHONPATH ~/Dokumenter/Progging/python-tools/
set -gx TMPDIR /tmp

#For python scripts requirering this variable 
set -Ux FISH_DIR $__fish_config_dir

#Configure restic
set -x RESTIC_PASSWORD_FILE ~/.restic_pswd
set -x RESTIC_REPOSITORY /mnt/SGT_500GB

#Start fish ssh agent
fish_ssh_agent

## SEE conf.d FOLDER FOR OTHER AUTO-LOADED CONFIGS, ##
## AND functions FOLDER FOR FUNCTIONS ##

# Set starship to manage prompts
starship init fish | source
