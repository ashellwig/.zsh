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
alias scs='sc status'
alias scb='sc start'
alias scstop='sc stop'
alias scd='sc disable'
alias sce='sc enable'
# Logs
alias -g jc='sudo journalctl'
alias kernellogs="dmesg --human --color=always --follow | most"

# --- Programs ---
# Pacman
alias blackarch-categories='sudo pacman -Sg | grep blackarch'
# ls
alias -g ls='ls -FA --group-directories-first --color=always'
alias lsa='ls -lh'

# vim: set et ft=zsh sw=2 ts=2: