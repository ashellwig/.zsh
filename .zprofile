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
export ZDOTDIR="$HOME/.zsh"
## When using login/interactive shell:
export TERM='xterm-256color'
# Editor
export EDITOR='vim'
export VISUAL='vim'
export VI='vim'
export PAGER='less'

# System-wide profile
source /etc/profile

SYS_PATH=(
  /bin
  /sbin
  /usr/{bin,sbin,games}
  /usr/local/{bin,sbin,games}
)

# --- Path ---
# Programs
typeset -U path
path=(
  "${SYS_PATH[@]}"
  ~/.local/bin # Locally installed binaries
  # ~/.cargo/bin                      # Rust
  # ~/SDKs/emsdk                      # Emscripten SDK
  # ~/go/bin                          # Go
  # ~/.yarn/bin                       # Node.js
  # ~/anaconda3/bin                   # Python
  # ~/SDKs/Android/Sdk/platform-tools # Android Platform Tools
  # ~/SDKs/flutter/bin                # Flutter Framework SDK Tools
  # ~/.dotnet/tools                   # .NET Core Tools
)
