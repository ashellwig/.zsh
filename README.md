# .zsh
Drop-in config for .zsh

## Install
How to install depends on the method being used.

* With `yadm`
  * Assumes using `${HOME}/.yadm` as yadm repo
  * This .zsh is installed with [My Dotfiles](https://github.com/ashellwig/dotfiles)
```bash
yadm clone https://github.com/ashellwig/dotfiles
```

* Vanilla Zsh
```bash
export ZDOTDIR=~/.zsh
git clone https://github.com/ashellwig/.zsh.git ${ZDOTDIR}
```

## Features
* `./functions`
  * [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions/)
    * [Fish](http://fishshell.com/)-like fast/unobtrusive autosuggestions for zsh
    * It suggests commands as you type, based on command history.
  * [history-substring-search](https://github.com/zsh-users/zsh-history-substring-search)
    * Type in any part of any command from history and then press chosen keys,
    such as the UP and DOWN arrows, to cycle through matches in history
  * [powerlevel9k](https://github.com/bhilburn/powerlevel9k)
    * A prompt theme for .Zsh
      * If this is not found in the `${ZDOTDIR}`, then `prompt -s fade blue` is used.
  * [zsh-completions](https://github.com/zsh-users/zsh-completions)
    * This projects aims at gathering/developing new completion scripts that are
    not available in Zsh yet. The scripts may be contributed to the Zsh
    project when stable enough.
  * [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
    * This package provides syntax highlighing for the shell zsh. It enables
    highlighing of commands whilst they are typed at a zsh prompt into an
    interactive terminal.
  * [zsh-nvm](https://github.com/lukechilds/zsh-nvm)
    * nvm is an awesome tool but it can be kind of a pain to install and keep up
    to date. This zsh plugin allows you to quickly setup nvm once, save it in
    your dotfiles, then never worry about it again.
* `./functions.d`
  * See [.zsh/functions.d/README.md](https://github.com/ashellwig/.zsh/blob/master/functions.d/README.md)
* `./options`
  * See [.zsh/options/README.md]()
* `./settings`
  * See [.zsh/settings/README.md]()