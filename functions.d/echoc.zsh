# echoc.zsh
# Purpose: Echo with ASCII color codes

echoc () {
  local red=false
  local yellow=false
  local green=false

  local color=''
  local message=''

  case "$1" in
    -c|--color)
      local color=$2 &&
      shift
      ;;
    *)
      echo "Option not found" &&
      return
      ;;
  esac

  case "$3" in
    red)
      local red=true &&
      shift
      ;;
    yellow)
      local yellow=true &&
      shift
      ;;
    green)
      local green=true &&
      shift
      ;;
    *)
      echo "Argument must be a color"
      return
      ;;
  esac

  case "$4" in
    -m)
      local message=$4 &&
      shift
      ;;
    *)
      echo "should be -m" &&
      return
      ;;
  esac

  if [[ "$color"=red ]]; then
    echo -e "\03[1;31m${message}\033[0m"
  elif [[ "$yellow"=true ]]; then
    echo -e "\03[1;33m${message}\033[0m"
  elif [[ "$green"=true ]]; then
    echo -e "\03[1;32m${message}\033[0m"
  fi
}
