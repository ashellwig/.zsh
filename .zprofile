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

for f in '/etc/profile.d/'; do
  source "${f}"
done

# --- Path ---
# Programs
typeset -U path
path=(
  "${PATH}"
  /bin
  /sbin
  /usr/{bin,sbin}
  /usr/local/{bin,sbin}
  ~/.local/bin    # Locally installed binaries
  ~/.cargo/bin    # Rust
  ~/go/bin        # Go
  ~/.yarn/bin     # Node.js
  ~/anaconda3/bin # Python
  ~/thinkorswim   # ThinkOrSwim (Trading Platform)
  ~/opt/cuda
)
