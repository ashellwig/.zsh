####################################################
# .zshenv                                         ##
# @ashellwig                                      ##
# Purpose: Provide a defined environement for a   ##
#     non-interactive, non-login shell            ##
####################################################

# --- Login Shell? ---
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR}/.zprofile" ]]; then
  source "${ZDOTDIR}/.zprofile"
fi

# --- Variables ---
# Terminal
export ZDOTDIR="${HOME}/.zsh"
export ZSH_CONFIG_DIRS="$"
export TERM=xterm-termite
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
typeset -U path
# Programs
path=(
  /bin
  /usr/bin
  /sbin
  /usr/local/{bin,sbin}
  ~/.rvm/gems/ruby-2.41/bin
  ~/.rvmbin
  ~/anaconda3/bin
  ~/.cargo/bin
  ~/parity/target/release
  ~/.local/bin
)