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
#if [[ -d "${HOME}/go" ]]; then
#  export GOPATH="$HOME/go"
#fi


# --- Node ---
# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"


# --- Ruby ---
# RVM
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# vim: set et ts=2 sw=2 ft=zsh:
