# Easy virtualenv activation
alias sv="source venv/bin/activate"

# Search ALL the aliases
alias asrch="alias | grep"

# Reload this config file
alias rzsh="source ~/.zshrc"

for alias_file in $SH_CONFIG_DIR/aliases/*.zsh
do
    source $alias_file
done
