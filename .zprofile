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
export BROWSER='/bin/google-chrome-unstable'
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
	"${PATH}"
	/bin
	/sbin
	/usr/{bin,sbin}
	/usr/local/{bin,sbin}
	~/.local/bin
	~/.local/bin/TEE-CLC-14.114.0/
	~/.cabal/bin        # Haskell
	~/.cargo/bin        # Rust
#	~/racket/bin        # Racket
	~/go/bin            # Go
	~/anaconda3/bin     # Python
	~/.yarn/bin         # Node.js
	~/SDKs/flutter/bin  # Flutter
	~/.dotnet/tools     # .NET
)

