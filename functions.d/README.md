# functions.d

## Usage

* [./edit_zsh.zsh](https://github.com/ashellwig/.zsh/blob/master/functions.d/edit_zsh.zsh)

Opens the $ZDOTDIR in either Visual Studio Code or Vim (My prefered editors)

```shell
edit_zsh [-v] [-c] [-h]
Option                        Purpose
-------------------------------------------------------
-v                            use Vim
-c                            use Visual Studio Code
-h                            show this help and exit
```

* [./makenewdir.zsh](https://github.com/ashellwig/.zsh/blob/master/functions.d/makenewdir.zsh)

Makes new directory by prompt

```shell
makenewdir
```

* [./newexecfile.zsh](https://github.com/ashellwig/.zsh/blob/master/functions.d/newexecfile.zsh)

Creates a new executable file. This is a script I was essentially using to
learn how to use options in shell scripts, so it is a bit messy.

```shell
newexecfile -f <filename> [-d <directory>] [-h]
Option                         Purpose
-------------------------------------------------------
-n         --name             filename to save as
-d         --directory        Directory to save to
-h         --help             show this help and exit
```

* [./quicklyupdate.zsh](https://github.com/ashellwig/.zsh/blob/master/functions.d/quicklyupdate.zsh)

Updates the system according to options. Very, very sloppy script.

```shell
quicklyupdate [-s|--system] [-z|--zsh] [-v|--vim] [-p|--parity] [-h|--help]
Short Option    Long Option                Use
------------------------------------------------------------
-h                     --help                     Show help and exit
-s                     --system                   update system (pacman and yaourt)
-z                     --zsh                      update zsh functions
-v                     --vim                      update vim plugins
-p                     --parity                   update parity (and rust)
-a                     --all                      update all
```