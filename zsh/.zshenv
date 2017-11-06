# Path to oh-my-zsh installation.
export ZSH=~/.oh-my-zsh
# Make emacs the default editor
export EDITOR="emacs"

export PROG_DIR=$HOME/Programming
export DOTFILES=$HOME/dotfiles

export SH_CONFIG_DIR=$DOTFILES/zsh
source $SH_CONFIG_DIR/functions.zsh
source $SH_CONFIG_DIR/aliases.zsh

# Load local zshenv, if it exists 
if [[ -f $SH_CONFIG_DIR/.zshenv_local ]]; then
    source $SH_CONFIG_DIR/.zshenv_local
fi
unsetopt correct_all
setopt correct
