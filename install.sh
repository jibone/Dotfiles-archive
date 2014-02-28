#!/bin/sh
#
# Install script will copy dot files to the right place.
# And backup previous files

echo "create backup folder"
mkdir backup

echo "install bash files"
cp ~/.bashrc backup/bashrc
rm ~/.bashrc
ln -s ~/Dotfiles/files/bashrc ~/.bashrc
cp ~/.bash_profile backup/bash_profile
rm ~/.bash_profile
ln -s ~/Dotfiles/files/bash_profile ~/.bash_profile

echo "install git files"
cp ~/.git-completion.bash backup/git-completion.bash
rm ~/.git-completion.bash
ln -s ~/Dotfiles/files/git-completion.bash ~/.git-completion.bash
cp ~/.git-prompt.sh backup/git-prompt.sh
rm ~/.git-prompt.sh
ln -s ~/Dotfiles/files/git-prompt.sh ~/.git-prompt.sh
cp ~/.gitignore_global backup/gitignore_global
rm ~/.gitignore_global
ln -s ~/Dotfiles/files/gitignore_global ~/.gitignore_global

echo "install vim files"
cp ~/.vimrc backup/vimrc
rm ~/.vimrc
ln -s ~/Dotfiles/files/vimrc ~/.vimrc
cp ~/.viminfo backup/viminfo
rm ~/.viminfo
ln -s ~/Dotfiles/files/viminfo ~/.viminfo
cp -r ~/.vim backup/vim
rm -rf ~/.vim
ln -s ~/Dotfiles/files/vim ~/.vim


