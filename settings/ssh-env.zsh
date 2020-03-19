# vim: set et ts=2 sw=2 ft=zsh c
###################################################
# File: .zsh/settings/ssh-env.zsh
#
# Author: Ashton Hellwig <ahellwig.dev@gmail.com>
#
# Description:
# Set TERM as readily-available spec when
# connecting to remote machine with SSH
# protocol
#
# Globals:
#   TERM is the the name of the compiled
#     TERMINFO file located in the
#     "${TERMINFO}" directory.
###################################################

if [[ -n "$SSH_TTY" ]] \
  || [[ -n "$SSH_CONNECTION" ]] \
  || [[ -n "$SSH_CLIENT" ]]; then

  export TERM='xterm-256color'
fi
