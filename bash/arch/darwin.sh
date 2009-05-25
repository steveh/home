export CLICOLOR=yes
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export MANPATH=/opt/local/share/man:$MANPATH

alias search="port search"
alias show="port info"
alias install="sudo port install"
alias update="sudo port selfupdate"

alias battery="ioreg -w0 -l | grep CurrentCapacity | cut -d \" \" -f 19"

if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi
