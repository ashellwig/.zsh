# Environment

log_command() {
  logger -t "${FILE}" "$@"
}

log_command "Logger works"
log_command "USER = ${USER}"
log_command "SHELL = ${SHELL}"


