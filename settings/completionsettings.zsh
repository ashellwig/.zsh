# completionsettings.zsh
# @ashellwig
# Purpose: Set completion styles

# --- Functions ---
autoload ${ZDOTDIR}/functions/zsh-completions/src
autoload compinit && compinit
# Quick-Change Directories
rationalise-dot() {
  if [[ $LBUFFER = *.. ]]; then
    LBUFFER+=/..
  else
    LBUFFER+=.
  fi
}
zle -N rationalise-dot
bindkey . rationalise-dot

# --- Style ---
# Cache
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/.zcompcache
# Prevent CVS Files/Directories from being Completed
zstyle ':completion:*:(all-|)files' ignored-patterns '(|*/)CVS'
zstyle ':completion:*:cd:*' ignored-patterns '(*/)#CVS'
# Fuzzy-Matching
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric
# Prevent `cd` from Completing the Parent Directory
zstyle ':completion:*:cd:*' ignore-parents parent pwd

# vim: set et ft=zsh ts=2 sw=2: