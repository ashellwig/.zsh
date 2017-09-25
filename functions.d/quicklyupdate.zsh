# quicklyupdate.zsh
# Purpose: Update Parity and system in one function

quicklyupdate() {

# --- Options ---
  # Requred
  local key="$1"
  # System
  local up_sys=false
  # Zsh
  local up_zsh=false
  # Vim
  local up_vim=false
  # Parity
  local up_parity=false

  # Parse Options
  case "${key}" in
    -s|--system)
      local up_sys=true &&
      shift
      ;;
    -z|--zsh)
      local up_zsh=true &&
      shift
      ;;
    -v|--vim)
      local up_vim=true &&
      shift
      ;;
    -p|--parity)
      local up_parity=true &&
      shift
      ;;
    -a|--all)
      local up_sys=true
      local up_zsh=true
      local up_vim=true
      local up_parity=true
      shift
      ;;
    -h|--help)
      local show_help=true
      ;;
    *)
      echo -e "$* not found! Try \"quicklyupdate [-h|--help]\""
      return
      ;;
  esac

# --- Help ---
  if [[ "$show_help" = true ]]; then
    echo "$(cat <<END
\033[1;33mUsage\033[0m quicklyupdate [-s|--system] [-z|--zsh] [-v|--vim]
       [-p|--parity] [-h|--help]
\033[1mMaintained By:\033[0m \033[2;32mAshton Hellwig\033[0m \033[4m<ashtonscotthellwig@gmail.com>\033[0m
\033[1mShort Option    Long Option                Use\033[0m
\033[1m------------------------------------------------------------\033[0m
-h                     --help                     Show help and exit
-s                     --system                   update system (pacman and yaourt)
-z                     --zsh                      update zsh functions
-v                     --vim                      update vim plugins
-p                     --parity                   update parity (and rust)
-a                     --all                      update all
END
)"
  fi

# --- System ---
  if [[ "$up_sys" = true ]]; then
    printf "\n\033[1;33m===> Updating SYSTEM...\033[0m"
    echo "$(sudo pacman -Syu --noconfirm)"
    echo "$(yaourt -Syua --noconfirm)"
    printf "\n\033[32mUpdated System.\033[0m"
  fi

# --- Zsh ---
  if [[ "$up_zsh" = true ]]; then
    printf "\n\033[1;33m===> Updating ZSH...\033[0m"
    cd "${ZDOTDIR}"
    git submodule update --init --recursive
    printf "\n\033[32mUpdated Zsh.\033[0m"
  fi

# --- Vim ---
  if [[ "$up_vim" = true ]]; then
    printf "\n\033[1;33m===> Updating VIM...\033[0m"
    cd "${HOME}" && cd "${HOME}/.vim/bundle"
    vim '+PluginInstall' '+PluginUpdate' '+PluginClean' '+qall'
    cd "${HOME}/.vim/bundle/YouCompleteMe"
    ./install.sh '--system-libclang' '--clang-completer'
    cd "$HOME"
    printf "\n\033[32mUpdated Vim.\033[0m"
  fi

# --- Parity ---
  if [[ "$up_parity" = true ]]; then
    printf "\n\033[1;32m===> Updating Parity...\033[0m"
    cd "${HOME}"
    rustup 'update' ;
    cd "${HOME}/parity" &&
      cargo 'build' &&
      cargo 'build' '--release' ;
    cd "$HOME"
    printf "\n\033[32mUpdated Parity.\033[0m"
  fi

# --- No Argument ---
  if [[ "$#" -eq 0 ]]; then
    echo "$0" '--all'
  fi
}

# vim: set et ft=sh ts=2 sw=2:
