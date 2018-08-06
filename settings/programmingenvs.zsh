# programmingenvs.zsh
# @ashellwig
# Purpose: Provide access to package manager attached to
#       programming environments

# --- WebAssembly ---
# EMSDK
# export EMSDK="${HOME}/emsdk"
# export EM_CONFIG="${HOME}/.emscripten"
# export LLVM_ROOT="${HOME}/emsdk/clang/e1.38.10_64bit"
# export EMSCRIPTEN_NATIVE_OPTIMIZER="${HOME}/emsdk/clang/e1.38.10_64bit/optimizer"
# export BINARYEN_ROOT="${HOME}/emsdk/clang/e1.38.10_64bit/binaryen"
# export EMSDK_NODE="${HOME}/emsdk/node/8.9.1_64bit/bin/node"
# export EMSCRIPTEN="${HOME}/emsdk/emscripten/1.38.10"


# --- C/C++ ---
# Compiler Option
export CC=gcc
export CXX=g++


# --- Go ---
# GOPATH
export GOPATH="$HOME/go"


# --- Node ---
# NVM
source /usr/share/nvm/init-nvm.sh
[ -z "$NVM_DIR" ] && export NVM_DIR="$HOME/.nvm"
source /usr/share/nvm/nvm.sh
source /usr/share/nvm/bash_completion
source /usr/share/nvm/install-nvm-exec

# --- Ruby ---
# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# vim: set et ts=2 sw=2 ft=zsh:


# --- Python ---
# Pip Command Completion
function _pip_completion {
  local words cword
  read -Ac words
  read -cn cword
  reply=( $( COMP_WORDS="$words[*]" \
             COMP_CWORD=$(( cword-1 )) \
             PIP_AUTO_COMPLETE=1 $words[1] ) )
}
compctl -K _pip_completion pip
# pip zsh completion end


# pip zsh completion start
function _pip_completion {
  local words cword
  read -Ac words
  read -cn cword
  reply=( $( COMP_WORDS="$words[*]" \
             COMP_CWORD=$(( cword-1 )) \
             PIP_AUTO_COMPLETE=1 $words[1] ) )
}
compctl -K _pip_completion pip
# pip zsh completion end

