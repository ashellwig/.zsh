# vim: set noet ts=2 sw=2 ft=zsh:

vue_vscode_settings() {
	if [[ ! -d "${PWD}/.vscode"	]]; then
		mkdir -p "${PWD}/.vscode"
	fi
	cat << END >> ./.vscode/settings.json
{
	"eslint.options": {
		"configFile": ".eslintrc.js",
  }
	"eslint.autoFixOnSave": true,
	"eslint.packageManager": "yarn",
	"eslint.validate": [
		"javascript",
		"javascriptreact",
		"vue"
	]
}
END
}

