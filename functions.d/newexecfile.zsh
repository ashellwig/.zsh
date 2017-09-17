# newexecfile.zsh
# Purpose: Create a new exec file in cd or -d <d>

function newexecfile() {
  while [[ $# -gt 1 ]]; do
    key="$1"

    case $key in
      -n|--name)
        local filenamein="$2"
        shift
        ;;
      -d|--directory)
        local directoryloc="$2"
        shift
        ;;
      -h|--help)
        local helpmsg="$(cat <<END
Option                    Purpose
-------------------------------------------------
-n     --name             filename to save as
-d     --directory        Directory to save to
-h     --help             show this help and exit
END
)"
        shift
        ;;
    esac
  shift
  done
}

# vim: set et ft=zsh ts=2 sw=2:
