if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# -- start rip config -- #
RIPDIR=/Users/steve/.rip
RUBYLIB="$RUBYLIB:$RIPDIR/active/lib"
PATH="$PATH:$RIPDIR/active/bin"
export RIPDIR RUBYLIB PATH
# -- end rip config -- #
