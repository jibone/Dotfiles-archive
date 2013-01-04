set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" textmate like set invisibles.
" ctrl-v u25b8 for ▸ and ctrl-v u00ac for ¬
set listchars=tab:▸\ ,eol:¬
set list

" folding settings
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1
set foldcolumn=0

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
colorscheme koehler

au BufNewFile,BufRead *.ejs set filetype=html

" pathogen stuff
call pathogen#infect()

" remove tool bar from GUI
if has("gui_running")
    set guioptions=-t
    set clipboard=unnamed
    set transparency=10
    colorscheme desert
endif

" switching buffers
function! MarkWindowSwap()
    let g:markedWinNum = winnr()
endfunction

function! DoWindowSwap()
    " mark destination
    let curNum = winnr()
    let curBuf = bufnr("%")
    exe g:markedWinNum . "wincmd w"
    "Switch to source and shuffle dest->source
    let markedBuf = bufnr( "%" )
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' curBuf
    "Switch to dest and shuffle source->dest
    exe curNum . "wincmd w"
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' markedBuf 
endfunction

nmap <silent> <leader>mw :call MarkWindowSwap()<CR>
nmap <silent> <leader>pw :call DoWindowSwap()<CR>
