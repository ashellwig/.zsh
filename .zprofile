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
source "${ZDOTDIR}/settings/programmingenvs.zsh"
# Audio Applications
# source "${ZDOTDIR}/settings/audio/daw_env.zsh"
# source "${ZDOTDIR}/settings/audio/ardour.zsh"
# Shell
export ZSH_CONFIG_DIRS="$HOME/.zsh"
export ZDOTDIR="${HOME}/.zsh"
## When using login/interactive shell:
# export TERM=xterm-termite
# export TERMINFO=/usr/share/terminfo
# SSH
source "${ZDOTDIR}/settings/ssh-env.zsh"
# Browser
export BROWSER='/usr/bin/google-chrome-stable'
# Editor
export EDITOR='vim'
export VISUAL='vim'
export VI='vim'
export PAGER='less'

# System-wide profile
# source /etc/profile

# for f in '/etc/profile.d/'; do
#   source "${f}"
# done

# --- Path ---
# Programs
typeset -U path
path=(
  "${PATH}"                           # Predefined $PATH
  /bin                                # System Binary Dir
  /sbin                               # System Sec Binary Dir
  /usr/{bin,sbin}                     # System Sec/Unsec Binary Dir
  /usr/local/{bin,sbin}               # User Sec/Unsec Binary Dir
  /opt/homebrew/bin                   # MacOS Package Manager
  # ~/perl5/bin                       # Perl
  # ~/anaconda3/bin                   # Python
  ~/.local/bin                        # Locally installed binaries
  ~/.local/bin/scripts                # Locally installed scripts
  # ~/.cargo/bin                      # Rust
  # ~/go/bin                          # Go
  # ~/.local/share/TEE-CLC/14.114.0   # Visual Studio Team Services
  # ~/opt/cuda/bin                    # nVidia CUDA Tools
  # ~/.yarn/bin                       # Node.js
  # ~/SDKs/Android/Sdk/platform-tools # Android Platform Tools
  # ~/.dotnet/tools                   # .NET Core Tools
  ~/SDKs/flutter/bin                  # Flutter Framework SDK Tools
  '/opt/homebrew/opt/llvm@13/bin'     # LLVM 13
)
