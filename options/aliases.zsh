####################################################
# aliases.zsh                                     ##
# @ashellwig                                      ##
# Purpose: Set-up command aliases                 ##
####################################################

# --- Colors ---
# ls
alias ls='ls -lFah --color=always'
alias newestdir="ls -ld *(/om[1])"
# dmesg
alias kernellogs="dmesg --human --color=always | most"
# Testing TermCap
alias textef="printf $(cat <<END
"\033[4;31mUnderline\033[0m
\033[3;32mItalic\033[0m
\033[1;33mBold\033[0m
\033[0;35mPurple\033[0m"
END
)"

# --- Movement ---
# i3
alias i3r='i3-msg move workspace to output right'
alias i3l='i3-msg move workspace to output left'

# --- System Management ---
# Zsh
alias -g szs="source ${ZDOTDIR}/.zshrc"
alias -g sc='sudo systemctl'
alias -g jc='sudo journalctl'

# vim: set et ft=zsh sw=2 ts=2:
