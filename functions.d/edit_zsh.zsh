# newexecfile.zsh
# Purpose: Easily edit .zsh from terminal or X

edit_zsh() {
	# Variables
	local use_code=false
	local use_vim=false
	local key="$1"
	local help_msg="$(
		cat <<END
\033[1;33mLoads the configuration for .zsh in either VSCODE or VIM \033[0m
\033[1mPurpose:  \033[0mQuickly edit zsh config
\033[1mMaintained by:  \033[0;32mAshton Hellwig \033[0;4m<hellwigasthon@gmail.com>
\033[0;1mUsage: \033[0m edit_zsh [-v] [-c] [-h]
\033[1m
Option                         Purpose
------------------------------------------------------\033[0m
-v                            use Vim
-c                            use Visual Studio Code
-h                            show this help and exit
END
	)"

	# Option Case
	case $key in
	-h)
		echo "${help_msg}"
		return 1
		;;
	-v)
		local use_vim=true
		local use_code=false
		;;
	-c)
		local use_vim=false
		local use_code=true
		;;
	*) ;;

	esac

	# Parse Options
	if [[ "$use_vim" = true ]]; then
		cd "${HOME}/.zsh"
		vim '+NERDTree'
	elif [[ "$use_code" = true ]]; then
		cd "${HOME}/.zsh"
		if [[ "$(echo which code)" == "" ]]; then
		  code-insiders .
    else
      code .
    fi
		exit "$0"
	fi
	## Fail if $#>1
	if [[ "$#" != 1 ]]; then
		echo -e "\033[1;31mNot enough/too many arguments!\033[0m See \"${0}\" -h for details"
	fi
}

# vim: set et ft=zsh ts=2 sw=2:
