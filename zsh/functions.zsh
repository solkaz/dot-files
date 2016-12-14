function qemacs () {
    /usr/bin/emacs -nw -Q "$@"
}

# If emacs is invoked in the terminal, a new window isn't created
# nor does it load a desktop session
function temacs () {
    /usr/bin/emacs -nw --no-desktop "$@"
}


function woman () {
    qemacs --eval "(woman \"$1\")"
}

function mcd() {
    # Make a new directory and cd into it
    if [ -z "$1" ]
    then
	echo "missing folder name"
	return 1
    else
	new_dir="`pwd`/$1"
	if [ ! -d $new_dir ]
	then
	    mkdir -p $1 && cd $1
	else
	    echo "$new_dir already exists"
	    return 1
	fi
    fi
    return 0
}

function new_cpp() {
    if [ -z "$1" ]
    then
	echo "missing project name"
	return 1
    else
	mcd $1
	if [ $? -eq 0 ]
	then
	    mkdir src include
	    cp ~/Templates/Makefile ./Makefile
	    cp ~/Templates/main.cpp src/main.cpp
	    cd ..
	fi
    fi
    return 0
}

# Colorized man pages
function man() {
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

function is_root() {
    if [[ $(id -u) -ne 0 ]] ; then echo "Please run as root"  ; fi
}

function caps_to_ctrl() {
    setxkbmap -option ctrl:nocaps
    return 0
}
