# --- Keybindings ---
# History
if [[ -e ${ZDOTDIR}/functions/history-substring-search/zsh-history-substring-search.zsh ]]; then
  bindkey '^[[A' history-substring-search-up && bindkey '^[[5~' history-substring-search-up
  bindkey '^[[B' history-substring-search-down && bindkey '^[[6~' history-substring-search-down
  bindkey -M vicmd 'k' history-substring-search-up
  bindkey -M vicmd 'j' history-substring-search-down
fi
# Navigation
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[[3~' delete-char
bindkey '^[[2~' overwrite-mode