# =========================================
# ====== ENVIRONMENT VARIABLES ============
# =========================================
#
# +++++++++++++++ ENV +++++++++++++++++++++

IS_WORK=true

export IS_MAC=true
export VIM_CONFIG_DIR=$CUSTOM_CONFIG_SOURCE/vim
export VIM_RUNTIME_DIR=$CUSTOM_CONFIG_HOME/vim
export MYVIMRC=$VIM_CONFIG_DIR/.vimrc

# VIM INIT
export VIMINIT="source $MYVIMRC"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"


if [ $IS_MAC ]; then
    source "$CUSTOM_CONFIG_SOURCE/profile/.profile_mac"
fi

if [ $IS_WORK ]; then
    source "$CUSTOM_CONFIG_SOURCE/profile/.profile_work"
fi

# +++++++++++++++ /ENV +++++++++++++++++++++
#
# +++++++++++++++ NVM +++++++++++++++++++++

## Load NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# +++++++++++++++ /NVM +++++++++++++++++++++


source $(dirname $(gem which colorls))/tab_complete.sh

alias cls="colorls --light --sort-dirs --report"
alias clc="colorls --tree --light"

alias lsa="cls -a"

alias cph="pwd | pbcopy"
