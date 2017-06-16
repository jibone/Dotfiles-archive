" Plugins makes vim fun

" Enable matchit
runtime macros/matchit.vim

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
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-rake'

" =============================================================================
" vim-textobj-rubyblock
" Make vim aware of ruby blocks
Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'

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
Plugin 'airblade/vim-gitgutter'

" =============================================================================
" ag.vim
" SilverSearcher the only way to search.
Plugin 'rking/ag.vim'

" =============================================================================
" goyo.vim
" Distraction free writing.
Plugin 'junegunn/goyo.vim'

" =============================================================================
" limelight.vim
" Hyperfocus writing in vim
Plugin 'junegunn/limelight.vim'

" =============================================================================
" nerdtree.vim
" When I need a directory tree view
Plugin 'scrooloose/nerdtree'

" Quick key binding for NERDTree
nnoremap <leader>n :NERDTree<CR>

" =============================================================================
" vim-endwise.vim
" Wisely end stuff
Plugin 'tpope/vim-endwise'

" =============================================================================
" vim-better-whitespace
" Better highlight trailing whitespaces
Plugin 'ntpeters/vim-better-whitespace'
highlight ExtraWhitespace ctermbg=blue


" =============================================================================
" vim-newcomplete.vim
" Code completion framework
Plugin 'shougo/neocomplete.vim'
let g:neocomplete#enable_at_startup = 1
autocmd FileType markdown,mkd NeoCompleteLock
autocmd FileType textile      NeoCompleteLock
autocmd FileType text         NeoCompleteLock


" =============================================================================
" vim-lexical
" building on vim's spell-check 
Plugin 'reedes/vim-lexical'


" =============================================================================
" vim-wordy
" Uncover usage problems in your writing
Plugin 'reedes/vim-wordy'

" =============================================================================
" List all plugin before this line
nmap <leader>pi :PluginInstall<cr>
call vundle#end()
filetype plugin indent on
