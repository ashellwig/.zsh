# set-git-config.zsh
# purpose: Set local git config for either personal or somni-cbn related repos

set-git-config() {
  zparseopts -D -E -- a+:=account -account+:=account
  
  typeset local_account
  typeset local_account=(
    'git'
    'config'
    '--local'
    'user.name'
    'Ashton Hellwig'
    '&&'
    'git'
    'config'
    '--local'
    'user.email'
    'ahellwig.dev@gmail.com'
  )

  typeset work_account
  typeset work_account=(
    'git'
    'config'
    '--local'
    'user.name'
    'Ashton Hellwig'
    '&&'
    'git'
    'config'
    '--local'
    'user.email'
    'ashton@somnicbn.com'
  )

  if [[ $account == "personal" ]]; then
    eval "${local_account[@]}"
  else
    eval "${work_account[@]}"
  fi
}
