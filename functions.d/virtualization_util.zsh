#######################################
#  Shows the boot logs to confirm IOMMU
#  was correctly enabled.
#######################################
function _vitualization_util_boot_logs() {
  dmesg --human --color=always | grep -i -e DMAR -e IOMMU
}

function _vitualization_util_iommu_mapping() {
  emulate sh -c 'shopt -s nullglob
for g in /sys/kernel/iommu_groups/*; do
    echo "IOMMU Group ${g##*/}:"
    for d in $g/devices/*; do
        echo -e "\t$(lspci -nns ${d##*/})"
    done;
done;'
}

virtualization_util() {
  readonly action=${1:?"Please specify log or iommu_mapping"}
  case $action in
    log)
      _vitualization_util_boot_logs
      ;;
    iommu_mapping)
      _vitualization_util_iommu_mapping
      ;;
    *)
      echo -e "\033[1;31mFailed\n\033[0m"
      ;;
  esac
}
