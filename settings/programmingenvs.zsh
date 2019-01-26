# programmingenvs.zsh
# @ashellwig
# Purpose: Provide access to package manager attached to
#       programming environments

# --- Perl ---
# CPAN
## Environment Variables
export PERL5LIB="/home/ahellwig/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"
export PERL_LOCAL_LIB_ROOT="/home/ahellwig/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"
export PERL_MB_OPT="--install_base \"/home/ahellwig/perl5\""
export PERL_MM_OPT="INSTALL_BASE=/home/ahellwig/perl5"

# --- WebAssembly ---
# EMSDK
# Source the EMSDK Environment
alias emsenv="source ${HOME}/SDKs/emsdk/emsdk_env.sh --release"

# --- C/C++ ---
# Compiler Option
#export CC=gcc
#export CXX=g++

# --- Go ---
# GOPATH
export GOPATH="$HOME/go"

# --- Python ---
# Conda
source /home/ahellwig/anaconda3/etc/profile.d/conda.sh
## Conda Completions
### Load Completions
fpath+=${ZDOTDIR}/functions/conda_zsh_completion
autoload compinit && compinit conda
### Activate package cache
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion:*' cache-path "${ZDOTDIR}/.zcompcache"
### Clean conda package cache
function conda-clear-zsh-cache() {
  if [[ -e "${ZDOTDIR}/.zcompcache" || -e "~/.zcompcache" ]]; then
    echo -e "\033[1;33mClearing conda from cache...\033[0m\n"
    sed -i '/^_conda/ d' "${ZDOTDIR}/.zcompcache" ||
      sed -i '/^_conda/ d' "~/.zcompcache"
  else
    echo -e "\033[1;31m.zcompcache not found\033[0m"
    return 0
  fi
}
# pip zsh completion
function _pip_completion() {
  local words cword
  read -Ac words
  read -cn cword
  reply=($(COMP_WORDS="$words[*]" \
    COMP_CWORD=$((cword - 1)) \
    PIP_AUTO_COMPLETE=1 $words[1]))
}
compctl -K _pip_completion pip

# --- Android ---
ANDROID_SDK_ROOT="/home/ahellwig/SDKs/Android/Sdk"
ANDROID_HOME="/home/ahellwig/SDKs/Android/Sdk"

# --- Ruby ---
# RVM
#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# vim: set et ts=2 sw=2 ft=zsh:
