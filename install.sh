#!/bin/sh
#
# Install script will copy dot files to the right place.
# And backup previous files

mkdir backup
cp ~/.bashrc backup/bashrc
rm ~/.bashrc
ln -s files/bashrc ~/.bashrc
cp ~/.bash_profile backup/bash_profile
rm ~/.bash_profile
ln -s files/bash_profile ~/.bash_profile

