updatezshfuncs() {
  echo -e "\033[0;33mUpdating functions...\033[0m\n"
  for directory in ${ZDOTDIR}/functions/*; do
    cd "${directory}" && git pull && cd -
    cd "${HOME}"
  done
  echo -e "\033[1;32m\033[0m"
  echo -e "\033[0;33mUpdating plugins...\033[0m"
  for directory in ${ZDOTDIR}/plugins/*; do
    cd "${directory}" && git pull && cd -
    cd "${HOME}"
  done
  echo -e "\033[1;32m\033[0m"
}