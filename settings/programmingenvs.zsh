# programmingenvs.zsh
# @ashellwig
# Purpose: Provide access to package manager attached to
#       programming environments

# --- WebAssembly ---
# EMSDK
# Source the EMSDK Environment
alias emsenv="source ${HOME}/SDKs/emsdk/emsdk_env.sh --release"

# --- C/C++ ---
# Compiler Option
#export CC=gcc
#export CXX=g++


# --- Go ---
# GOPATH
export GOPATH="$HOME/go"


# --- Node ---
# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# --- Ruby ---
# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"


# --- Python ---
# pip zsh completion
function _pip_completion {
  local words cword
  read -Ac words
  read -cn cword
  reply=( $( COMP_WORDS="$words[*]" \
             COMP_CWORD=$(( cword-1 )) \
             PIP_AUTO_COMPLETE=1 $words[1] ) )
}
compctl -K _pip_completion pip


# --- Android ---
ANDROID_SDK_ROOT="/home/ahellwig/Android/Sdk"

# vim: set et ts=2 sw=2 ft=zsh:

