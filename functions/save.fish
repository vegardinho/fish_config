# Quick directory jump
function save
    set -U fish_tmp_save_dir $PWD
    set_color yellow
    printf "Saved directory pointer" 
    set_color normal
end
