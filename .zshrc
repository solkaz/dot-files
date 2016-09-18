# Path to your oh-my-zsh installation.
export ZSH=/home/solkaz/.oh-my-zsh
ZSH_THEME="dogenpunk"
HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="true"
plugins=(command-not-found common-aliases debian git github history pip python)
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

# inProject=0
# function chpwd() {
#     # If you weren't in the project folder already, check to see if you are
#     if [ inProject = 1 ]; then
# 	if [ $(pwd) != "home/solkaz/Programming/recruitr"* ]; then
# 	    deactivate
# 	    inProject=0
# 	fi
#     # You weren't in the projects folder; check to see if you
#     else
# 	if [[ *"/Programming/recruitr"* = $(pwd) ]]; then
# 	    inProject=1
# 	    sv
# 	fi
#     fi
# }
