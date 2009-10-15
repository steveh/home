# Append slash to tab-completed symlink directories
set mark-symlinked-directories on

# Don't ring bell
set bell-style none

# Ignore case for tab completion
set completion-ignore-case on

# Use vi editing mode
set editing-mode vi
# set keymap vi

# Append slash to directories
set mark-directories on

# Don't bell, just show suggestions
set show-all-if-ambiguous on

#set input-meta on
#set output-meta on
#set enable-keypad on
#set visible-stats on

"\e[1~": beginning-of-line
"\e[4~": end-of-line
"\e[5~": beginning-of-history
"\e[6~": end-of-history
"\e[3~": delete-char
"\e[2~": quoted-insert
"\e[5C": forward-word
"\e[5D": backward-word
"\e\e[C": forward-word
"\e\e[D": backward-word