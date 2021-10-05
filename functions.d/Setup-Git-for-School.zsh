function setup_git_for_school {
  if [[ -d "${PWD}/.git" ]]; then
    git config --local commit.gpgsign true
    git config --local user.signingkey "7E213A9FE34422E6"
    git config --local user.name "Ash Hellwig"
    git config --local user.email "ahellwig@student.cccs.edu"
  else
    echo -e "\033[0;31mPlease initialize a git repository first.\033[0m"
  fi
}
