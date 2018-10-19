# vim: set et ts=2 sw=2 ft=zsh:

addQuoteToLines() {
  sed -i '/^ *$/d;s/.*/"&"/' $1
}
