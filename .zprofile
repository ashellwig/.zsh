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
export TERM=xterm-termite
export TERMINFO=/usr/lib/terminfo
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
    ~/.local/bin                    # Locally installed binaries
    ~/perl5/bin                     # Perl5
    ~/.cargo/bin                    # Rust
    ~/go/bin                        # Go
    ~/.yarn/bin                     # Node.js
    ~/SDKs/flutter/bin              # Flutter
    ~/anaconda3/bin     	    # Python
    ~/.aspera/connect/bin           # aspera
    # /opt/cuda/bin                   # Cuda
    # /opt/cuda/NsightCompute-2019.1  # Cuda
    # ~/.dotnet/tools   # .NET
    # "$(ruby -e 'puts Gem.user_dir')/bin"  # RubyGems
)

