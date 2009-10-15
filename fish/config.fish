# Files you make look like rw-r--r
#umask 022

#set TZ Australia/Melbourne
#set LC_CTYPE en_NZ.UTF-8

# Global config
for p in ~/.config/fish/bin ~/.home/bin ~/.bin ~/bin
	if test -d $p
		set PATH $p $PATH
	end
end

# Architecture config
set arch (uname -s)
switch $arch
  case Linux
		. ~/.home/fish/arch/linux.fish
	case Darwin
		. ~/.home/fish/arch/darwin.fish
end

# Host config
set host (uname -n)

if test -f ~/.home/fish/host/$host.fish
	. ~/.home/fish/host/$host.fish
end

set fish_greeting ""
set -x CLICOLOR 1

function parse_git_branch
	sh -c 'git branch --no-color 2> /dev/null' | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
end

function parse_svn_revision
	sh -c 'svn info 2> /dev/null' | sed -n '/^Revision/p' | sed -e 's/^Revision: \(.*\)/\1/'
end

function fish_prompt -d "Write out the prompt"
	printf '%s%s@%s%s' (set_color magenta) (whoami) (hostname|cut -d . -f 1) (set_color normal) 

	# Color writeable dirs green, read-only dirs red
	if test -w "."
		printf ' %s%s' (set_color green) (prompt_pwd)
	else
		printf ' %s%s' (set_color red) (prompt_pwd)
	end

	# Print subversion revision
	if test -d ".svn"
		printf ' %s%s@%s' (set_color normal) (set_color cyan) (parse_svn_revision)
	end

	# Print git branch
	if test -d ".git"
		printf ' %s%s/%s' (set_color normal) (set_color cyan) (parse_git_branch)
	end
	printf '%s> ' (set_color normal)
end

. ~/.home/fish/aliases.fish

function cpi -d "Copy info"
	printf "%s@%s:%s/$argv\n" (whoami) (hostname) (pwd)
end