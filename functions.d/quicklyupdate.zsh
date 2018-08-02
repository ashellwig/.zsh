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
  local up_rust=false

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
    -r|--rust)
      local up_rust=true &&
      shift
      ;;
    -a|--all)
      local up_sys=true
      local up_zsh=true
      local up_vim=true
      local up_rust=true
      shift
      ;;
    -h|--help)
      local show_help=true
      ;;
    *)
      echo -e "argument not found! Try \"quicklyupdate [-h|--help]\""
      return
      ;;
  esac

# --- Help ---
  if [[ "$show_help" = true ]]; then
    echo "$(cat <<END
\033[1;33mUsage\033[0m\n quicklyupdate [-s|--system] [-z|--zsh] [-v|--vim]
       [-r|--rust] [-h|--help]
\033[1mMaintained By:\033[0m \033[2;32mAshton Hellwig\033[0m \033[4m<ashtonscotthellwig@gmail.com>\033[0m
\033[1mShort Option    Long Option                Use\033[0m
\033[1m------------------------------------------------------------\033[0m
-h                     --help                     Show help and exit
-s                     --system                   update system (pacman and yaourt)
-z                     --zsh                      update zsh functions
-v                     --vim                      update vim plugins
-r                     --rust                     update rust
-a                     --all                      update all
END
)"
  fi

# --- System ---
  if [[ "$up_sys" = true ]]; then
    printf "\n\033[1;33m===> Updating SYSTEM...\033[0m\n\n"
    sudo pacman '-Syyyyu' '--noconfirm'
    yaourt '-Syua' '--noconfirm'
    printf "\n\033[1;32m===> Removing Orphaned Packages \033[0m\n"
    sudo pacman '-Rns' "$(pacman -Qtdq)"
    printf "\n\033[1;32m===> Packages Upgraded: \033[0m\n"
    echo '-e' "\n\033[1;31mTODO: Show upgraded packages\033[0m\n"
    printf "\n\033[32mUpdated System.\033[0m\n"
  fi

# --- Zsh ---
  if [[ "$up_zsh" = true ]]; then
    printf "\n\033[1;33m===> Updating ZSH...\033[0m\n"
    cd "${ZDOTDIR}"
    git submodule update --init --recursive
    printf "\n\033[32mUpdated Zsh.\033[0m\n"
  fi

# --- Vim ---
  if [[ "$up_vim" = true ]]; then
    printf "\n\033[1;33m===> Updating VIM...\033[0m\n"
    vim '+PlugInstall' '+PlugUpdate' '+PlugClean' '+qall'
    cd "$HOME"
    printf "\n\033[32mUpdated Vim.\033[0m\n"
  fi

# --- Rust ---
  if [[ "$up_rust" = true ]]; then
    printf "\n\033[1;32m===> Updating Rust...\033[0m\n"
    cd "${HOME}"
    rustup 'update' ;
    printf "\n\033[32mUpdated Rust.\033[0m\n"
  fi
}

# vim: set et ft=sh ts=2 sw=2:
