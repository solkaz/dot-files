# Path to your oh-my-zsh installation.
export ZSH=/home/solkaz/.oh-my-zsh
ZSH_THEME="rkj-repos"
HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="true"

export CONFIG_DIR=~/Config

export SH_CONFIG_DIR=$CONFIG_DIR/zsh
source $SH_CONFIG_DIR/functions.zsh
source $SH_CONFIG_DIR/aliases.zsh

# Make emacs the default editor
export EDITOR="emacs"
export NVM_LAZY_LOAD=true


plugins=(nvm zsh-nvm command-not-found common-aliases debian git github \
         history node npm pip python zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh
unsetopt correct_all
setopt correct
