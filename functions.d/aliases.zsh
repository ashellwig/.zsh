####################################################
# aliases.zsh                                     ##
# @ashellwig                                      ##
# Purpose: Set-up command aliases                 ##
####################################################

# --- Colors ---
# ls
alias ls="ls -lFah --color=always"
# dmesg
alias kernellogs="dmesg --human --color=always | most"

# --- Movement ---
# i3
alias i3r="i3-msg move workspace to output right"
alias i3l="i3-msg move workspace to output left"

# --- System Management ---
# Zsh
alias szs="source ~/.zsh/.zshrc"
# Arch
alias sc="systemctl"
alias jc="journalctl | most"
alias textef="echo -e \"[4;31mUnderline[0m [3;32mItalic[0m [1;33mBold[0m [0;35mPurple[0m\""
