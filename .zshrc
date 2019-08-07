####################################################
# .zshrc                                          ##
# @ashellwig                                      ##
# Purpose: Set options for interactive shells     ##
####################################################

# --- Path ---
# $PATH
source "${ZDOTDIR}/.zprofile"
# $FPATH
typeset -U fpath
fpath=(
  $fpath
  ${ZDOTDIR}/functions/zsh-completions/src
  )
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
    for file in ${ZDOTDIR}/plugins/*/*.plugin.zsh; do
      . "$file"
    done
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
# Autosuggestions
. ${ZDOTDIR}/functions/zsh-autosuggestions/zsh-autosuggestions.zsh

# vim: set et ts=2 sw=2:
