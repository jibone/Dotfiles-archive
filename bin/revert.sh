#!/usr/bin/env bash

# ---------------------------------------------------------------
# Dotfiles by @jibone
# This file reverts the changes made when running setup.sh
# ---------------------------------------------------------------

# Reverts bash_profile and bashrc -------------------------------
if [ -f ../backup/bash/bash_profile ]; then
  echo "Revert bash_profile from backup..."
  mv ~/Dotfiles/backup/bash/bash_profile ~/.bash_profile
fi

if [ -f ../backup/bash/bashrc ]; then
  echo "Revert bashrc from backup..."
  mv ~/Dotfiles/backup/bash/bashrc ~/.bashrc
fi

# Reverts git prompt and git completion -------------------------
if [ -f ../backup/git/git-completion.bash ]; then
  echo "Revert git-completion.bash from backup..."
  mv ~/Dotfiles/backup/git/git-completion.bash ~/.git-completion.bash
fi

if [ -f ../backup/git/git-prompt.sh ]; then
  echo "Revert git-prompt.sh from backup..."
  mv ~/Dotfiles/backup/git/git-prompt.sh ~/.git-prompt.sh
fi

# Revert vimrc and vim folder -----------------------------------
if [ -d ../backup/vim/vim ]; then
  echo "Revert vim folder from backup..."
  mv ~/Dotfiles/backup/vim/vim ~/.vim
fi

if [ -f ../backup/vim/vimrc ]; then
  echo "Revert vimrc from backup..."
  mv ~/Dotfiles/backup/vim/vimrc ~/.vimrc
fi

# Revert tmux settings ------------------------------------------
if [ -f ../backup/tmux/tmux.conf ]; then
  echo "Revert tmux.conf from backup"
  mv ~/Dotfiles/backup/tmux/tmux.conf ~/.tmux.conf
fi
