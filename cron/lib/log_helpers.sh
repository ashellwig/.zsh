function spinner() {
  local p n symbols
  p=1
  n=6
  symbols=()
  symbols[1]=" ◜ "
  symbols[2]=" ◠ "
  symbols[3]=" ◝ "
  symbols[4]=" ◞ "
  symbols[5]=" ◡ "
  symbols[6]=" ◟ "

  #trap 'printf "\033[5D "; return' SIGINT
  #trap 'printf "\033[3D "; return' SIGHUP SIGTERM

  printf "   "
  while true; do
    printf "\033[3D${symbols[$p]}"
    ((p++))
    if [[ "$p" > "$n" ]]; then
      p=1
    fi
    sleep 0.1
  done
}

function spinner_end() {
  printf "\033[3D "
}

function set_working_ui() {
  export WORKING=spinner
  export WORKING_END=spinner_en
}

function clean_log_helpers() {
  if [[ $(spinner > /dev/null) ]]; then
    unfunction spinner
  fi
  if [[ $(spinner_end > /dev/null) ]]; then
    unfunction spinner_end
  fi
  unset WORKING
  unset WORKING_END
}
