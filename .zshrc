source ~/Config/.zshenv

ZSH_THEME="rkj-repos"
HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="true"

plugins=(nvm \
	     zsh-nvm \
	     command-not-found \
	     common-aliases \
	     debian \
	     git \
	     github \
             history \
	     node \
	     npm \
	     pip \
	     python \
	     zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh
