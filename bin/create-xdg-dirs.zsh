#!/usr/bin/env zsh
####################################################
# .zlogin                                         ##
# @ashellwig                                      ##
# Purpose: Set environment/options for            ##
#    XDG BASE DIRECTORY                           ##
####################################################

# --- Variables ---
# XDG Base Directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_DESKTOP_DIR="$HOME/Desktop"
export XDG_DOWNLOAD_DIR="$HOME/Downloads"
export XDG_TEMPLATES_DIR="$HOME/Templates"
export XDG_PUBLICSHARE_DIR="$HOME/Public"
export XDG_DOCUMENTS_DIR="$HOME/Documents"
export XDG_MUSIC_DIR="$HOME/Music"
export XDG_PICTURES_DIR="$HOME/Pictures"
export XDG_VIDEOS_DIR="$HOME/Videos"

typeset -a NEEDED_XDG_DIRS=(
  "${XDG_CONFIG_HOME}"
  "${XDG_DATA_HOME}"
  "${XDG_DESKTOP_DIR}"
  "${XDG_DOWNLOAD_DIR}"
  "${XDG_TEMPLATES_DIR}"
  "${XDG_PUBLICSHARE_DIR}"
  "${XDG_DOCUMENTS_DIR}"
  "${XDG_MUSIC_DIR}"
  "${XDG_PICTURES_DIR}"
  "${XDG_VIDEOS_DIR}"
)

for i in $NEEDED_XDG_DIRS; do
  if [[ ! -d "${i}" ]]; then
    echo -e "\033[1;31m${i} does not exist. Creating ${i}.\033[0m"
    mkdir -p ${i}
  else
    echo -e "\033[1;32m${i} already exists. Skipping.\033[0m"
  fi
done
