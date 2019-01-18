####################################################
# prompt/zsh                                      ##
# @ashellwig                                      ##
# Purpose: Set options interactive shell prompt   ##
####################################################

# Define $PS1
# Load the Powerlevel 9k Theme
if [[ -d ${ZDOTDIR}/functions/powerlevel9k ]]; then
  # Prompt Elements
  POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status background_jobs context dir vcs)
  POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(anaconda)
  # Look and Feel
  POWERLEVEL9K_MODE='nerdfont-complete'
  POWERLEVEL9K_PYTHON_ICON='\ue606'
  POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='044'
  . ${ZDOTDIR}/functions/powerlevel9k/powerlevel9k.zsh-theme
elif [[ ! -d ${ZDOTDIR}/functions/powerlevel9k ]]; then
  autoload -Uz promptinit && promptinit
  prompt fade blue
fi

# vim: set et ts=2 sw=2:
