####################################################
# .zshrc                                          ##
# @ashellwig                                      ##
# Purpose: Set options for interactive shells     ##
####################################################

# --- Functions ---
fpath=($fpath ${ZDOTDIR}/functions/zsh-completions/src)
for func in $^fpath/*(N-.x:t); autoload $func
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
# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# vim: set et ts=2 sw=2:

