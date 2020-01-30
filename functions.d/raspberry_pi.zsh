#######################################
#  Initiates an SSH connection to the Raspberry Pi using proper terminal.
# Globals:
#  None
# Arguments:
#  None
# Returns:
#  None
#######################################
ssh_raspberry_pi() {
  ssh "pi@192.168.0.10" -p22
}
