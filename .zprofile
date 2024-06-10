# vim: set et ft=zsh ts=2 sw=2
####################################################
# .zlogin                                         ##
# @ashellwig                                      ##
# Purpose: Set environment/options for            ##
#    login shells                                 ##
####################################################

# --- Variables ---
# Shell
export ZSH_CONFIG_DIRS="$HOME/.zsh"
export ZDOTDIR="${HOME}/.zsh"

## When using login/interactive shell:
export TERMINFO="${HOME}/.config/terminfo.custom/current.termite.ti"
export TERM=xterm-termite
# SSH
# source "${ZDOTDIR}/settings/ssh-env.zsh"
# Browser
export BROWSER='/usr/bin/google-chrome-stable'
export CHROME_EXECUTABLE="${BROWSER}"
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
  "${PATH}"
  /bin
  /sbin
  /usr/{bin,sbin}
  /usr/local/{bin,sbin}
  /usr/bin/core_perl                # Perl
  /usr/bin/site_perl                # Perl
  /usr/bin/vendor_perl                # Perl
  # ~/anaconda3/bin                   # Python
  ~/.local/bin                      # Locally installed binaries
  ~/.local/bin/scripts              # Locally installed scripts
  ~/.local/bin/scripts/sh
  # ~/go/bin                          # Go
  # ~/.yarn/bin                       # Node.js
  # ~/Android/Sdk/platform-tools # Android Platform Tools
  # /home/ahellwig/Android/Sdk/cmdline-tools/latest/bin
  # ~/.dotnet/tools                   # .NET Core Tools
  # ~/SDKs/flutter/bin                # Flutter Framework SDK Tools
)

# Modifications
# XDG Base Directories
source "${ZDOTDIR}/settings/xdg-user-dirs-settings.zsh"
# Programming
source "${ZDOTDIR}/settings/programmingenvs.zsh"
