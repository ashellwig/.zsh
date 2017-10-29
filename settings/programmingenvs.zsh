# programmingenvs.zsh
# @ashellwig
# Purpose: Provide access to package manager attached to
#       programming environments

# --- C/C++ ---
# Compiler Option
export CC=clang
export CXX=clang

# --- Go ---
# GOPATH
if [[ -d "${HOME}/go" ]]; then
  export GOPATH="$HOME/go"
fi

# --- Ruby ---
# RVM
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# --- Node ---
# NVM
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
