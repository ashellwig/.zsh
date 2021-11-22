# vim: set et ft=zsh ts=2 sw=2
####################################################
# .zlogin                                         ##
# @ashellwig                                      ##
# Purpose: Set environment/options for            ##
#    login shells                                 ##
####################################################

# --- Variables ---
# XDG Base Directories
# source "${ZDOTDIR}/settings/xdg-user-dirs-settings.zsh"
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
# source "${ZDOTDIR}/settings/ssh-env.zsh"
# Browser
# export BROWSER='/usr/bin/google-chrome-stable'
# Editor
export EDITOR='vim'
export VISUAL='vim'
export VI='vim'
export PAGER='less'

# System-wide profile
if [[ -e '/etc/profile' ]]; then
  source /etc/profile

  if [[ -d '/etc/profile.d' ]]; then
    for f in '/etc/profile.d/'; do
      source "${f}"
    done
  fi
fi

# --- Path ---
# Programs
typeset -U path
path=(
  "${PATH}"                                     # PATH sourced previously
  /bin                                          # System binaries
  /sbin                                         # System secure binaries
  /usr/{bin,sbin}                               # System user binaries
  /usr/local/{bin,sbin}                         # System user local binaries
  # /usr/local/texlive/2021/bin/universal-darwin  # TeXLive/MacTeX
  /opt/homebrew/bin
  /opt/homebrew/sbin
  # /opt/homebrew/opt/llvm@13/bin                 # LLVM 13
  # ~/perl5/bin                                   # Perl
  # ~/anaconda3/bin                               # Python
  # ~/.local/bin                                  # Locally installed binaries
  # ~/.local/bin/scripts                          # Locally installed scripts
  # ~/SDKs/flutter/bin                            # Flutter Framework SDK Tools
  #~/.cargo/bin                                 # Rust
  #~/go/bin                                     # Go
  #~/.local/share/TEE-CLC/14.114.0              # Visual Studio Team Services
  #~/opt/cuda/bin                               # nVidia CUDA Tools
  #~/.yarn/bin                                  # Node.js
  #~/SDKs/Android/Sdk/platform-tools            # Android Platform Tools
  #~/.dotnet/tools                              # .NET Core Tools
)

