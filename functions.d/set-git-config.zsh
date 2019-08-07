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

  if [[ $account == "work" ]]; then
    eval "${work_account[@]}"
  else
    eval "${local_account[@]}"
  fi
}

# vim: set et ts=2 sw=2 ft=zsh:

