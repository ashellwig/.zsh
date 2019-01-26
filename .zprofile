# vim: set et ft=zsh ts=2 sw=2
####################################################
# .zlogin                                         ##
# @ashellwig                                      ##
# Purpose: Set environment/options for            ##
#    login shells                                 ##
####################################################

# --- Variables ---
# XDG Base Directories
source "${ZDOTDIR}/settings/xdg-user-dirs-settings.zsh"
# Programming
source ${ZDOTDIR}/settings/programmingenvs.zsh
# Shell
export ZSH_CONFIG_DIRS="$HOME/.zsh"
export ZDOTDIR="${HOME}/.zsh"
# Browser
export BROWSER='/bin/google-chrome-stable'
# Editor
export EDITOR='vim'
export VISUAL='vim'
export VI='vim'
export PAGER='less'

# System-wide profile
source /etc/profile

# --- Path ---
# Programs
typeset -U path
path=(
    "${PATH}"
    /bin
    /sbin
    /usr/{bin,sbin}
    /usr/local/{bin,sbin}
    ~/.local/bin
    ~/perl5/bin         # Perl 5
    ~/.cargo/bin        # Rust
    ~/go/bin            # Go
    ~/anaconda3/bin     # Python
    ~/.yarn/bin         # Node.js
    ~/SDKs/flutter/bin  # Flutter
    # ~/.dotnet/tools   # .NET
)

