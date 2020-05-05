# =========================================
# ====== ENVIRONMENT VARIABLES ============
# =========================================
#
# +++++++++++++++ ENV +++++++++++++++++++++


export VIM_CONFIG_DIR=$CUSTOM_CONFIG_SOURCE/vim
export VIM_RUNTIME_DIR=$CUSTOM_CONFIG_HOME/vim
export MYVIMRC=$VIM_CONFIG_DIR/.vimrc

export XDG_CONFIG_HOME=$CUSTOM_CONFIG_HOME
export XDG_CACHE_HOME=$CUSTOM_CACHE_HOME

# VIM INIT
export VIMINIT="source $MYVIMRC"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

export EDITOR=$(which vim);


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
export NVM_DIR="$CUSTOM_CONFIG_HOME/.nvm"

#[ ! -d $NVM_DIR ] && mkdir $NVM_DIR && curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# +++++++++++++++ /NVM +++++++++++++++++++++


# +++++++++++++++ Conky +++++++++++++++++++++

#source  $CUSTOM_CONFIG_SOURCE/conky/simple/init
#conky -c $CUSTOM_CONFIG_SOURCE/conky/simple/conky_maia
# +++++++++++++++ /Conky +++++++++++++++++++++
source $(dirname $(gem which colorls))/tab_complete.sh

alias cls="colorls --light --sort-dirs --report"
alias clc="colorls --tree --light"

alias lsa="cls -a"

