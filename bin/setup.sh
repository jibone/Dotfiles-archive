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

if [ -f ~/.zshrc ] || [ -L ~/.zshrc ]; then
  echo "Backup zshrc file..."
  mv ~/.bashrc ~/Dotfiles/backup/zsh/zshrc
fi

echo "Link new zshrc "
ln -s ~/Dotfiles/zsh/zshrc ~/.zshrc

if [ -f ~/.yabairc ] || [ -L ~/.yabairc ]; then
  echo "Backup yabairc file..."
  mv ~/.bashrc ~/Dotfiles/backup/yabairc
fi

echo "Link new yabairc "
ln -s ~/Dotfiles/mac/yabairc ~/.yabairc


if [ -f ~/.skhdrc ] || [ -L ~/.skhdrc ]; then
  echo "Backup skhdrc file..."
  mv ~/.bashrc ~/Dotfiles/backup/skhdrc
fi

echo "Link new skhdrc "
ln -s ~/Dotfiles/zsh/skhdrc ~/.skhdrc

# Install bash scripts ---------------------------------------------------------
if [ ! -d ~/.bash_scripts ] || [ ! -L ~/.bash_scripts ]; then
  echo 'Create bash_scripts directory'
  mkdir ~/.bash_scripts
fi

echo "Link battery.sh"
ln -s ~/Dotfiles/bash/scripts/battery.sh ~/.bash_scripts/battery.sh

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

  if [ -f ~/.git_template ] || [ -L ~/.git_template ]; then
    echo "Backup git_template file"
    mv ~/.git_template ~/Dotfiles/backup/git/git_template
  fi

  echo "Link git_template files"
  ln -s ~/Dotfiles/git/git_template ~/.git_template
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

# Setup Hyper.js settings ----------------------------------------------------------
if hash hyper 2>/dev/null; then
  if [ -f ~/.hyper.js ] || [ -L ~/.hyper.js ]; then
    echo "Backup hyper.js"
    mv ~/.hyper.js ~/Dotfiles/backup/hyper/hyper.js
  fi

  echo "Link hyper.js file"
  ln -s ~/Dotfiles/hyper/hyper.js ~/.hyper.js
fi
