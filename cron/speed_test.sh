#!/usr/bin/env zsh

##
## speed_test.sh
## Description: Conducts a network speed test using `speedtest-cli` and emails
## the results to <hellwigashton@gmail.com>. The purpose of this is to monitor
## speed to ensure that my $98/month on 1Gbps internet service via
## `Century Link` is actually worth it.
## Usage: File should be executed by `cron` every hour, 24 times per day (or
## at least while the computer is in a powered-on state).
##

# Load the logging library
logging_lib="$ZDOTDIR/cron/lib/task-logger"
speedtest_log_dir="$HOME/.log/speed_test"
speedtest_log_fn="$(printf "%s_speed_test.log" "$(date -I)")"
speedtest_log_path="$speedtest_log_dir/$speedtest_log_fn"
log_id="[speed_test]"
source "$logging_lib/task-logger.sh"

# Ensure log directory and log file exist
if [[ -d "$speedtest_log_dir" ]]; then
  warn "\$speedtest_log_dir ($speedtest_log_dir) not found." \
    | logger --id "$log_id"
  logger --id "$log_id" | mkdir -p "$HOME/tmp/speedtest" \
    || ko "Unable to create \$speedtest_log_dir"
fi

if [[ ! -e "$speedtest_log_dir/$speedtest_log_fn" ]]; then
  logger --id "$log_id" \
    | warn "Log file for speed_test not found: $speedtest_log_path"

  logger --id "$log_id" | touch "$speedtest_log_path" \
    || ko "Unable to create the file: $speedtest_log_path"
fi

# Begin Speed Test
logger --id "$log_id" \
  | info 'Starting hourly network speed test [~/.zsh/cron/speed_test.sh]'

logger --id "$log_id" \
  | speedtest-cli --simple | tee -a "$speedtest_log_path" \
  && echo -e "-------------------\n" | tee -a "$speedtest_log_path" \
  || ko "Failed to run speedtest-cli"

finish "$@"
