# daw_env
# @ashellwig
# Purpose: Provide access to various Digital Audio Workstations (DAWs) and set
# their parameters.

# Path to DAWs

## Ardour

source "${ZDOTDIR}/settings/audio/ardour.zsh"

# Path to DAW Plugins

## Environment Variables for Native Windows Plugins
export VST2_PATH='/home/ahellwig/AudioApplications/Plugins/vst2' # 32bit
export VST3_PATH='/home/ahellwig/AudioApplications/Plugins/vst3' # 64bit

## Native Linux Plugins (System-Wide Installation)
SYSTEM_DSSI_PATH='/usr/lib/dssi:/usr/local/lib/dssi'
SYSTEM_LADSPA_PATH='/usr/lib/ladspa:/usr/local/lib/ladspa'
SYSTEM_LV2_PATH='/usr/lib/lv2:/usr/local/lib/lv2'
SYSTEM_LXVST_PATH='/usr/lib/lxvst:/usr/local/lib/lxvst'
SYSTEM_VST_PATH='/usr/lib/vst:/usr/local/lib/vst'

## Native Linux Plugins (User-Wide Installation)
USER_DSSI_PATH="${HOME}/AudioApplications/Plugins/dssi"
USER_LADSPA_PATH="${HOME}/AudioApplications/Plugins/ladspa"
USER_LV2_PATH="${HOME}/AudioApplications/Plugins/lv2"
USER_LXVST_PATH="${HOME}/AudioApplications/Plugins/lxvst"
USER_VST_PATH="${HOME}/AudioApplications/Plugins/vst"

## Environment Variables for Native Linux Plugins
export DSSI_PATH="$SYSTEM_DSSI_PATH:$USER_DSSI_PATH"
export LADSPA_PATH="$SYSTEM_LADSPA_PATH:$USER_LADSPA_PATH"
export LV2_PATH="$SYSTEM_LV2_PATH:$USER_LV2_PATH"
export LXVST_PATH="$SYSTEM_LXVST_PATH:$USER_LXVST_PATH"
export VST_PATH="$SYSTEM_VST_PATH:$USER_VST_PATH"

# vim: set et ts=2 sw=2 ft=zsh:
