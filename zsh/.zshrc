export HYPHEN_INSENSITIVE="true"
export ENABLE_CORRECTION="true"

source $HOME/antigen.zsh
    
# Load the oh-my-zsh's library
antigen use oh-my-zsh
    
antigen bundle nvm
export NVM_LAZY_LOAD=true
antigen bundle lukechilds/zsh-nvm
antigen bundle command-not-found
antigen bundle common-aliases
antigen bundle git
antigen bundle github
antigen bundle history
antigen bundle node
antigen bundle npm
antigen bundle vscode
antigen bundle yarn
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle lukechilds/zsh-better-npm-completion
antigen bundle zsh-users/zsh-completions
if [[ "$(uname)" == "Darwin" ]]; then
    antigen bundle osx
elif [[ "$(expr substr $(uname -s) 1 5)" == "Linux" ]]; then
    antigen bundle debian
fi
antigen theme rkj-repos

antigen apply

source ~/.zshenv
