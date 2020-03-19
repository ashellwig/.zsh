#!/usr/bin/env zsh

function mirror_list_stream() {
  set -o errexit -o pipefail -o noclobber -o nounset

  this_script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"

  # shellcheck source=SCRIPTDIR/../cron/lib/task-logger/task-logger.sh
  source "${this_script_dir}/../cron/lib/task-logger-task-logger.sh"

  ! getopt --test /dev/null
  if [[ ${PIPESTATUS[0]} -ne 3 ]]; then
    error 'getopt --test failed for your current environment.'
    ko
    exit 1
  else
    ok 'getopt available'
  fi
}
