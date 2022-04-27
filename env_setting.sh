#!/bin/sh

# bakcup
today=`date +%y%m%d`
mkdir ~/vim_bak_${today}
cp -r ~/.vim ~/vim_bak/
cp -r ~/.vimrc ~/vim_bak/

cp -r vim ~/.vim
cp -r vimrc ~/.vimrc
cp -r ./makecscope.sh /usr/local/bin/
