####################################################
# short_functions                                 ##
# @ashellwig                                      ##
# Purpose: Functions too small to deserve their   ##
#    own files                                    ##
####################################################

# Perform a Full Backup with Rsync
function full_backup() {
  print -f "[3;33m\nMounting..[0m"
  sudo mount /dev/sdb2 /mnt/FULL_BACKUP
  print -f "[3;33m\nExecuting backup command...[0m"
  sudo rsync '-aAX' '--info=progress2' '--stats' '--delete' "--exclude=/home/ahellwig/*" "--exclude=/dev/*" "--exclude=/proc/*" "--exclude=/sys/*" "--exclude=/tmp/*" "--exclude=/run/*" "--exclude=/mnt/*" "--exclude=/media/*" "--exclude=/lost+found/*" / /mnt/FULL_BACKUP
  print -f "[3;33m\nUnmounting device...[0m"
  sudo umount --force /dev/sdb2
  print -f "[1;32m\nBackup Complete![0m"
}

# Create a New Executable File
function new_exec_file() {
  cat <<EOF
   This will create a new executable file.
  Please enter the filename, including extension
  If the file exists, the command exits.
EOF
  read fileinputname
  if [[ ! -e ${fileinputname} ]]; then
    touch ${fileinputname}
    chmod +x ${fileinputname}
    vim ${fileinputname}
  elif [[ -e ${fileinputname} ]]; then
    print "File exists. Exiting."
    return 0
  fi
}

# vim: set et ts=2 sw=2:
