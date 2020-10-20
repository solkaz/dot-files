# Check that Stow is installed first
if ! [ -x "$(command -v stow)" ]; then
    echo 'Error: stow is not installed' >&2
    exit 1
fi

# Install dotfiles
stow {git,emacs,zsh,vim,tmux} --dotfiles -t ~

if [ ! -d ~/Programming ]; then
    mkdir ~/Programming
fi
