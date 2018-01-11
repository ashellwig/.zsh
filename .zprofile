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
# Language
export LANG='en_US.UTF-8'
# LESS
export LESS='-F -g -i -M -R -S -w -X -z-4'


# --- Path ---
# Programs
typeset -U path
path=(
	/bin
	/sbin
	/usr/{bin,sbin}
	/usr/local/{bin,sbin}
	~/.cargo/bin # Rust
	~/.local/bin # Local Bin
	~/.yarn/bin
	~/.nvm/versions/node/bin
)

# Path - When needed
	# /usr/lib/jvm/default/bin        # JVM (Arch Bypass)
	#~/go/bin # Go
	#~/anaconda3/bin # Python
	# ~/.rvm/gems/ruby-2.41/bin       # Ruby
	# ~/.rvmbin                       # Ruby
	#~/parity/target/release         # Parity
	#~/.nvm/versions/node/v8.9.2/bin # NVM