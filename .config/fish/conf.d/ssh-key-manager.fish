set -l SSH_KEY_PATH "$HOME/.ssh/"(hostname -s)

if not test -f "$SSH_KEY_PATH"
  echo "No SSH Key at path: $SSH_KEY_PATH" >&2
  return 127
end

set -l agent_env ~/.ssh/agent.env

function agent_load_env
    if test -f $agent_env
        source $agent_env > /dev/null
    end
end

function agent_start
    umask 077
    ssh-agent > $agent_env
    source $agent_env > /dev/null
end

agent_load_env

# agent_run_state: 0=agent running w/ key; 1=agent w/o key; 2=agent not running
set -l agent_run_state (ssh-add -l > /dev/null 2>&1; echo $status)

if test -z "$SSH_AUTH_SOCK"; or test $agent_run_state -eq 2
    agent_start
    ssh-add "$SSH_KEY_PATH"
else if test -n "$SSH_AUTH_SOCK"; and test $agent_run_state -eq 1
    ssh-add "$SSH_KEY_PATH"
end

