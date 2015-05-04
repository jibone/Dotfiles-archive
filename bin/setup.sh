#!/usr/bin/env bash

# ------------------------------------------------------------------------------
# Dotfiles by @jibone
# This file setups your machine with all the nessasary dotfiles
# ------------------------------------------------------------------------------

# Install bash_profile and bashrc ----------------------------------------------
if [ -f ~/.bash_profile ] || [ -L ~/.bash_profile ]; then
  echo "Back up bash_profile file..."
  mv ~/.bash_profile ~/Dotfiles/backup/bash/bash_profile
fi

echo "Link new bash_profile"
ln -s ~/Dotfiles/bash/bash_profile ~/.bash_profile

if [ -f ~/.bashrc ] || [ -L ~/.bashrc ]; then
  echo "Backup bashrc file..."
  mv ~/.bashrc ~/Dotfiles/backup/bash/bashrc
fi

echo "Link new bashrc "
ln -s ~/Dotfiles/bash/bashrc ~/.bashrc

# Install inputrc --------------------------------------------------------------
# Not sure about this yet, but would like to keep it around.
#if [ -f ~/.inputrc ] || [ -L ~/.inputrc ]; then
#  echo "Backup inputrc file"
#  mv ~/.inputrc ~/Dotfiles/backup/bash/inputrc
#fi
#
#echo "Link new inputrc file"
#ln -s ~/Dotfiles/bash/inputrc ~/.inputrc

# Install git prompt and completion script -------------------------------------
if hash git 2>/dev/null; then
  if [ -f ~/.git-completion.bash ] || [ -L ~/.git-completion.bash ]; then
    echo "Backup git-completion.bash..."
    mv ~/.git-completion.bash ~/Dotfiles/backup/git/git-completion.bash
  fi

  echo "Link git-completion.bash file"
  ln -s ~/Dotfiles/git/git-completion.bash ~/.git-completion.bash

  if [ -f ~/.git-prompt.sh ] || [ -L ~/.git-prompt.sh ]; then
    echo "Backup git-prompt.sh file..."
    mv ~/.git-prompt.sh ~/Dotfiles/backup/git/git-prompt.sh
  fi

  echo "Link git-prompt.sh file"
  ln -s ~/Dotfiles/git/git-prompt.sh ~/.git-prompt.sh

  if [ -f ~/.gitignore_global ] || [ -L ~/.gitignore_global ]; then
    echo "Backup gitignore_global file..."
    mv ~/.gitignore_global ~/Dotfiles/backup/git/gitignore_global
  fi

  echo "Link gitignore_global file"
  ln -s ~/Dotfiles/git/gitignore_global ~/.gitignore_global
else
  echo "Git is not installed."
fi

# Install vimrc and vim plugins ------------------------------------------------
if hash vim 2>/dev/null; then
  if [ -d ~/.vim ] || [ -L ~/.vim ]; then
    echo "Backup vim folder..."
    mv ~/.vim ~/Dotfiles/backup/vim/vim
  fi

  echo "Link vim files"
  ln -s ~/Dotfiles/vim/vim ~/.vim

  if [ -f ~/.vimrc ] || [ -L ~/.vimrc ]; then
    echo "Backup vimrc..."
    mv ~/.vimrc ~/Dotfiles/backup/vim/vimrc
  fi

  echo "Link vimrc file"
  ln -s ~/Dotfiles/vim/vimrc ~/.vimrc
else
  echo "Vim is not installed."
fi

# Setup tmux settings ----------------------------------------------------------
if hash tmux 2>/dev/null; then
  if [ -f ~/.tmux.conf ] || [ -L ~/.tmux.conf ]; then
    echo "Backup tmux.conf"
    mv ~/.tmux.conf ~/Dotfiles/backup/tmux/tmux.conf
  fi

  echo "Link tmux.conf file"
  ln -s ~/Dotfiles/tmux/tmux.conf ~/.tmux.conf
fi
