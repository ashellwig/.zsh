#!/usr/bin/env zsh

function usbsf_info() {
	cat <<END
Here are the steps to perform the fix:
1. Running a command to load the usb-storage module in the linux kernel
2. (If needed) Unplug and Replug in your usb drive.
END
}

function usb_storage_fix() {
	local modules_needed=(
		'usb-storage' # External USB Drive (seagate)
		'sd_mod' # SD/MMC reader
	)

	if [[ "${EUID}" -ne 0 ]]; then
		for i in "${modules_needed[@]}"; do
			sudo modprobe -av "$i"
		done
	else
		for i in "${modules_needed[@]}"; do
			modprobe -av "$i"
		done
	fi
}

#vim: set et ts=2 sw=2 ft=zsh:
