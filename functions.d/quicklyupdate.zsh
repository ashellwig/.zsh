# quicklyupdate.zsh
# Purpose: Update Parity and system in one function

quicklyupdate() {

	while [[ $# -gt 0 ]]; do
		key="$1"
	  case $key in
		-h|--help)
      shift
      ;;
		*)
      ;;
		esac
	done

  if [[ "$key" == '-h' || "$key" == '--help' ]]; then
    echo "$helpmsg"
  fi

}

# vim: set et ft=sh ts=2 sw=2:
