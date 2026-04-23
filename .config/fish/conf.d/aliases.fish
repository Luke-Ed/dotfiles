# Simple Aliases
alias nv=nvim

if status is-interactive && ls --color / >/dev/null 2>&1
  alias ls='ls --color'
end
