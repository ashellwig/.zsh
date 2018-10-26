#!/bin/bash

dev=$(readlink -m $1)

# test for block/character device
if [ -b "$dev" ]; then
  mode=block
elif [ -c "$dev" ]; then
  mode=char
else
  echo "$dev is not a device file" >&2
  exit 1
fi

# stat outputs major/minor in hex, convert to decimal
data=( $(stat -c '%t %T' $dev) ) || exit 2
major=$(( 0x${data[0]} ))
minor=$(( 0x${data[1]} ))

echo -e "Given device:     $1"
echo -e "Canonical device: $dev"
echo -e "Major: $major"
echo -e "Minor: $minor\n"

# sometimes nodes have been created for devices that are not present
dir=$(readlink -f /sys/dev/$mode/$major\:$minor)
if ! [ -e "$dir" ]; then
  echo "No /sys entry for $dev" >&2
  exit 3
fi

# walk up the /sys hierarchy one directory at a time
# stop when there are three levels left 
while [[ $dir == /*/*/* ]]; do

  # it seems the directory is only of interest if there is a 'uevent' file
  if [ -e "$dir/uevent" ]; then
    echo "$dir:"
    echo "  Uevent:"
    sed 's/^/    /' "$dir/uevent"

    # check for subsystem link
    if [ -d "$dir/subsystem" ]; then
        subsystem=$(readlink -f "$dir/subsystem")
        echo -e "\n  Subsystem:\n    ${subsystem##*/}"
    fi

    echo
  fi

  # strip a subdirectory
  dir=${dir%/*}
done

#vim: set et ts=2 sw=2 ft=sh:
