####################################################
# prompt/zsh                                      ##
# @ashellwig                                      ##
# Purpose: Set options interactive shell prompt   ##
####################################################

# Define $PS1
# Load the Powerlevel 9k Theme
if [[ -d ${ZDOTDIR}/functions/powerlevel10k ]]; then
  export ZLE_RPROMPT_INDENT=0
  POWERLEVEL9K_LEGACY_ICON_SPACING=true
  # PowerLevel9K config
  # [[ ! -f ${ZDOTDIR}/options/.p9k.zsh ]] || . ${ZDOTDIR}/options/.p9k.zsh
  # PowerLevel10K config
  [[ ! -f ${ZDOTDIR}/options/.p10k.zsh ]] || . ${ZDOTDIR}/options/.p10k.zsh
  . ${ZDOTDIR}/functions/powerlevel10k/powerlevel9k.zsh-theme
elif [[ ! -d ${ZDOTDIR}/functions/powerlevel10k ]]; then
  autoload -Uz promptinit && promptinit
  prompt fade blue
fi

# Set cursor style
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[cursor]=underline

# vim: set et ts=2 sw=2:
