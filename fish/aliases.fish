function cpi -d "Copy info"
	printf "%s@%s:%s/$argv\n" (whoami) (hostname) (pwd)
end

# # Useful default
# alias grep="grep --color=auto"
# 
# # Shortcuts
# alias cd..="cd .."
# alias ..="cd .."
# alias ...="cd ../.."
# alias ....="cd ../../.."
# alias c="clear"
# #alias s="screen -Rd"
# #alias l="less"
# #alias m="less"
# #alias x="clear && exit"
# #alias more="less"
# alias ll="ls -l"
# alias la="ls -A"
# alias dir="ls -C"
# alias root="sudo su -"
# 
# # Specific functions
# alias dum="du -h --max-depth=1"
# alias stats="cut -f1 -d\" \" ~/.bash_history | sort | uniq -c | sort -nr | head -n 50"
# 
# # Common misspellings
# alias mroe="more"
# alias pdw="pwd"
# alias sl="ls"
# 
# # CVS
# alias cvsup="cvs -q update -dPR"
# alias cvst="cvs -qn update"
# alias cvsdi="cvs -qn update | cut -c3- | xargs cvs -qn diff -w"
# alias cvsentries="find . -name Entries -print0 | xargs -0 grep -l CVS"
# alias cvsadd="cvs -qn update | grep ^? | cut -c3- | xargs cvs add"
# 
# # SVN
# alias ss="svn status"
# alias sd="svn diff"
# 
# # Rake
# alias ras="rake spec"
# alias raf="rake features"
# alias rasf="rake spec features"
# alias rar="rake routes"
# alias rat="rake -T"
# alias rdbm="rake db:migrate"
# 
# # Rails
# alias sc="ruby script/console"
# alias scpr="RAILS_ENV=production ruby script/console"
# 
# # Git
# alias gc="git commit"
# alias gca="git commit -a"
# alias ga="git add"
# alias gs="git status"
# alias gd="git diff"
# alias gp="git push"
# alias gpo="git push origin"
# alias gpom="git push origin master"
# alias gu="git pull"
# alias guo="git pull origin"
# alias guom="git pull origin master"
# 
# # Capistrano
# alias cpd="cap deploy"
# 
# # Misc
# alias sshsync="rsync -vrlxhz --progress -e ssh"

# Search for processes
function psgrep
	ps aux | grep $1 | grep -v grep
end

# SQL dump
function mydump
	mysqldump -uroot -p --opt $1 | bzip2 > $1.sql.bz2
end

# Clean mac files
# function mac
# 	for i in `find . -regex ".*\._.*"`; do rm $i; echo "rm $i"; done
# end

# Compress the cd, ls -l series of commands.
# alias lc="cl"
# function cl
# 	if [ $# = 0 ]; then
# 		cd && ll
# 	else
# 		cd "$*" && ll
#  	fi
# end