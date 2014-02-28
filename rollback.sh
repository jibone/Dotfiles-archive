#!/bin/sh
#
# Restore backup files.
#

echo "restore bash"
rm ~/.bashrc
cp backup/bashrc ~/.bashrc
rm ~/.bash_profile
cp backup/bash_profile ~/.bash_profile

echo "restore git"
rm ~/.git-completion.bash
cp backup/git-completion.bash ~/.git-completion.bash
rm ~/.git-prompt.sh
cp backup/git-prompt.sh ~/.git-prompt.sh
rm ~/.gitignore_global
cp backup/gitignore_global ~/.gitignore_global

echo "restore git"
rm ~/.vimrc
cp backup/vimrc ~/.vimrc
rm ~/.viminfo
cp backup/viminfo ~/.viminfo
rm ~/.vim
cp -r backup/vim ~/.vim
