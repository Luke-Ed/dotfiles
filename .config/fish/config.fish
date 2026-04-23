fish_add_path "$HOME/.local/bin"

switch (uname)
  case Darwin
    source "$HOME/.config/fish/os/macos.fish"
  case Linux
    source "$HOME/.config/fish/os/linux.fish"
end

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
set --export --prepend PATH "/Users/ledmondson/.rd/bin"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
