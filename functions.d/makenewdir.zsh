# makenewdir.zsh
# Creates a directory and `cd`'s into it

makenewdir() {
  print "Please name the directory to be created."
  print "If it already exists, the command will exit."
  read newdirmade
  if [[ ! "$#" -eq 0 ]]; then
    local newdirmade="$1"
  elif [[ "$#" -eq 0 ]]; then
    return
  fi
  if [[ ! -d ${newdirmade} ]]; then
    mkdir -p ${newdirmade}
    cd ${newdirmade}
  elif [[ -d ${newdirmade} ]]; then
    print "Directory already exists."
    return 0
  fi
}