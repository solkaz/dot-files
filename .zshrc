# Path to your oh-my-zsh installation.
export ZSH=/home/solkaz/.oh-my-zsh
ZSH_THEME="rkj-repos"
HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="true"

export CONFIG_DIR=~/Config

sh_config_dir=$CONFIG_DIR/zsh
source $sh_config_dir/functions.zsh
source $sh_config_dir/aliases.zsh

# Make emacs the default editor
export EDITOR="emacs"

plugins=(command-not-found common-aliases debian git github \
         history node npm pip python zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh
