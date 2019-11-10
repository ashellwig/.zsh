#!/usr/bin/env zsh

##
## speed-test.sh
## Description: Conducts a network speed test using `speedtest-cli` and emails
## the results to <hellwigashton@gmail.com>. The purpose of this is to monitor
## speed to ensure that my $98/month on 1Gbps internet service via
## `Century Link` is actually worth it.
## Usage: File should be executed by `cron` every hour, 24 times per day (or
## at least while the computer is in a powered-on state).
##

local logging_lib='/home/ahellwig/.zsh/cron/lib/task-logger'
# Load the logging library
source "${logging_lib}/task-logger.sh"

function perform_speed_test() {
  # Begin Speed Test
  working -n 'Starting hourly network speed test [~/.zsh/cron/speed-test.sh]'
  echo

  speedtest-cli --simple

  echo "----------"
}

function main() {
  echo "$(info "Performing speedtest...")" | logger --id "[speed-test]"
  perform_speed_test >>/home/ahellwig/tmp/speedtest.log || ko
  finish
}

main "$@"
