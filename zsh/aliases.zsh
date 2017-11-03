# Search ALL the aliases
alias asrch="alias | grep"

# Reload this config file
alias rzsh="source ~/.zshrc"

alias sme="source-map-explorer"

for alias_file in $SH_CONFIG_DIR/aliases/*.zsh
do
    source $alias_file
done
