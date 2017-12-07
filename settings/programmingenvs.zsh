# programmingenvs.zsh
# @ashellwig
# Purpose: Provide access to package manager attached to
#       programming environments


# --- C/C++ ---
# Compiler Option
export CC=gcc
export CXX=g++


# --- Go ---
# GOPATH
if [[ -d "${HOME}/go" ]]; then
  export GOPATH="$HOME/go"
fi


# --- Node ---
# NVM
export NVM_DIR="$HOME/.nvm"
export NVM_SOURCE="/usr/share/nvm"
[ -s "$NVM_SOURCE/nvm.sh" ] && . "$NVM_SOURCE/nvm.sh"


# --- Ruby ---
# RVM
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# vim: set et ts=2 sw=2 ft=zsh:
