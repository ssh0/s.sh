#!/bin/bash
# written by Shotaro Fujimoto (https://github.com/ssh0)
#
#=#=#=
# ```
# NAME
#       s - Search from terminal
#
# USAGE
#       s [-h|-l] <search_provider> <search queries>
#
# OPTIONS
#       -h    Show help message
#       -l    Show search providers list
#       -g    Force search in GUI browser
#
# ENVIRONMENT VARIABLE:
#       $BROWSERCLI     browser used in terminal
#       $BROWSER        GUI browser
# ```
#=#=

script_dir="$(builtin cd "$(dirname "${BASH_SOURCE:-${(%):-%N}}")" && pwd)"
script_file="${script_dir}/s"
providers="${script_dir}/providers"

# default: Google search, use $BROWSERCLI
url="https://www.google.com/search?q=%s"
gui=false

usage() {
  nl -w3 -s- -nln -d'#=' -ha -bn -fn "${script_file}" \
    | grep -ve '^\s\+' | cut -b7- | grep -v "\`\`\`"
}

list_providers() {
  local lists="$(grep -e "^# \"" "${providers}" | sed 's/\"//g' | cut -b3-)"
  if [[ "$1" = "zsh" ]]; then
    echo "${lists}" | awk -F ": " '{ printf("%s:%s\n",$1,$2) ;}'
  else
    echo "${lists}" | awk -F ": " '{ printf("%5s :%s\n",$1,$2) ;}'
  fi
}

while getopts glh OPT; do
  case $OPT in
    "g") gui=true ;;
    "l") list_providers "$2"; exit 0 ;;
    "h") usage; exit 0 ;;
      *) usage; exit 1 ;;
  esac
done

shift $((OPTIND-1))

while read l; do
  alis="$(echo "$l" | cut -d, -f1)"
  if [[ "$1" = ${alis} ]]; then
    url="$(echo "$l" | cut -d, -f2)"
    gui=$($gui || echo "$l" | cut -d, -f3)
    shift 1
    break
  fi
done < <(grep -Ev '^#|^$' "${providers}")

[[ -n "$1" ]] && query="$1" || {
    echo "At least one search term will be needed."; exit 1
    }

shift 1
for q in $@; do
  query="$query%20$q"
done

url="$(printf "$url" "$query")"

if $gui; then
  $BROWSER "$url" 2> /dev/null &
else
  if [[ -n "$TMUX" ]]; then
    if [[ $(tput cols) -gt 160 ]]; then
      tmux split-window -h -p 70 $BROWSERCLI "$url"
    else
      tmux new-window $BROWSERCLI "$url"
    fi
  else
    $BROWSERCLI "$url"
  fi
fi

