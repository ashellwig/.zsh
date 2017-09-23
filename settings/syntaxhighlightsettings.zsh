if [[ -d ${ZDOTDIR}/functions/zsh-syntax-highlighting ]]; then
  . ${ZDOTDIR}/functions/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern line cursor root)
  ZSH_HIGHLIGHT_PATTERNS+=(
    'rm -rf' 'fg=white,bold,bg=red' \
    'killall *' 'fg=white,bold,bg=red' \
    'pkill -HUP' 'fg=black,bold,bg=yellow' \
    'pacman*-S' 'fg=white,bold,bg=green' \
    'touch' 'fg=white,bold,bg=green' \
    'makenewdir' 'fg=white,bold,bg=green' \
    'mkdir' 'fg=white,bold,bg=green'
)
fi
