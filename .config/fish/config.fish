fish_add_path "$HOME/.local/bin"

switch (uname)
  case Darwin
    set -l macos_fish_configs "$__fish_config_dir/os/macos"
    for file in $macos_fish_configs/*.fish
      source $file
    end
  case Linux
    source "$__fish_config_dir/os/linux.fish"
end
