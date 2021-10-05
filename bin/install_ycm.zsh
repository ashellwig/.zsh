#!/usr/bin/env zsh

function echo_green {
  echo -e "\033[1;32m${1}\033[0m"
}

function echo_yellow {
  echo -e "\033[1;33m${1}\033[0m"
}

function echo_red {
  echo -e "\033[1;31m${1}\033[0m"
}

PREV_WORKING_DIR="${PWD}"

function cd_to_ycm_dir {
  echo_green "Leaving previous working directory: ${PREV_WORKING_DIR}"

  cd "${HOME}/.vim/plugged/YouCompleteMe"

  if [[ "$PWD" == "${HOME}/.vim/plugged/YouCompleteMe" ]];
    echo_green "Successfully entered YCM dir"
  fi
}

# Install Individual Language Support

## Install Go Support

function install_ycm {
  cd_to_ycm_dir
  
}
install_ycm

# Clean-up

## Back to Previous Directory
cd "${PREV_WORKING_DIR}"

## Unset all variables
unset PREV_WORKING_DIR

## Unset all functions
unfunction echo_green
unfunction echo_yellow
unfunction echo_red

unfunction cd_to_ycm_dir

unfunction install_ycm
