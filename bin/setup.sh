#!/usr/bin/env bash

# ---------------------------------------------------------------
# Dotfiles by @jibone
# This file setups your machine with all the nessasary dotfiles
# ---------------------------------------------------------------

set -e

# Install bash_profile and bashrc -------------------------------
if [ -f ~/.bash_profile ]; then
  echo "Back up bash_profile file..."
  mv ~/.bash_profile ../backup/bash/bash_profile
fi

echo "Link new bash_profile"
ln -s ../bash/bash_profile ~/.bash_profile

if [ -f ~/.bashrc ]; then
  echo "Backup bashrc file..."
  mv ~/.bash_profile ../backup/bash/bashrc
fi

echo "Link new bashrc "
ln -s ../bash/bashrc ~/.bashrc

# Install git prompt and completion script -------------------------
if hash git 2>/dev/null; then
  if [ -f ~/.git-completion.bash ]; then
    echo "Backup git-completion.bash..."
    mv ~/.git-completion.bash ../backup/git/git-completion.bash
  fi

  echo "Link git-completion.bash file"
  ln -s ../git/git-completion.bash ~/.git-completion.bash

  if [ -f ~/.git-prompt.sh ]; then
    echo "Backup git-prompt.sh file..."
    mv ~/.git-prompt.sh ../backup/git/git-prompt.sh
  fi

  echo "Link git-prompt.sh file"
  ln -s ../git/git-prompt.sh ../backup/git/.git-prompt.sh
else
  echo "Git is not installed."
fi

# Install vimrc and vim plugins -----------------------------------
if hash vim 2>/dev/null; then
  if [ -d ~/.vim ]; then
    echo "Backup vim folder..."
    mv ~/.vim ../backup/vim/vim
  fi

  echo "Link vim files"
  ln -s ../vim/vim ~/.vim

  if [ -f ~/.vimrc ]; then
    echo "Backup vimrc..."
    mv ~/.vimrc ../backup/vim/vimrc
  fi

  echo "Link vimrc file"
  ln -s ../vim/vimrc ~/.vimrc
else
  echo "Vim is not installed."
fi
