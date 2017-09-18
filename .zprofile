# vim: set et ft=zsh ts=2 sw=2
####################################################
# .zlogin                                         ##
# @ashellwig                                      ##
# Purpose: Set environment/options for            ##
#    login shells                                 ##
####################################################
emulate zsh

# --- Variables ---
# Terminal
if [[ ! -v ZDOTDIR ]]; then
  if [[ -d ${HOME}/.zsh ]]; then
    export ZDOTDIR=/home/ahellwig/.zsh
  fi
fi
if [[ -n "$(command -v termite)" ]]; then
  export TERM='xterm-termite'
fi
# Browser
export BROWSER='chromium'
# Editor
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/code
export VI='vim'
export PAGER='less'
# Language
if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi
# LESS
export LESS='-F -g -i -M -R -S -w -X -z-4'
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

# --- Path ---
typeset -gU cdpath path
# Directories
cdpath=(
  $cdpath
)
# Programs
path=(
  /usr/local/{bin,sbin}
  ~/.rvm/gems/ruby-2.41/bin
  ~/.rvmbin
  ~/anaconda3/bin
  ~/.cargo/bin
  ~/parity/target/release
  ~/parity/target/release
  ~/.local/bin
  ~/anaconda3/bin
)
export PATH="${path}"
unset cdpath path
