####################################################
# .zshrc                                          ##
# @ashellwig                                      ##
# Purpose: Set options for interactive shells     ##
####################################################

# --- Path ---
# $PATH
source "${ZDOTDIR}/.zshenv"
# $FPATH
typeset -U fpath
fpath=(
  $fpath
  ${ZDOTDIR}/functions/zsh-completions/src
  ${ZDOTDIR}/site-functions/
  ${ZDOTDIR}/site-functions/functions/
)

if [[ "$(uname -s)" == 'Darwin' ]]; then
  if [[ "$(whoami)" == 'ashwig-personal' ]]; then
    fpath=(
      $fpath
      '/opt/homebrew/share/zsh/site-functions'
    )
  fi
fi

for func in $^fpath/*(N-.x:t); do autoload $func; done

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
# SSH
. ${ZDOTDIR}/settings/ssh-env.zsh
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
