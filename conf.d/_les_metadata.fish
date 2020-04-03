# Run script that reads new metadata from folders
if not status --is-login
   python3 $__fish_config_dir/conf.d/_les_metadata.py
end
