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

if [[ "$(uname -s)" == 'Darwin' ]] \
  && [[ "$(whoami)" == 'ashwig-personal' ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# --- Path ---
# Programs
typeset -U path
path=(
  /opt/homebrew/opt/openssl@3/bin               # OpenSSL
  ~/opt/anaconda3/bin                           # Python
  ~/opt/anaconda3/envs/bargen_env/bin           # Python (bargen_env)
  "${PATH}"                                     # PATH sourced previously
  /bin                                          # System binaries
  /sbin                                         # System secure binaries
  /usr/{bin,sbin}                               # System user binaries
  /usr/local/{bin,sbin}                         # System user local binaries
  ~/.local/bin                                  # Locally installed binaries
  ~/.local/bin/scripts                          # Locally installed scripts
)
