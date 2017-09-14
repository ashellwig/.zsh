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
# Options that apply to/with functions
if [[ -d ${ZDOTDIR}/options ]]; then
  for file in ${ZDOTDIR}/options/*.zsh; do
   . "$file"
  done
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
# History-Substring-Search
source ${ZDOTDIR}/functions/history-substring-search/zsh-history-substring-search.zsh
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
if [[ -e ${ZDOTDIR}/functions/history-substring-search/zsh-history-substring-search.zsh ]]; then
  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down
  bindkey -M vicmd 'k' history-substring-search-up
  bindkey -M vicmd 'j' history-substring-search-down
fi
# Navigation
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[[~' delete-char-or-list
# vim: set et ts=2 sw=2:
