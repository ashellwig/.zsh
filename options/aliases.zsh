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
alias -g pa='sudo pacman'
alias pas='pa -Ss'
alias pai='pa -S'
alias blackarch-categories='sudo pacman -Sg | grep blackarch'
# ls
alias ls='ls -Af --color=always'
alias lsa='ls -lFAh --color=always'
# Parity
if [[ -d $HOME/parity/target/release ]]; then
  alias start-parity='parity --mode=active --min-peers=25 --max-peers=99'
fi

# vim: set et ft=zsh sw=2 ts=2:
