#!/usr/bin/zsh
# zsh-sysbackup.zsh
# Ashton Hellwig @ashellwig
# Purpose: Performs a full system backup using Rsync

# --- Global Variables ---
export build_dir="$HOME/.local/tmp"

# --- Mount Funcion
# function mountdrive() {
#   local device="$(lsblk | sed '/sda/d' | grep -E '^sd' | awk ' { rint $1 } ' | head -n 1)"
#   if [[ ! -d /mnt/backup ]]; then
#     sudo mkdir -p /mnt/{backup,backup.command}
#   fi
#   sudo mount /dev/$device\1 /mnt/backup
# }

# --- Pre-Backup ---
function pre_run_func() {
  mkdir -p "$build_dir"
  print -f "\n\033[2;33m\033[0m\n"
  cat << END >> "${build_dir}/rsync-exclude.txt"
/home/ahellwig/tmp/***
/home/ahellwig/.cache/***
/home/ahellwig/.vscode/***
/home/ahellwig/.cargo/***
/home/ahellwig/.rustup/***
/home/ahellwig/.cargo/***
/home/ahellwig/.g*/***
/dev/*
/proc/*
/sys/*
/tmp/*
/run/*
/mnt/*
/media/*
/lost+found
/swapfile
/srv/*
/var/lib/texmf/***
/var/log/*
END
  cd "${build_dir}"
}

# --- Backup Function ---
function run_func() {
  sudo rsync '-aAxXhH' '--partial' '--delete' '--info=name,progress' --exclude-from="${build_dir}/rsync-exclude.txt" '/' '/mnt/backup'
}

# --- Unmounting the Drive ===
# function un_mountdrive() {
#   print -f "\033[33;1m\nUnmounting Drive...\033[0m\n"
#   cd /mnt
#   sudo umount -R /mnt ; sudo umount -R /mnt/backup
# }

# --- Clean Function ---
function clean_func() {
  # TODO: set this umount to specify the output of the `mount` command
  cd ~
  rm '-rf' "${build_dir}"
 #sudo umount -R /mnt/ ; sudo umount -R /mnt/backup
 #sudo rm -rf /mnt/backup ; sudo rm -rf /mnt/backup.command
  if [[ -d "${HOME}/.local/tmp" ]]; then
    rm -rf ~/tmp
  fi
}

# --- Call to Functions ---
function main_func() {
  print -f "\033[3;33m\nCreating Necessary Directories...\033[0m\n"
  mountdrive &&
  pre_run_func &&

  print -f "\n\033[3;4;32mBeginning Backup\033[0m\n"
  run_func &&

  print -f "\n\033[3;33mRemoving Filelist...\033[0m\n"
 #un_mountdrive &&
  clean_func &&
  print -f "\n\033[1;32mDone!\033[0m\n" || print -f "\n[033[1;31mFAILED\033[0m"
}

# --- Script ---
main_func

# Final Cleanup
print -f "\n\033[3;33mUnsetting functions and variables...\033[0m\n"
if [[ -v build_dir ]]; then
  unset build_dir
fi
unfunction mountdrive
unfunction pre_run_func
unfunction run_func
unfunction un_mountdrive
unfunction clean_func
unfunction main_func
return 0

# vim: set et ts=2 sw=2 ft=zsh:
