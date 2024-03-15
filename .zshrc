export EDITOR="/opt/homebrew/bin/nvim"
export SUDO_EDITOR="/opt/homebrew/bin/nvim"
export KUBE_EDITOR="/opt/homebrew/bin/nvim"

eval "$(starship init zsh)"

export PATH="/opt/homebrew/opt/python@3.12/libexec/bin:$PATH"

zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
autoload -Uz compinit && compinit

export NVM_DIR="$HOME/.nvm"
# Load nvm
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
# Load nvim completion
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/ledmondson/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
