# quicklyupdate.zsh
# Purpose: Update Parity and system in one function

quicklyupdate() {
  local parity_dir=/home/ahellwig/parity
  cd "${parity_dir}"
  git pull &&
  cargo build &&
  cargo build --release ;
  cd ${HOME} ;
  sudo pacman -Syu --noconfirm
  yaourt -Syua --noconfirm
}