####################################################
# .zshenv                                         ##
# @ashellwig                                      ##
# Purpose: Provide a defined environement for a   ##
#     non-interactive, non-login shell            ##
####################################################

# --- Login Shell? ---
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR}/.zprofile" ]]; then
  source "${ZDOTDIR}/.zprofile"
else
  # No matter, the settings here would stick anyway.
  source "${ZDOTDIR}/.zprofile"
fi

# vim: set et ts=2 sw=2 ft=zsh: