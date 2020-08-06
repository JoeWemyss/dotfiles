#!/bin/bash
set -e
set -u
set -o pipefail

LOCAL_CUSTOM_CONFIG_SOURCE=''
LOCAL_CUSTOM_CONFIG_HOME=''
DEFAULT_CONFIG_SOURCE="$HOME/dotfiles"
DEFAULT_CONFIG_HOME="$HOME/.config"
OPT=''
PARTS=''
VERBOSE=''

while getopts ":ht:c:s:v" opt; do
  case ${opt} in
  t)
    OPT=${OPTARG}
    ;;
  c)
    LOCAL_CUSTOM_CONFIG_SOURCE=${OPTARG}
    ;;
  s)
    LOCAL_CUSTOM_CONFIG_HOME=${OPTARG}
    ;;
  v)
    VERBOSE=true
    ;;
  h)
    echo "Usage:"
    echo "    -h      Display this help message"
    echo "    -t      Which config should be symlinked (options are i3 and i3status)"
    echo "    -c      Custom location where config should be symlinked to"
    echo "    -s      Custom location where configuration should be sourced from"
    exit 0
    ;;
  :)
    echo "Invalid option: -$OPTARG requires an argument" 1>&2
    exit 1
    ;;
  \?)
    echo "Invalid option: -$OPTARG" 1>&2
    exit 1
    ;;
  esac
done

shift $((OPTIND - 1))

log() {
  if [ -n "$VERBOSE" ]; then echo "$1"; fi
}

if [ -z "$OPT" ]; then
  log 'A target (-t) is required'
  exit 1
fi

if [ -z "$LOCAL_CUSTOM_CONFIG_SOURCE" ]; then
  log 'No custom config source provided, setting from environment'
  LOCAL_CUSTOM_CONFIG_SOURCE=${CUSTOM_CONFIG_SOURCE:-$DEFAULT_CONFIG_SOURCE}
  log "Local source is now $LOCAL_CUSTOM_CONFIG_SOURCE"
fi

if [ -z "$LOCAL_CUSTOM_CONFIG_HOME" ]; then
  log 'No custom config home provided, setting from environment'
  LOCAL_CUSTOM_CONFIG_HOME=${CUSTOM_CONFIG_HOME:-$DEFAULT_CONFIG_HOME}
  log "Local home is now $LOCAL_CUSTOM_CONFIG_HOME"
fi

symlink_i3() {
  symlink "$LOCAL_CUSTOM_CONFIG_HOME/i3/" "config" "$LOCAL_CUSTOM_CONFIG_SOURCE/i3/config"
}

symlink_i3status() {
  symlink "$LOCAL_CUSTOM_CONFIG_HOME/i3status/" "config" "$LOCAL_CUSTOM_CONFIG_SOURCE/i3/i3status.conf"
}

symlink_zsh() {
  symlink "$HOME/" ".zshrc" "$LOCAL_CUSTOM_CONFIG_SOURCE/shell/zshrc_template"
}

symlink_conky() {
  symlink "$LOCAL_CUSTOM_CONFIG_HOME/conky/" "conky.conf" "$LOCAL_CUSTOM_CONFIG_SOURCE/conky/custom/conkyrc"
}

symlink() {
  local destPath="$1"
  local destFilePath="$1$2"
  local src="$3"

  if ! [ -d "$destPath" ]; then
    log "creating $destPath"
    mkdir -p "$destPath"
  fi

  if [ -f "$destFilePath" ]; then
    rm "$destFilePath";
    log "deleting $destFilePath"
  fi

  log "linking $src -> $destFilePath"

  ln -s "$src" "$destFilePath"
}

if [ "$OPT" == 'all' ]; then
  PARTS=('i3' 'i3status' 'zsh' 'conky')
else
  # Split the targets into an array
  IFS=',' read -r -a PARTS <<<"$OPT"
fi

for element in "${PARTS[@]}"; do
  case ${element} in
  i3) symlink_i3 ;;
  i3status) symlink_i3status ;;
  zsh) symlink_zsh ;;
  conky) symlink_conky ;;
  esac
done
