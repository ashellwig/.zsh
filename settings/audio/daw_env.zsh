# daw_env
# @ashellwig
# Purpose: Provide access to various Digital Audio Workstations (DAWs) and set
# their parameters.

# Path to DAW Plugins

## Native Linux Plugins
export SYSTEM_LADSPA_PATH='/usr/lib/ladspa'
export SYSTEM_LV2_PATH='/usr/lib/lv2'
export SYSTEM_LXVST_PATH='/usr/lib/vst'
export SYSTEM_VST_PATH='/usr/lib/vst'

export LADSPA_PATH="${USER_LADSPA_PATH:-$SYSTEM_LADSPA_PATH}"
export LV2_PATH="${USER_LV2_PATH:-$SYSTEM_LV2_PATH}"
export LXVST_PATH="${USER_LXVST_PATH:-$SYSTEM_LXSVT_PATH}"
export VST_PATH="${USER_VST_PATH:-$SYSTEM_LXVST_PATH}"

## Windows VST Plugins
export VST2_PATH='/home/ahellwig/.local/lib/vst2' # 32bit
export VST3_PATH='/home/ahellwig/.local/lib/vst3' # 64bit

# vim: set et ts=2 sw=2 ft=zsh:
