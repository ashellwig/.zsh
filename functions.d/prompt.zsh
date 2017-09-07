####################################################
# prompt/zsh                                      ##
# @ashellwig                                      ##
# Purpose: Set options interactive shell prompt   ##
####################################################

# Load the Powerlevel 9k Theme
if [[ -d ${ZDOTDIR}/functions/powerlevel9k ]]; then
  source ${ZDOTDIR}/functions/powerlevel9k/powerlevel9k.zsh-theme
else
  autoload -Uz promptinit && promptinit
  prompt fade blue
fi

# Powerlevel9k Options
if ( source ${ZDOTDIR}/functions/powerlevel9k/powerlevel9k.zsh-theme ); then
  # Prompt Elements
  POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status background_jobs_joined context dir vcs_joined)
  POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(anaconda)
  # Look and Feel
  POWERLEVEL9K_MODE='nerdfont-complete'
  POWERLEVEL9K_PYTHON_ICON='\ue606'
  POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='044'
fi