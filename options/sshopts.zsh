####################################################
# sshopts.zsh                                     ##
# @ashellwig                                      ##
# Purpose: Set-up SSH connection options          ##
####################################################

# Only one SSH Agent Running
# if ! pgrep -u "$USER" ssh-agent > /dev/null; then
#   ssh-agent > ~/.ssh/.ssh-agent
# fi
# if [[ "$SSH_AGENT_PID" == "" ]]; then
#   eval "$(~/.ssh/.ssh-agent)"
# fi

# vim: set et ts=2 sw=2 ft=zsh: