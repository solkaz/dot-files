# Path to your oh-my-zsh installation.
export ZSH=/home/solkaz/.oh-my-zsh
ZSH_THEME="junkfood"
HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="true"
plugins=(command-not-found common-aliases debian git github history node npm pip python)
source $ZSH/oh-my-zsh.sh

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"
export EDITOR="emacs"

alias zshconfig="sudo $EDITOR ~/.zshrc"
alias ohmyzsh="sudo $EDITOR ~/.oh-my-zsh"
alias emacs="emacs -nw"
alias sv="source venv/bin/activate"
alias aliasrch="alias | grep"
alias reloadzsh="source ~/.zshrc"

alias update-npm="sudo npm install -g npm"

# Pip aliases
alias pf="pip freeze"
alias pfr="pip freeze > requirements.txt"
alias pin="pip install"
alias pinr="pip install -r requirements.txt"
alias puin="pip uninstall"
alias plist="pip list"
alias psrch="pip search"

# Caps Lock -> Ctrl
setxkbmap -option ctrl:nocaps

