#!/usr/bin/zsh
# sysbackup.zsh
# Ashton Hellwig @ashellwig
# Purpose: Performs a full system backup using Rsync

# --- Global Variables ---
export build_dir="$HOME/tmp/BUILDS"

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
  # For production, replace '--dry-run' with '--info=flist2,name,progress'
  sudo rsync '-aAxXhHv' '--partial' '--delete' '--info=flist2,name,progress' --exclude-from="${build_dir}/rsync-exclude.txt" '/' '/mnt/backup'
}

# --- Clean Function ---
function clean_func() {
  cd ~
  rm '-rf' "${build_dir}"
}

# --- Call to Functions ---
function main_func() {
  print -f "\033[3;33m\nCreating Necessary Directories...\033[0m\n"
  pre_run_func &&

  print -f "\n\033[3;4;32mBeginning Backup\033[0m\n"
  run_func &&

  print -f "\n\033[3;33mRemoving Filelist...\033[0m\n"
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
unfunction pre_run_func
unfunction run_func
unfunction clean_func
unfunction main_func
return 0

# vim: set et ts=2 sw=2 ft=zsh:
