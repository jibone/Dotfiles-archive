set tabstop=4
set softtabstop=4
set shiftwidth=4

" textmate like set invisibles.
" ctrl-v u25b8 for ▸ and ctrl-v u00ac for ¬
set listchars=tab:▸\ ,eol:¬
"set list

set nohls
set incsearch
set showcmd
set nowrap
set number
set autoindent
set smartindent

syntax on
filetype on
filetype indent on
filetype plugin on

set background=dark
colorscheme solarized

" pathogen stuff
call pathogen#infect()

" remove tool bar from GUI
if has("gui_running")
	set guioptions=-t
endif

