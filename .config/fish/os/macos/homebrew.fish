# If the homebrew binary exists, source it's shellenv

if test -f /opt/homebrew/bin/brew
  /opt/homebrew/bin/brew shellenv fish | source
end
