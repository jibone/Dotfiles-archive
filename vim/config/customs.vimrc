" Custom functions

" I sometime work on a project with 120 is the colum width,
" and most of the time I prefer the 80 column width.
" This function toggles the columwidth highlighting.
function! ColumnWidthToggle()
  if(&textwidth == 120)
    set textwidth=80
  else
    set textwidth=120
  endif
endfunc
set textwidth=80
set colorcolumn=+1

nnoremap <leader>ce :call ColumnWidthToggle()<cr>

:hi CursorLine   cterm=NONE ctermbg=black guibg=black guifg=white
:hi CursorColumn cterm=NONE ctermbg=black guibg=black guifg=white
:hi QuickFixLine term=underline ctermbg=0 guifg=white guibg=black
:hi Normal guibg=NONE ctermbg=NONE

" Toggle cursorline
function! CursorLineToggle()
  set cursorline!
endfunc

nnoremap <leader>cl :call CursorLineToggle()<cr>

" Toggle cursorcolumn
function! CursorColumnToggle()
  set cursorcolumn!
endfunc

nnoremap <leader>cc :call CursorColumnToggle()<cr>

" Toggle between relative line numbering and normal line numbering
function! LineNumToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc

nnoremap <leader>rl :call LineNumToggle()<cr>

" Initialize lexical for certain file type
augroup lexical
  autocmd!
  autocmd FileType markdown,mkd call lexical#init()
  autocmd FileType textile      call lexical#init()
  autocmd FileType text         call lexical#init()
augroup END

" Merge Tab Horizontally
function! MergeTab(angle)
  " Check if we are on the first tab
  if tabpagenr() == 1
    return
  endif

  let bufferName = bufname("%")
  if tabpagenr("$") == tabpagenr()
    close!
  else
    close!
    tabprev
  endif

  if a:angle == "v"
    vsplit
  else
    split
  endif

  execute "buffer" bufferName
endfunction

" Map function to leader
nnoremap <leader>mth :call MergeTab("h")<cr>
nnoremap <leader>mtv :call MergeTab("v")<cr>
