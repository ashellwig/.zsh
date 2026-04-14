# programmingenvs.zsh
# @ashellwig
# Purpose: Provide access to package manager attached to
#       programming environments

# --- Perl [Language] ---
# CPAN
## Environment Variables
#PATH="/home/ahellwig/perl5/bin${PATH:+:${PATH}}"; export PATH;
#PERL5LIB="/home/ahellwig/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
#PERL_LOCAL_LIB_ROOT="/home/ahellwig/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
#PERL_MB_OPT="--install_base \"/home/ahellwig/perl5\""; export PERL_MB_OPT;
#PERL_MM_OPT="INSTALL_BASE=/home/ahellwig/perl5"; export PERL_MM_OPT;

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
## >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/ashton.hellwig/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/ashton.hellwig/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/ashton.hellwig/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/ashton.hellwig/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
## Conda Completions
### Load Completions
fpath+=${ZDOTDIR}/functions/conda_zsh_completion
### Clean conda package cache
function conda-clear-zsh-cache() {
  if [[ -e "${ZDOTDIR}/.zcompcache" || -e "~/.zcompcache" ]]; then
    echo -e "\033[1;33mClearing conda from cache...\033[0m\n"
    sed -i '/^_conda/ d' "${ZDOTDIR}/.zcompcache" \
      || sed -i '/^_conda/ d' "~/.zcompcache"
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

# # --- Android [Environment] ---
# export ANDROID_SDK_ROOT="/home/ahellwig/Android/Sdk"
# export ANDROID_HOME="/home/ahellwig/Android/Sdk"

# --- Ruby [Language] ---
# RVM
# We have to source it last, so we will just use a variablet to configure
# whether or not to run its init script at the end of ../.zshrc
#export INIT_RVM_USER=false

# --- Homebrew [Package Manager] ---
# eval "$(/opt/homebrew/bin/brew shellenv)"

# --- Flutter [Framework] ---
## Check if already added to $PATH, if not, add it
# [[ ":$PATH:" != *":${HOME}/SDKs/flutter/bin:" ]] && PATH="${PATH}:${HOME}/SDKs/flutter/bin"

# --- Windows Development ---
# Config
# export DOTNET_ROOT='/usr/share/dotnet/sdk/9.0.105'
# export DOTNET_ROOT='/usr/share/dotnet'
# export DOTNET_CLI_TELEMETRY_OPTOUT=1
# export MSBuildSDKsPath="$(echo /usr/share/dotnet/sdk/9.0.105/Sdks)"

# vim: set et ts=2 sw=2 ft=zsh:
