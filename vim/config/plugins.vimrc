" Plugins makes vim fun

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" =============================================================================
" CtrlP.vim
" The fuzzy file finder everybody loves.
Plugin 'ctrlpvim/ctrlp.vim'

" Make CtrlP use ag for listing the files. Way faster and no useless files.
let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
let g:ctrlp_use_caching = 0

" Map CtrlP to use buffer when needend
nmap <leader>b :CtrlPBuffer<cr>

" =============================================================================
" Surround.vim
" For surrounding things.
Plugin 'tpope/vim-surround'

" =============================================================================
" Repeat.vim
" You to want to repeat yourself.
Plugin 'tpope/vim-repeat'

" =============================================================================
" Commentary.vim
" For easy code commenting.
Plugin 'tpope/vim-commentary'

" =============================================================================
" vim-tmux-navigator
" Better navigation between vim and tmux.
Plugin 'christoomey/vim-tmux-navigator'

let g:tmux_navigator_save_on_switch = 1

" =============================================================================
" vim-tmux-runner
" Pass commans to tmux pane.
Plugin 'christoomey/vim-tmux-runner'

" =============================================================================
" vim-ruby
" Better programmer happiness.
Plugin 'vim-ruby/vim-ruby'

" =============================================================================
" vim-rails.vim
" Better rails project navigation
Plugin 'tpope/vim-rails'

" =============================================================================
" vim-rspec
" Make vim rspec aware.
Plugin 'thoughtbot/vim-rspec'

" Default test runner related
let g:rspec_command = "call VtrSendCommand('rspec {spec}')"

function! BundleExecRspecPath()
  let g:rspec_command = "call VtrSendCommand('bundle exec rspec {spec}')"
  echo "bundle exec rspec"
endfunc
nmap <leader>ber :call BundleExecRspecPath()<cr>

function! NormalRspecPath()
  let g:rspec_command = "call VtrSendCommand('rspec {spec}')"
  echo "rspec"
endfunc
nmap <leader>ner :call NormalRspecPath()<cr>

map <Leader>t :call RunCurrentSpecFile()<cr>
map <Leader>s :call RunNearestSpec()<cr>
map <Leader>l :call RunLastSpec()<cr>
map <Leader>a :call RunAllSpecs()<cr>
map <leader>f :VtrFocusRunner<cr>

" =============================================================================
" tabular.vim
" Making alignment fun.
Plugin 'godlygeek/tabular'

" =============================================================================
" vim-markdown
" Make vim understands markdown better.
Plugin 'plasticboy/vim-markdown'

" =============================================================================
" vim-css3-syntax
" Make vim understands CSS3 syntax better.
Plugin 'hail2u/vim-css3-syntax'

" =============================================================================
" scss-syntax.vim
" Make vim understands scss files better.
Plugin 'cakebaker/scss-syntax.vim'

" =============================================================================
" vim-fugitive
" Make vim awesome with git.
Plugin 'tpope/vim-fugitive'

" =============================================================================
" vim-gitgutter
" Get gitgutter.
"Plugin 'airblade/vim-gitgutter'

" =============================================================================
" ag.vim
" SilverSearcher the only way to search.
Plugin 'rking/ag.vim'

" =============================================================================
" goyo.vim
" Distraction free writing.
Plugin 'junegunn/goyo.vim'

" =============================================================================
" nerdtree.vim
" When I need a directory tree view
Plugin 'scrooloose/nerdtree'

" Quick key binding for NERDTree
nnoremap <leader>n :NERDTree<CR>

" =============================================================================
" List all plugin before this line
nmap <leader>pi :PluginInstall<cr>
call vundle#end()
filetype plugin indent on