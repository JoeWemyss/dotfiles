#!/bin/bash

# SET UP DEFAULT LOCATIONS
DEFAULT_CONFIG_LOCATION="$HOME/.config/"
DEFAULT_OH_MY_ZSH_LOCATION="${ZSH:-$DEFAULT_CONFIG_LOCATION/oh-my-zsh}"
DEFAULT_CUSTOM_LOCATION="${ZSH_CUSTOM:-$DEFAULT_OH_MY_ZSH_LOCATION/custom}"
DEFAULT_PLUGIN_LOCATION="${ZSH_CUSTOM:-$DEFAULT_CUSTOM_LOCATION/plugins}"
DEFAULT_THEME_LOCATION="${ZSH_CUSTOM:-$DEFAULT_CUSTOM_LOCATION/themes}"

# Parse options
while getopts ":l:p:t:n" opt; do
  case ${opt} in
  l) LOCAL_CONFIG_LOCATION=${OPTARG} ;;
  n) NO_OH_MY_ZSH=TRUE ;;
  p) LOCAL_PLUGIN_LOCATION=${OPTARG} ;;
  t) LOCAL_THEME_LOCATION=${OPTARG} ;;
  :) echo "Invalid Option: -$OPTARG requires an argument" 1>&2 && exit 1 ;;
  \?) echo "Invalid Option: -$OPTARG" 1>&2 && exit 1 ;;
  esac
done

shift $((OPTIND - 1))

[ -z $NO_OH_MY_ZSH ] && ZSH="${LOCAL_CONFIG_LOCATION:-$DEFAULT_OH_MY_ZSH_LOCATION}" KEEP_ZSHRC='yes' sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

THEMES=${LOCAL_THEME_LOCATION:-$DEFAULT_THEME_LOCATION}

[ ! -d "$THEMES" ] && mkdir -p "$THEMES"

if [ ! -d "$THEMES/spaceship-prompt" ]; then
  git clone https://github.com/denysdovhan/spaceship-prompt.git "$THEMES/spaceship-prompt"
  ln -s "$THEMES/spaceship-prompt/spaceship.zsh-theme" "$THEMES/spaceship.zsh-theme"
fi

PLUGINS=${LOCAL_PLUGIN_LOCATION:-$DEFAULT_PLUGIN_LOCATION}

[ ! -d "$PLUGINS" ] && mkdir -p "$PLUGINS"

[ ! -d "$PLUGINS/zsh-autosuggestions" ] && git clone https://github.com/zsh-users/zsh-autosuggestions "$PLUGINS/zsh-autosuggestions"

[ ! -d "$PLUGINS/zsh-syntax-highlighting" ] && git clone https://github.com/zsh-users/zsh-syntax-highlighting "$PLUGINS/zsh-syntax-highlighting"


