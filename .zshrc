####################################################
# .zshrc                                          ##
# @ashellwig                                      ##
# Purpose: Set options for interactive shells     ##
####################################################

# --- Functions ---
fpath=($fpath ${ZDOTDIR}/functions/zsh-completions/src)
for func in $^fpath/*(N-.x:t); autoload $func
# Completion
autoload ${ZDOTDIR}/functions/zsh-completions/src
autoload compinit && compinit
# Drop-in Functions and Scripts
if [[ -d ${ZDOTDIR}/functions.d ]]; then
  for file in ${ZDOTDIR}/functions.d/*.zsh; do
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

# vim: set et ts=2 sw=2: