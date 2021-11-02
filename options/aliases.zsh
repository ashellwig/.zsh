####################################################
# aliases.zsh                                     ##
# @ashellwig                                      ##
# Purpose: Set-up command aliases                 ##
####################################################

# --- Movement ---
# i3
alias i3r='i3-msg move workspace to output right'
alias i3l='i3-msg move workspace to output left'

# --- System Management ---
# Zsh
alias szs="source ${ZDOTDIR}/.zshrc"
# Systemd
alias -g sc='sudo systemctl'
alias -g scu='systemctl --user'
alias scs='sc status'
alias scus='sc status'
alias scb='sc start'
alias scub='sc start'
alias scstop='sc stop'
alias scustop='sc stop'
alias scd='sc disable'
alias scud='sc disable'
alias sce='sc enable'
alias scue='sc enable'
# Logs
alias -g jc='sudo journalctl'
alias kernellogs="dmesg --human --color=always | tail -f"
# Config getters
alias show_user_tex_config="cat ${HOME}/.zsh/settings/programmingenvs.zsh | sed -n -e '/#\s---\sLaTeX\s---/,/#\s---\sPython\s---/p' | sed 's/#\sexport/export/g' | grep -e '^export'"
# SSH connections

# --- Programs ---
# ls
#alias ls='ls -FBah'
#alias lsa='ls -FBahl'
alias lsa='ls -lFah'

# vim: set et ft=zsh sw=2 ts=2:

