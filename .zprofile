# vim: set et ft=zsh ts=2 sw=2
####################################################
# .zlogin                                         ##
# @ashellwig                                      ##
# Purpose: Set environment/options for            ##
#    login shells                                 ##
####################################################

# --- Variables ---
# XDG Base Directories
export XDG_CONFIG_DIR="$HOME/.config"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DESKTOP_DIR="$HOME/Desktop"
export XDG_DOWNLOAD_DIR="$HOME/Downloads"
export XDG_TEMPLATES_DIR="$HOME/Templates"
export XDG_PUBLICSHARE_DIR="$HOME/Public"
export XDG_DOCUMENTS_DIR="$HOME/Documents"
export XDG_MUSIC_DIR="$HOME/Music"
export XDG_PICTURES_DIR="$HOME/Pictures"
export XDG_VIDEOS_DIR="$HOME/Videos"
# Shell
export ZSH_CONFIG_DIRS="$HOME/.zsh"
export ZDOTDIR="${HOME}/.zsh"
# Browser
export BROWSER='chromium'
# Editor
export EDITOR='vim'
export VISUAL='vim'
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
# Programs
typeset -U path
path=(
  /bin
  /sbin
  /usr/{bin.sbin}
  /usr/local/{bin,sbin}
  ~/go/bin                      # Go
  ~/anaconda3/bin               # Python
  ~/.rvm/gems/ruby-2.41/bin     # Ruby
  ~/.rvmbin                     # Ruby
  ~/.cargo/bin                  # Rust
  ~/parity/target/release       # Parity
  ~/.local/bin                  # Local Bin
)
