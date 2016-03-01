# vim: ft=zsh
#

s() {
  ./s "$@"
}

source ./_s
compdef _s s
