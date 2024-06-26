# programmingenvs.zsh
# @ashellwig
# Purpose: Provide access to package manager attached to
#       programming environments

# --- Perl [Language] ---
# CPAN
## Environment Variables
PATH="/home/ahellwig/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/ahellwig/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/ahellwig/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/ahellwig/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/ahellwig/perl5"; export PERL_MM_OPT;

# -- Rust [Language] --
# Sets default toolchain and location for the rustup installation.
# See $ZDOTDIR/site-functions/_rustup for completion definitions.
# export RUSTUP_HOME="$HOME/.rustup"
# source "${HOME}/.cargo/env"
# export PATH="$HOME/.cargo/bin:$PATH"
#if [[ "$(rustup show | grep -e '2020-03-19')" >/dev/null ]]; then
#  export RUSTUP_TOOLCHAIN='nightly-2020-03-19'
#else
#  export RUSTUP_TOOLCHAIN=''
#fi
#export RUST_SRC_PATH='/home/ahellwig/.rustup/toolchains/nightly-2020-03-19-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'
#export RUSTUP_DIST_SERVER='https://static.rust-lang.org'
#export RUSTUP_DIST_ROOT='https://static.rust-lang.org/dist'
#export RUSTUP_UPDATE_ROOT='https://static.rust-lang.org/rustup'

# --- WebAssembly [Library] ---
# EMSDK
# Source the EMSDK Environment
# alias emsenv="source ${HOME}/SDKs/emsdk/emsdk_env.sh --release"

# --- C/C++ [Language] ---
# Compiler Option
#export CC=clang
#export CXX=clang++
# Linking
## CUDA
# export CUDA_PATH='/usr/local/cuda'
# export PATH="$CUDA_PATH/bin{$PATH:+${PATH}}"
# export LD_LIBRARY_PATH="$CUDA_PATH/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}"
## Bioinformatics
#export NCBI_VDB_LIBDIR=/usr/local/ncbi/ncbi-vdb/lib64
#export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${NCBI_VDB_LIBDIR}"

# --- Go [Language] ---
# export LDFLAGS="${LDFLAGS}:-L/$HOME/SDKs/homebrew/opt/openssl@3/lib"
# export CPPFLAGS="${CPPFLAGS}:-I/$HOME/SDKs/homebrew/opt/openssl@3/include"
# GOPATH
# export GOPATH="$HOME/go"

# --- LaTeX [Language] ---
# export TEXDIR='/usr/local/texlive/2018'
# export TEXMFLOCAL='/usr/local/share/texmf:/usr/share/texmf'
# export TEXMFSYSVAR='/var/lib/texmf'
# export TEXMFSYSCONFIG='/etc/texmf'
# export TEXMFVAR="${HOME}/.texlive/texmf-var"
# export TEXMFCONFIG="${HOME}/.texlive/texmf-config"
# export TEXMFHOME="${HOME}/texmf"

# --- Python [Language] ---
# Conda
## Conda Initialize
#  __conda_setup="$(
#     '/home/ahellwig/anaconda3/bin/conda' 'shell.zsh' 'hook' \
#     2> /dev/null
# )"

# if [ $? -eq 0 ]; then
#   eval "$__conda_setup"
# else
#   if [ -f "/home/ahellwig/anaconda3/etc/profile.d/conda.sh" ]; then
#     . "/home/ahellwig/anaconda3/etc/profile.d/conda.sh"
#   else
#     export PATH="/home/ahellwig/anaconda3/bin:$PATH"
#   fi
# fi
# unset __conda_setup
## Conda Completions
### Load Completions
# fpath+=${ZDOTDIR}/functions/conda_zsh_completion
### Clean conda package cache
# function conda-clear-zsh-cache() {
#   if [[ -e "${ZDOTDIR}/.zcompcache" || -e "~/.zcompcache" ]]; then
#     echo -e "\033[1;33mClearing conda from cache...\033[0m\n"
#     sed -i '/^_conda/ d' "${ZDOTDIR}/.zcompcache" \
#       || sed -i '/^_conda/ d' "~/.zcompcache"
#   else
#     echo -e "\033[1;31m.zcompcache not found\033[0m"
#     return 0
#   fi
# }
# pip zsh completion
# function _pip_completion() {
#   local words cword
#   read -Ac words
#   read -cn cword
#   reply=($(COMP_WORDS="$words[*]" \
#     COMP_CWORD=$((cword - 1)) \
#     PIP_AUTO_COMPLETE=1 $words[1]))
# }
# compctl -K _pip_completion pip

# # --- Android [Environment] ---
# export ANDROID_SDK_ROOT="/home/ahellwig/Android/Sdk"
# export ANDROID_HOME="/home/ahellwig/Android/Sdk"

# --- Ruby [Language] ---
# RVM
# We have to source it last, so we will just use a variablet to configure
# whether or not to run its init script at the end of ../.zshrc
#export INIT_RVM_USER=false

# --- DotNet [Framework] ---
# export DOTNET_CLI_TELEMETRY_OPTOUT=1
# export MSBuildSDKsPath=$(echo /usr/share/dotnet/sdk/3.1.102/Sdks)
# export DOTNET_ROOT='/usr/share/dotnet/sdk/3.1.102'

# --- Homebrew [Package Manager] ---
# eval "$(/opt/homebrew/bin/brew shellenv)"

# --- Flutter [Framework] ---
## Check if already added to $PATH, if not, add it
# [[ ":$PATH:" != *":${HOME}/SDKs/flutter/bin:" ]] && PATH="${PATH}:${HOME}/SDKs/flutter/bin"

# --- Windows Development ---
# Config
# export DOTNET_ROOT='/usr/share/dotnet/sdk/8.0.104'
# export DOTNET_CLI_TELEMETRY_OPTOUT=1
# export MSBuildSDKsPath=$(echo /usr/share/dotnet/sdk/8.0.104/Sdks)

# vim: set et ts=2 sw=2 ft=zsh:
