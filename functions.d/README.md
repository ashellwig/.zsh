# functions.d

## Usage

* [./edit_zsh.zsh]()
Opens the $ZDOTDIR in either Visual Studio Code or Vim (My prefered editors)

```shell
edit_zsh [-v] [-c] [-h]
Option                        Purpose
-------------------------------------------------------
-v                            use Vim
-c                            use Visual Studio Code
-h                            show this help and exit
```

* [./makenewdir.zsh]()
Makes new directory by prompt

```shell
makenewdir
```

* [./newexecfile.zsh]()
Creates a new executable file. This is a script I was essentially using to
learn how to use options in shell scripts, so it is a bit messy.

```shell
Option                         Purpose
-------------------------------------------------------
-n         --name             filename to save as
-d         --directory        Directory to save to
-h         --help             show this help and exit
```

* [./quicklyupdate.zsh]()

```shell
\033[1mShort Option    Long Option                Use\033[0m
\033[1m------------------------------------------------------------\033[0m
-h                     --help                     Show help and exit
-s                     --system                   update system (pacman and yaourt)
-z                     --zsh                      update zsh functions
-v                     --vim                      update vim plugins
-p                     --parity                   update parity (and rust)
-a                     --all                      update all
```