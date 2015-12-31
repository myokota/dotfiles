#!/bin/sh
PWD=`pwd`

ln -fs $PWD/zshrc ~/.zshrc
ln -fs $PWD/tmux.conf ~/.tmux.conf
ln -fs $PWD/../vimrc ~/.vim_runtime
cd $PWD/../vimrc
git checkout myself
cd -
ln -fs $PWD/../vimrc ~/.vim_runtime
ln -fs $PWD/vimrc ~/.vimrc
