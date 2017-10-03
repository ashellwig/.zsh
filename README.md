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
* `./functions.d`
  * See [.zsh/functions.d/README.md]()
* `./options`
  * See [.zsh/options/README.md]()
* `./settings`
  * See [.zsh/settings/README.md]()

<!DOCTYPE html>
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta name="Ashton Hellwig" content="Made by 'tree'">
 <meta name="GENERATOR" content="$Version: $ tree v1.7.0 (c) 1996 - 2014 by Steve Baker, Thomas Moore, Francesc Rocher, Florian Sesser, Kyosuke Tokoro $">
  <!--
  BODY { font-family : ariel, monospace, sans-serif; }
  P { font-weight: normal; font-family : ariel, monospace, sans-serif; color: black; background-color: transparent;}
  B { font-weight: normal; color: black; background-color: transparent;}
  A:visited { font-weight : normal; text-decoration : none; background-color : transparent; margin : 0px 0px 0px 0px; padding : 0px 0px 0px 0px; display: inline; }
  A:link    { font-weight : normal; text-decoration : none; margin : 0px 0px 0px 0px; padding : 0px 0px 0px 0px; display: inline; }
  A:hover   { color : #000000; font-weight : normal; text-decoration : underline; background-color : yellow; margin : 0px 0px 0px 0px; padding : 0px 0px 0px 0px; display: inline; }
  A:active  { color : #000000; font-weight: normal; background-color : transparent; margin : 0px 0px 0px 0px; padding : 0px 0px 0px 0px; display: inline; }
  .VERSION { font-size: small; font-family : arial, sans-serif; }
  .NORM  { color: black;  background-color: transparent;}
  .FIFO  { color: purple; background-color: transparent;}
  .CHAR  { color: yellow; background-color: transparent;}
  .DIR   { color: blue;   background-color: transparent;}
  .BLOCK { color: yellow; background-color: transparent;}
  .LINK  { color: aqua;   background-color: transparent;}
  .SOCK  { color: fuchsia;background-color: transparent;}
  .EXEC  { color: green;  background-color: transparent;}
  -->
<body>
	<b class="NORM">.zsh</b><br>
	├── <b class="DIR">functions</b><br>
	│   ├── <b class="DIR">history-substring-search</b><br>
	│   ├── <b class="DIR">powerlevel9k</b><br>
	│   ├── <b class="DIR">zsh-completions</b><br>
	│   └── <b class="DIR">zsh-syntax-highlighting</b><br>
	├── <b class="DIR">functions.d<br>
	│   ├── <b class="DIR">edit_zsh.zsh</b><br>
	│   ├── <b class="DIR">makenewdir.zsh</b><br>
	│   ├── <b class="DIR">newexecfile.zsh</b><br>
	│   └── <b class="DIR">quicklyupdate.zsh</b><br>
	│   ├── <b class="DIR">school.zsh</b><br>
	│   ├── <b class="DIR">short_functions.zsh</b><br>
	│   └── <b class="DIR">updatezshfuncs.zsh</b><br>
	├── <b class="DIR">options</b><br>
	│   ├── <b class="NORM">aliases.zsh</b><br>
	│   ├── <b class="NORM">promptopts.zsh</b><br>
	│   └── <b class="NORM">zshopts.zsh</b><br>
	├── <b class="DIR">plugins</b><br>
	├── <b class="DIR">setttings<br>
	│   ├── <b class="DIR">completionsettings.zsh</b><br>
	│   ├── <b class="DIR">historysettings.zsh</b><br>
	│   ├── <b class="DIR">keybindings.zsh</b><br>
	│   └── <b class="DIR">programmingenvs.zsh</b><br>
	│   ├── <b class="DIR">syntaxhighlightsettings.zsh</b><br>
	├── <b class="NORM">.gitignore</b><br>
	├── <b class="NORM">.gitmodules</b><br>
	├── <b class="NORM">README.md</b><br>
	├── <b class="NORM">.zlogin</b><br>
	├── <b class="NORM">.zlogout</b><br>
	├── <b class="NORM">.zprofile</b><br>
	├── <b class="NORM">.zshenv</b><br>
	└── <b class="NORM">.zshrc</b><br>
	<br><br>
	</p>
	<p>
	<br><br>
	</p>
	<hr>
</body>
</html>
