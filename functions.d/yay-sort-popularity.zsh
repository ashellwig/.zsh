# Copyright 2024 Ash Hellwig <ahellwig.dev@gmail.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Title: yay-sort-popularity.zsh
# Author: Ash Hellwig <ahellwig.dev@gmail.com>
# Usage: yay-sort-popularity -p <search_string>
# Discription: Sorts AUR results by their popularity rating.

function yay-sort-popularity() {
  # Define flags
  local flag_help                              # Print help message and exit.
  local flag_verbose                           # Enable verbose output.
  local arg_packagename=(packagesearchstring)  # RegEx search string.

  # Define usage
  local usage=(
    "yay-sort-popularity {-h --help}"
    "yay-sort-popularity {-v --version}"
    "yay-sort-popularity {-p --package} <search_string>"
  )

  # Parse arguments
  zmodload zsh/zutil
  zparseopts -D -F -K -- \
    {h,-help}=flag_help \
    {v,-verbose}=flag_verbose \
    {p,-package}:=arg_packagename ||
      return 1

  # Perform actions

  ## Show Help
  [[ -z "$flag_help" ]] || { print -l $usage && return }

  ## Search and rank

  ### Print information if verbose mode is enabled
  if (( $#flag_verbose )); then
    yay -Ps
  fi

  ### Search for the package
  yay -a -Ss "$arg_packagename[-1]" | sed -n '1~2P' | awk '{ print $1 ": " substr($4, 0, 4); }' | sort -r -k 2
}
