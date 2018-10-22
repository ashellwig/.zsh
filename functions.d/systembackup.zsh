#!/usr/bin/env zsh

backup_documents() {
  if [[ $(mount | grep -c /mnt/home) == 1 ]]; then
    sudo rsync \
      --delete \
      --partial \
      --info=progress2 \
      -aAXv \
      --exclude node_modules \
      --exclude '*.o' \
      --exclude '*.bin' \
      --exclude ML \
      /home/ahellwig/Documents/ \
      /mnt/home/Documents/

    echo -e "\033[1;32mBackup Complete\033[0m"
  else
    echo -e "\033[1;31mDrive not mounted.\033[0m"
  fi
}

