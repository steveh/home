#export MANPATH=/opt/local/share/man:$MANPATH

for p in /opt/local/lib/postgresql84/bin /opt/local/lib/mysql5/bin /opt/local/apache2/bin /opt/local/sbin /opt/local/bin
	if test -d $p
		set PATH $p $PATH
	end
end

# alias search="port search"
# alias show="port info"
# alias install="sudo port install"
# alias update="sudo port selfupdate"

# Textmate defaults to /usr/bin/mate, but let's check for /usr/local/bin/mate
if test -f "/usr/local/bin/mate"
	set -x EDITOR "/usr/local/bin/mate -w"
else
	set -x EDITOR "/usr/bin/mate -w"
end

# /opt/local/lib/postgresql84/bin/pg_ctl -D /opt/local/var/db/postgresql84/defaultdb -l logfile start

set BROWSER open