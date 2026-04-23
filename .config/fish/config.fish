fish_add_path "$HOME/.local/bin"

switch (uname)
  case Darwin
    set -l macos_fish_configs "$__fish_config_dir/os/macos"
    source $macos_fish_configs/*.fish
  case Linux
    source "$HOME/.config/fish/os/linux.fish"
end

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
set --export --prepend PATH "/Users/ledmondson/.rd/bin"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
