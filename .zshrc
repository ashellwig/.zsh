#vim: ft=zsh sw=2 ts=2 et
####################################################
# .zshrc                                          ##
# @ashellwig                                      ##
# Purpose: Set options for interactive shells     ##
####################################################

# --- Functions ---
fpath=(${ZDOTDIR}/functions/zsh-completions/src $fpath)
# Completion
autoload ${ZDOTDIR}/functions/zsh-completions/src
autoload compinit && compinit
# Drop-in Functions and Scripts
if [[ -d ${ZDOTDIR}/functions.d ]]; then
  source ${ZDOTDIR}/functions.d/short_functions.zsh
  source ${ZDOTDIR}/functions.d/history-substring-search.zsh
  source ${ZDOTDIR}/functions.d/prompt.zsh
  source ${ZDOTDIR}/functions.d/aliases.zsh
fi
# Syntax Highlighting
if [[ -d ${ZDOTDIR}/functions/zsh-syntax-highlighting ]]; then
  source ${ZDOTDIR}/functions/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern line cursor root)
  ZSH_HIGHLIGHT_PATTERNS+=(
    'rm -rf *' 'fg=white,bold,bg=red' \
    'killall *' 'fg=white,bold,bg=red' \
    'pkill*-HUP *' 'fg=black,bold,bg=yellow' \
    'pacman*-S *' 'fg=white,bold,bg=green' \
    'touch *' 'fg=white,bold,bg=green' \
    'makenewdir*' 'fg=white,bold,bg=green' \
    'mkdir' 'fg=white,bold,bg=green'
)
fi

# --- Options ---
# History
HISTFILE=${ZDOTDIR}/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory
# Zsh
setopt beep nomatch
unsetopt autocd notify

# --- Keybindings ---
# History
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
# Navigation
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line