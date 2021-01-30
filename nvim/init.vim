" init.vim

" Map the leader key
let mapleader = "\<Space>"

" General Settings
source $HOME/Dotfiles/nvim/plugins.vim
source $HOME/Dotfiles/nvim/settings.vim
source $HOME/Dotfiles/nvim/functions.vim
source $HOME/Dotfiles/nvim/mappings.vim

" Plugin Configurations
source $HOME/Dotfiles/nvim/plug-config/coc/coc.vim
source $HOME/Dotfiles/nvim/plug-config/coc/coc-extensions.vim
source $HOME/Dotfiles/nvim/plug-config/fzf.vim
source $HOME/Dotfiles/nvim/plug-config/which-key.vim
source $HOME/Dotfiles/nvim/plug-config/sneak.vim
source $HOME/Dotfiles/nvim/plug-config/quickscope.vim
