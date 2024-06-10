backup_documents() {
  if [[ $(mount | grep -c /run/media/ahellwig/5a891670-3360-47ba-a42f-80c3bd7c7c6e) == 1 ]]; then
    sudo rsync \
      --delete \
      --partial \
      --info=progress2 \
      -aAXv \
      --exclude node_modules \
      --exclude '*.o' \
      --exclude '*.bin' \
      --exclude ML \
      --exclude anaconda3 \
      --exclude .cache \
      --exclude .android \
      --exclude .AndroidStudio3.5 \
      --exclude .aspera \
      --exclude .atom \
      --exclude .aws \
      --exclude .PlayOnLinux \
      --exclude .config \
      --exclude .dartServer \
      --exclude .cabal \
      --exclude .cargo \
      --exclude .cmake \
      --exclude .elm \
      --exclude .ghc \
      --exclude .hex \
      --exclude .matlab \
      --exclude NCBI \
      --exclude .julia \
      --exclude .cpan \
      --exclude .emscripten_ports \
      --exclude .gem \
      --exclude .gradle \
      --exclude .local/ \
      --exclude .emscripten_cache \
      --exclude .m2 \
      --exclude .zsh \
      --exclude .node-gyp \
      --exclude .vim/plugged \
      --exclude .vagrant.d \
      --exclude .nv \
      --exclude .stack \
      --exclude Matlab \
      --exclude MATLAB \
      --exclude .npm \
      --exclude .nvm \
      --exclude .nuget \
      --exclude .rustup \
      --exclude .rvm \
      --exclude .code \
      --exclude .vscode \
      --exclude SDKs \
      --exclude SomniExtractsLLC \
      /home/ahellwig/ \
      /run/media/ahellwig/5a891670-3360-47ba-a42f-80c3bd7c7c6e

    echo -e "\033[1;32mBackup Complete\033[0m"
  else
    echo -e "\033[1;31mDrive not mounted.\033[0m"
  fi
}
