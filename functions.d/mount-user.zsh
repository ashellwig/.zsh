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

# Title: mount-user.zsh
# Author: Ash Hellwig <ahellwig.dev@gmail.com>
# Usage: Type command "mount-user -d <DEVICE> -m <MOUNT_POINT>"
# Discription: Mounts the specified device to the specified mount point with
# write access granted to users and not only root.

function mount-user() {
  # Define flags
  local flag_verbose=false
  local device=''
  local mount_point=''

  # Define usage
  local usage=(
    "mount-user [-h|--help]"
    "mount-user [-v] -d <DEVICE> -m <MOUNT_POINT>"
  )
  opterr() { echo >&2 "mount-user: Unknown option '$1'" }

  # Parse arguments
  while (( $# )); do
    case $1 in
      -h)
        printf "%s\n" $usage && return
        ;;
      -v)
        flag_verbose=true
        ;;
      -d)
        shift
        device=$1
        ;;
      -m)
        shift
        mount_point=$1
        ;;
      -*)
        opterr $1 && return 2
        ;;
    esac
    shift
  done

  # Create mountpoint if it does not exist
  if [[ ! -d $mount_point ]]; then
    sudo mkdir -p $mount_point
  fi

  # Mount the device
  sudo mount -o gid=users,fmask=113,dmask=002 $device $mount_point
}
