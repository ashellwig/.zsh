####################################################
# aliases.zsh                                     ##
# @ashellwig                                      ##
# Purpose: Set-up command aliases                 ##
####################################################

# --- Colors ---
# ls
alias ls="ls -lFah --color=always"
alias newestdir="ls -ld *(/om[1])"
# dmesg
alias kernellogs="dmesg --human --color=always | most"
# Testing TermCap
alias textef="printf $(cat <<END
"[4;31mUnderline[0m
[3;32mItalic[0m
[1;33mBold[0m
[0;35mPurple[0m"
END
)"

# --- Movement ---
# i3
alias i3r="i3-msg move workspace to output right"
alias i3l="i3-msg move workspace to output left"

# --- System Management ---
# Zsh
alias szs="source ~/.zsh/.zshrc"

alias jc="sudo journalctl | most"

# System

# systemaliases() {
#  local systemone="$(sysvinit)"
#  local system2="$(systemd)"
#  if [[ -n "$systemone" ]] || if [[ -n "$system2"]]; then
#
#}
#systemaliases
#unfunction sustemaliases
