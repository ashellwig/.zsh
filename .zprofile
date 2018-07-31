# vim: set et ft=zsh ts=2 sw=2
####################################################
# .zlogin                                         ##
# @ashellwig                                      ##
# Purpose: Set environment/options for            ##
#    login shells                                 ##
####################################################


# --- Variables ---
# XDG Base Directories
source "${ZDOTDIR}/settings/xdg-user-dirs-settings.zsh"
# Shell
export ZSH_CONFIG_DIRS="$HOME/.zsh"
export ZDOTDIR="${HOME}/.zsh"
# Browser
export BROWSER='/bin/chromium'
# Editor
export EDITOR='vim'
export VISUAL='vim'
export VI='vim'
export PAGER='less'

# --- Path ---
# Programs
typeset -U path
source /etc/profile
path=(
	/bin
	/sbin
	/usr/{bin,sbin}
	/usr/local/{bin,sbin}
	~/.local/bin
	~/.cargo/bin     # Rust
	~/racket/bin     # Racket
	~/go/bin         # Go
	~/anaconda3/bin  # Python
	~/.yarn/bin      # Node.js
	# Apache Spark
	/opt/apache-spark/bin
	# WebAssembly
	~/emsdk
	~/emsdk/clang/e1.38.10_64bit
	~/emsdk/node/8.9.1_64bit/bin
	~/emsdk/emscripten/1.38.10

)

