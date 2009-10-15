# Files you make look like rw-r--r
umask 022

# Custom home
if [ -d ~/.home/bin ]; then
	PATH=$PATH:~/.home/bin
fi

# Local home
if [ -d ~/.bin ]; then
	PATH=~/.bin:$PATH
fi

# Old local home
if [ -d ~/bin ]; then
	PATH=~/bin:$PATH
fi

export PATH


# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Aliases
if [ -f ~/.home/bash/aliases.sh ]; then
	. ~/.home/bash/aliases.sh
fi


# Inputrc
#if [ -f ~/.home/bash/inputrc.sh ]; then
#	export INPUTRC=~/.home/bash/inputrc.sh
#fi

# Host completion
if [ -f ~/.home/hosts ]; then
	export HOSTFILE=~/.home/hosts
fi


export TZ=Australia/Melbourne
export LC_CTYPE=en_NZ.UTF-8

# Ignore same sucessive entries.
export HISTCONTROL=ignoreboth
export HISTFILESIZE=1000000000
export HISTSIZE=1000000

export EDITOR=vim
export VISUAL=vim
#export PAGER=less
#export LESS="-emR"

export PS1='\u@\h:\W\$ '


# check the window size after each command and, if necessary, update the values of LINES and COLUMNS.
shopt -s checkwinsize

# assumed to be the name of a variable whose value is the directory to change to. 
shopt -s cdable_vars

# minor errors in the spelling of a directory component in a cd command will be corrected
shopt -s cdspell

# attempt to perform hostname completion when a word containing a ‘@’ is being completed
shopt -s hostcomplete


case "$(uname -s)" in
	Linux)
		. ~/.home/bash/arch/linux.sh
	;;
	Darwin)
		. ~/.home/bash/arch/darwin.sh
	;;
esac

HOST="$(uname -n)"
if [ -f ~/.home/bash/host/$HOST.sh ]; then
	. ~/.home/bash/host/$HOST.sh
fi

#. ~/.home/bash/completions.sh
