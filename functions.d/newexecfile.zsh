# newexecfile.zsh
# Purpose: Create a new exec file in cd or -d <d>

newexecfile() {
  local OPTIND=1
  local output_fname=""
  local output_dirname=""
  local helpmessage="$(
    cat <<END
\033[1mPurpose:  \033[0mThis function creates a new executable file.
\033[1mMaintained by:  \033[0;32mAshton Hellwig \033[0;4m<hellwigasthon@gmail.com>
\033[0;1mUsage: \033[0m newexecfile -f <filename> [-d <directory>] [-h]
\033[1m
Option                         Purpose
------------------------------------------------------\033[0m
-n         --name             filename to save as
-d         --directory        Directory to save to
-h         --help             show this help and exit
END
  )"

  while getopts "h,f:,d:" opt; do
    case "$opt" in
    h)
      echo "${helpmessage}"
      ;;
    f)
      local output_fname=$OPTARG
      shift 2
      ;;
    d)
      local output_dirname=$OPTARG
      shift
      ;;
    *)
      printf "\033[1;31mFilename \033[0m(-f) is \033[4;31mrequired\033[0m\n"
      echo -e "$helpmessage\c"
      return 1
      ;;
    esac
  done

  shift $((OPTIND - 1))
  [[ "$1" == "--" ]] && shift

  if [[ -n "$output_fname" ]]; then
    if [[ -n "$output_dirname" ]]; then
      if [[ -d $output_dirname ]]; then
        print -f "\033[1;31mCannot create dir.\033[0m"
      elif [[ ! -d $output_dirname ]]; then
        mkdir -p "${output_dirname}" &&
          touch "${output_dirname}/${output_fname}"
        chmod +x "${output_dirname}/${output_fname}"
        printf "\033[1;32mSuccess!\033[0m (new dir made)"
        return 0
      fi
    else
      if [[ ! -e "${output_fname}" ]]; then
        touch $output_fname
        chmod +x $output_fname
        printf "\033[1;32mSuccess!\033[0m (no new dir)"
        return 0
      elif [[ -e "${output_fname}" ]]; then
        printf "\033[1;31mFile exists!\033[0m"
        return 1
      fi
    fi
  fi
}

# vim: set et ft=zsh ts=2 sw=2:
