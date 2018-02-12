source ~/.zshenv

ZSH_THEME="rkj-repos"
HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="true"

plugins=(nvm \
       zsh-nvm \
       command-not-found \
       common-aliases \
       git \
       github \
       history \
       node \
       npm \
       yarn)

if [[ "$(uname)" == "Darwin" ]]; then
    plugins+=(osx)
elif [[ "$(expr substr $(uname -s) 1 5)" == "Linux" ]]; then
    plugins+=(debian)
fi

plugins+=(zsh-autosuggestions zsh-better-npm-completion zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh
