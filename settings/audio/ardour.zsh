#!/usr/bin/env zsh

source "${ZDOTDIR}/cron/lib/task-logger/task-logger.sh"

export ARDOUR_SOURCE="${HOME}/AudioApplications/DAWs/ardour"

function build_ardour() {
  if [[ "$PWD" != "$ARDOUR_SOURCE" ]]; then
    info "Ardour source directory: "
    error "Not located in ardour source directory."
  fi

  info "Configuring build..."
  ./waf configure

  info "Building..."
  ./waf
}

function ardour() {
  local -a update_deps help vers usage
  zparseopts -D -E \
    b=build -build=build \
    d=update_deps -dependencies=update_deps \
    h=help -help=help \
    v=vers -version=vers \
    \?=usage -usage=usage \
    u=upgrade -upgrade=upgrade -update=upgrade

  # Update Ardour System Dependencies with Pacman
  if [[ $+update_deps[1] -eq 1 ]]; then
    typeset -U -a pacman_deps
    local pacman_deps=(
      'atk' 'cairo' 'dbus' 'fftw' 'fontconfig' 'gdk-pixbuf2'
      'glib2' 'glibc' 'gtk2' 'gtkmm' 'harfbuzz' 'libaubio.so=5-64'
      'libarchive.so=13-64' 'libcurl.so=4-64' 'libFLAC.so=8-64'
      'libfreetype.so=6-64' 'liblo.so=7-64' 'liblrdf.so=2-64'
      'liblilv-0.so=0-64' 'libogg' 'libreadline.so=8-64' 'librubberband.so=2-64'
      'libsamplerate' 'libserd-0.so=0-64' 'libsord-0.so=0-64'
      'libsratom-0.so=0-64' 'libsuil-0.so=0-64' 'libusb-1.0.so=0-64'
      'libvamp-hostsdk.so=3-64' 'libvamp-sdk.so=2-64' 'libx11' 'libxml2' 'pango'
      'taglib'
    ) # Note: List last updated: 2019-11-28

    $(sudo pacman '-Syyyu' '--needed' '--noconfirm') \
      && $(sudo pacman '-S' $pacman_deps[@] '--needed' '--noconfirm') \
      && ok \
      || ko

    finish
  fi

  # Build Ardour
  if [[ $+build[1] -eq 1 ]]; then
    PREV_WD="$PWD"

    info "Moving to ardour source directory..."
    cd "${ARDOUR_SOURCE}" && ok || ko

    build_ardour && ok || ko

    info "Returning to previous working directory..."
    cd "${PREV_WD}" && ok || ko

    good "Successfully built ardour."

    finish
  fi

  # Print version
  if [[ $+vers[1] -eq 1 ]]; then
    good "Ardour major version: 5"
  fi

  # Show help
  if [[ $+help[1] -eq 1 ]]; then
    echo -e $(
      cat << 'END'
Ardour helper function written by Ashton Hellwig <ahellwig.dev@gmail.com>\n
Usage:\n
ardour [-d|--dependencies] [-h|--help] [-?|--usage] [-v|--version]\n
\t[-b|--build] [-u|--upgrade|--update]\n
--build\t-b\t\tBuild the ardour application located at ${ARDOUR_SRC}\n
--dependencies\t-d\t\tUpdate Ardour system (pacman) dependencies\n
--help\t\t-h\t\tShow help\n
--update\t-u\t\tPull upstream changes and recompile ardour\n
--upgrade\t-u\t\tPull upstream changes and recompile ardour\n
--usage\t-?\t\tShow help\n
--version\t-v\t\tShow version
END
    )
  fi
}
