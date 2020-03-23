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
# SSH connections
alias sshi='TERM=xterm-256color ssh -p22 $1'

# --- Programs ---
# ls
alias ls='ls -FA --group-directories-first --color=always'
alias lsa='ls -FAhl --group-directories-first --color=always'

# vim: set et ft=zsh sw=2 ts=2:
