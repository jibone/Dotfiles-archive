" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')
  " Keeping up to date with master
  Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

  " color scheme
  Plug 'chriskempson/base16-vim'

  " Airline
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " FZF and vim-rooter
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'airblade/vim-rooter'

  " Vim-surround
  " For surrounding things
  Plug 'tpope/vim-surround'

  " vim-fugitive
  " add git support
  Plug 'tpope/vim-fugitive'

  " vim-gitgutter
  " add git to the gutter
  Plug 'airblade/vim-gitgutter'

  " vim-endwise
  " wisely end stuff
  Plug 'tpope/vim-endwise'

  " vim-go
  " Adds go language support
  Plug 'fatih/vim-go'

  " vim-javascript
  " Better Javascript support
  Plug 'pangloss/vim-javascript'
  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript'
  Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
  Plug 'jparise/vim-graphql'
  Plug 'mxw/vim-jsx'

  " which key
  " to remind me of my keys
  Plug 'liuchengxu/vim-which-key'

  "  Sneak
  Plug 'justinmk/vim-sneak'
call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
