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
# export TERMINFO="${HOME}/.config/terminfo.custom/custom.termite.ti"
# export TERM=xterm-termite
# SSH
# source "${ZDOTDIR}/settings/ssh-env.zsh"
# Browser
export BROWSER='/Applications/Google Chrome.app'
export CHROME_EXECUTABLE="${BROWSER}"
# Editor
export EDITOR='vim'
export VISUAL='vim'
export VI='vim'
export PAGER='less'

# System-wide profile
# if [[ -e '/etc/profile' ]]; then
#   source /etc/profile

#   if [[ -d '/etc/profile.d' ]]; then
#     for f in '/etc/profile.d/'; do
#       source "${f}"
#     done
#   fi
# fi

# --- Path ---
# Modifications
# XDG Base Directories
source "${ZDOTDIR}/settings/xdg-user-dirs-settings.zsh"
# Programming
source "${ZDOTDIR}/settings/programmingenvs.zsh"
# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv zsh)"

# Programs
typeset -U path
path=(
  ~/anaconda3/bin                   # Python
  /bin
  /sbin
  /usr/{bin,sbin}
  /usr/local/{bin,sbin}
  /opt/homebrew/bin                 # MacOS Packages
  ~/.local/bin                      # Locally installed binaries
  ~/.local/bin/scripts              # Locally installed shell scripts
  ~/.local/bin/scripts/sh           # Locally installed shell scripts (sh)
  ~/.local/bin/scripts/zsh          # Locally installed shell scripts (zsh)
  ~/.local/bin/scripts/pwsh         # Locally installed shell scripts (pwsh)
  ~/.zsh/bin                        # zsh scripts
)

