#!/bin/bash
cd ~

mkdir -p .backup
mkdir -p .ssh
mkdir -p .bin


# Bash
mv                .bashrc       .backup
ln -s ~/.home/bash/bashrc.sh    .bashrc

mv                .bash_profile .backup
ln -s ~/.home/bash/profile.sh   .bash_profile

mv                .profile      .backup
ln -s ~/.home/bash/profile.sh   .profile

mv                .bash_logout  .backup

mv                .inputrc      .backup

chmod 755 ~/.home/bash/*.sh
chmod 755 ~/.home/bash/complete/*.sh
chmod 755 ~/.home/bash/arch/*.sh
chmod 755 ~/.home/bash/host/*.sh


# Programs
mv                .caprc      .backup
ln -s ~/.home/prog/caprc  	  .caprc

mv                .gemrc      .backup
ln -s ~/.home/prog/gemrc  	  .gemrc

mv                .gitconfig  .backup
ln -s ~/.home/prog/gitconfig  .gitconfig

mv                .irbrc      .backup
ln -s ~/.home/prog/irbrc      .irbrc

mv                .my.cnf     .backup
ln -s ~/.home/prog/my.cnf     .my.cnf

mv                .s3conf     .backup
ln -s ~/.home/prog/s3conf     .s3conf

mv                .vimrc      .backup
ln -s ~/.home/prog/vimrc      .vimrc


# SSH
mv           .ssh/id_rsa      .backup
ln -s ~/.home/ssh/id_rsa      .ssh/id_rsa

mv           .ssh/id_rsa.pub  .backup
ln -s ~/.home/ssh/id_rsa.pub  .ssh/id_rsa.pub

chmod 600 ~/.home/ssh/*


# Programs

chmod 755 ~/.home/bin/*