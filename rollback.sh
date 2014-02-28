#!/bin/sh
#
# Restore backup files.
#

rm ~/.bashrc
cp backup/bashrc ~/.bashrc
rm ~/.bash_profile
cp backup/bash_profile ~/.bash_profile

