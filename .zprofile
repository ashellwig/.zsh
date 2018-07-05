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
	~/.cargo/bin     # Rust
	~/racket/bin     # Racket
	~/go/bin         # Go
	~/.local/bin
	~/anaconda3/bin  # Python
	~/.yarn/bin      # Node.js
)

