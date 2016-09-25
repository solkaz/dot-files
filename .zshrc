# Path to your oh-my-zsh installation.
export ZSH=/home/solkaz/.oh-my-zsh
ZSH_THEME="junkfood"
HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="true"
plugins=(command-not-found common-aliases debian git github history pip python zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# Make emacs the default editor
export EDITOR="emacs"

# If emacs is invoked in the terminal, a new window isn't created
alias emacs="emacs -nw --no-desktop"

# Shortcuts to edit config files
alias emacsconfig="$EDITOR ~/.emacs"
alias zshconfig="$EDITOR ~/.zshrc"
alias ohmyzsh="$EDITOR ~/.oh-my-zsh"
alias i3config="$EDITOR ~/.i3/config"

# Search ALL the aliases
alias aliasrch="alias | grep"

# Reload this config file
alias reloadzsh="source ~/.zshrc"

# Add global npm packages dir to PATH
export PATH=~/.npm-global/bin:$PATH

# Refer to python3 as "python3"
alias python3="python3.5"

# Pip shortcuts
alias pf="pip freeze"
alias pfr="pip freeze > requirements.txt"
alias pin="pip install"
alias pinr="pip install -r requirements.txt"
alias puin="pip uninstall"
alias psrch="pip search"

# Easy virtualenv activation
alias sv="source venv/bin/activate"

# Colorized man pages
man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;31m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
            man "$@"
}

alias start-react="
npm init -y && \
npm i --save react react-dom \
babel-core babel-loader babel-preset-es2015 babel-preset-react && \
npm i --save-dev webpack webpack-dev-server \
"

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
