#!/bin/bash
cd ~

mkdir -p .backup
mkdir -p .ssh
mkdir -p .bin

mv .bashrc         .backup
mv .bash_profile   .backup
mv .profile        .backup
mv .bash_logout    .backup
mv .inputrc        .backup
mv .gitconfig      .backup
mv .vimrc          .backup
mv .s3conf         .backup
mv .irbrc          .backup
mv .ssh/id_rsa     .backup
mv .ssh/id_rsa.pub .backup

ln -s ~/.home/bash/bashrc.sh  .bashrc
ln -s ~/.home/bash/profile.sh .bash_profile
ln -s ~/.home/bash/profile.sh .profile
ln -s ~/.home/prog/gitconfig  .gitconfig
ln -s ~/.home/prog/vimrc      .vimrc
ln -s ~/.home/prog/s3conf     .s3conf
ln -s ~/.home/prog/irbrc      .irbrc
ln -s ~/.home/ssh/id_rsa      .ssh/id_rsa
ln -s ~/.home/ssh/id_rsa.pub  .ssh/id_rsa.pub

chmod 600 ~/.home/ssh/*

chmod 755 ~/.home/*.sh
chmod 755 ~/.home/bash/*.sh
chmod 755 ~/.home/bash/complete/*.sh
chmod 755 ~/.home/bash/arch/*.sh
chmod 755 ~/.home/bash/host/*.sh
chmod 755 ~/.home/bin/*
