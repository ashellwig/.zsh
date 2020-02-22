##
## \file quantaxis_helper_funcs.sh
## \author Ashton Hellwig (ahellwig.dev@gmail.com)
## \brief Helper functions for administating the QUANTAXIS suite of products
##   locally.
## \version 0.1
## \date 2020-02-22
##
## \copyright Copyright (c) 2020 Ashton Hellwig

set_needed_vars() {
  declare -A -g qa_ports=(
    ["mongodb"]="27017"
    ["jupyter"]="8888"
    ["quantaxis_webserver"]="8010"
    ["quantaxis_community_interface"]="81"
    ["System_Monitoring"]="61208"
    ["qa-eventmq"]="15672"
  )

  declare -x -g \
    task_logger_dir="/home/ahellwig/.zsh/cron/lib/task-logger"

  source "${task_logger_dir}"
}

cleanup_qa_helpers() {
  echo -e "\033[1;33m---------------------------------------------------\033[0m"
  if [[ -n "${qa_ports[*]}" ]]; then
    unset qa_ports
    echo -e "\033[1;32mqa_ports is \033[4mNow\033[0m \033[1;32munset.\033[0m"
  elif [[ -z "${qa_ports[*]}" ]]; then
    echo -e "\033[1;32mqa_ports was never set.\033[0m"
  else
    echo -e "\033[1;32mqa_ports is unset.\033[0m"
  fi

  if [[ -n "${task_logger_dir}" ]]; then
    unset task_logger_dir
    echo -e "\033[1;32mtask_logger_dir is \033[4mNow\033[0m \033[1;32munset.\033[0m"
  elif [[ -z "${task_logger_dir}" ]]; then
    echo -e "\033[1;32mtask_logger_dir was never set.\033[0m"
  else
    echo -e "\033[1;32mtask_logger_dir is unset.\033[0m"
  fi

  if [[ -n "${LOG_DIR}" ]]; then
    unset LOG_DIR
    echo -e "\033[1;32mLOG_DIR is \033[4mNow\033[0m \033[1;32munset.\033[0m"
  elif [[ -z "${LOG_DIR}" ]]; then
    echo -e "\033[1;32mLOG_DIR was never set.\033[0m"
  else
    echo -e "\033[1;32mLOG_DIR is unset.\033[0m"
  fi

  if [[ -n "${WORKING}" ]]; then
    unset WORKING
    echo -e "\033[1;32mWORKING is \033[4mNow\033[0m \033[1;32munset.\033[0m"
  elif [[ -z "${WORKING}" ]]; then
    echo -e "\033[1;32mWORKING was never set.\033[0m"
  else
    echo -e "\033[1;32mWORKING is unset.\033[0m"
  fi

  if [[ -n "${WORKING_END}" ]]; then
    unset WORKING_END
    echo -e "\033[1;32mWORKING_END is \033[4mNow\033[0m \033[1;32munset.\033[0m"
  elif [[ -z "${WORKING_END}" ]]; then
    echo -e "\033[1;32mWORKING_END was never set.\033[0m"
  else
    echo -e "\033[1;32mWORKING_END is unset.\033[0m"
  fi

  echo -e "\033[1;33m---------------------------------------------------\033[0m"
}

check_qa_env() {
  set_needed_vars

  echo -e "\033[1;32mqa_ports\033[0m = ${qa_ports[@]}"
  echo -e "\033[1;32mtask_logger_dir\033[0m = ${task_logger_dir}"
  echo -e "\033[1;32mLOG_DIR\033[0m = ${LOG_DIR}"
  echo -e "\033[1;32mWORKING\033[0m = $WORKING"
  echo -e "\033[1;32mWORKING_END\033[0m = $WORKING_END"

  cleanup_qa_helpers

  echo -e "\033[1;32mqa_ports\033[0m = ${qa_ports[@]}"
  echo -e "\033[1;32mtask_logger_dir\033[0m = ${task_logger_dir}"
  echo -e "\033[1;32mLOG_DIR\033[0m = ${LOG_DIR}"
  echo -e "\033[1;32mWORKING\033[0m = $WORKING"
  echo -e "\033[1;32mWORKING_END\033[0m = $WORKING_END"
}

print_ports() {
  cat << END
Database: 27017
Notebook: 8888
Web Server: 8010
Community Edition interface: 81
System Monitoring: 61208
EventMQ: 15672
END

  cleanup_qa_helpers
}

show_help() {
  cat << END
check_qa_ports [OPTION]

Options:
-l\t--list\t\tShow ports for QuantAxis
-h\t--help\t\tShow this help
-c\t--check\t\tCheck ports using lsof
END
}

##
##
##
check_qa_ports_lsof() {
  declare colonchar=':'

  for key in "${!qa_ports[@]}"; do
    echo -e "\033[1m--------------------------------------------------\033[0m"
    echo -e "\033[3;33mChecking \033[1m$key\033[0m\n"
    # sudo lsof -i "$colonchar$qa_ports[$key]"
    echo "$colonchar$qa_ports[$key]"
    echo -e "\033[1;32mDone.\033[0m\n"
    echo -e "\033[1m--------------------------------------------------\033[0m"
  done

  cleanup_qa_helpers
}
