####################################################
# .zshrc                                          ##
# @ashellwig                                      ##
# Purpose: Set options for interactive shells     ##
####################################################

# --- Path ---
# $PATH
typeset -U path
path=(
  /bin
  /sbin
  /usr/{bin.sbin}
  /usr/local/{bin,sbin}
  ~/anaconda3/bin               # Python
  ~/.rvm/gems/ruby-2.41/bin     # Ruby
  ~/.rvmbin                     # Ruby
  ~/.cargo/bin                  # Rust
  ~/parity/target/release       # Parity
  ~/.local/bin                  # Local Bin
)
# $FPATH
typeset -U fpath
fpath=($fpath ${ZDOTDIR}/functions/zsh-completions/src)
for func in $^fpath/*(N-.x:t); autoload $func
# --- Functions ---
# Completion
. ${ZDOTDIR}/settings/completionsettings.zsh
# Drop-in Functions and Scripts
if [[ -d ${ZDOTDIR}/functions.d ]]; then
  for file in ${ZDOTDIR}/functions.d/*.zsh; do
    . "$file"
  done
fi
# Plugins
if [[ -d ${ZDOTDIR}/plugins ]]; then
  if [[ -e * ]]; then
    for file in ${ZDOTDIR}/plugins/*/*.plugin.zsh; do
      . "$file"
    done
  fi
fi
# --- Options / Settings ---
# Syntax Highlighting
. ${ZDOTDIR}/settings/syntaxhighlightsettings.zsh
# History
. ${ZDOTDIR}/settings/historysettings.zsh
# Option Scripts
if [[ -d ${ZDOTDIR}/options ]]; then
  for file in ${ZDOTDIR}/options/*.zsh; do
    . "$file"
  done
fi
# Keybindings
. ${ZDOTDIR}/settings/keybindings.zsh
# Programming
. ${ZDOTDIR}/settings/programmingenvs.zsh



# vim: set et ts=2 sw=2:

