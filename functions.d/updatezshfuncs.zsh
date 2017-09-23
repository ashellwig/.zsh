updatezshfuncs() {
  for directory in ${ZDOTDIR}/functions/*; do
    cd "$directory" && git pull
    cd "${HOME}"
  done
}