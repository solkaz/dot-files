# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh
# Make emacs the default editor
export EDITOR="emacs"
export NVM_LAZY_LOAD=true

export PROG_DIR=$HOME/Programming
export CONFIG_DIR=$HOME/Config

export GOPATH=$PROG_DIR/golang
export GOBIN=$GOPATH/bin
export GOPROJECTS=$GOPATH/src/github.com/solkaz
export PYENV_ROOT=$HOME/.pyenv


export SH_CONFIG_DIR=$CONFIG_DIR/zsh
source $SH_CONFIG_DIR/functions.zsh
source $SH_CONFIG_DIR/aliases.zsh

export PATH=$PATH:$GOPATH/bin:$PYENV_ROOT/bin
unsetopt correct_all
setopt correct
