#!/bin/bash
set -e  # stop script execution on error
set -u # stop script execution if undefined variables are encountered
set -o pipefail # set piped command error code to last error code

OLD_BROWSER='Pale Moon'
NEW_BROWSER='google-chrome'
MIME_APPS="$HOME/.config/mimeapps.list"
PROFILE=""

while getopts ":o:n:vm:c:" opt; do
  case ${opt} in
    o) OLD_BROWSER=${OPTAGRG} ;;
    n) NEW_BROWSER=${OPTARG} ;;
    v) VERBOSE=TRUE ;;

    :) echo "Invalid option: -$OPTARG requires an argument" 1>&2 && exit 1 ;;
    \?)  echo "Invalid option: -$OPTARG" 1>&2 && exit 1 ;;
  esac
done

log() {
  if [ -n "$VERBOSE" ]; then echo "$1"; fi
}

log "Replacing $OLD_BROWSER with $NEW_BROWSER is mimeapps.list"

sed -i "s/$OLD_BROWSER/$NEW_BROWSER/g" "$HOME/.config/mimeapps.list"

xdg-settings set default-web-browser "$NEW_BROWSER.desktop"



