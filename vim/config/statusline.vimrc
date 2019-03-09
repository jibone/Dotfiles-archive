" Statusline configuration

" Inspired from:
" http://kadekillary.work/post/statusline/
" https://gabri.me/blog/diy-vim-statusline/

" Find out current buffer's size and output it.
function! FileSize()
  let bytes = getfsize(expand('%:p'))
  if (bytes >= 1024)
    let kbytes = bytes / 1024
  endif
  if (exists('kbytes') && kbytes >= 1000)
    let mbytes = kbytes / 1000
  endif

  if bytes <= 0
    return '0'
  endif

  if (exists('mbytes'))
    return mbytes . 'MB '
  elseif (exists('kbytes'))
    return kbytes . 'KB '
  else
    return bytes . 'B '
  endif
endfunction

function! ReadOnly()
  if &readonly || !&modifiable
    return ''
  else
    return ''
endfunction

function! GitInfo()
  let git = fugitive#head()
  if git != ''
    return fugitive#head().' '
  else
    return ''
endfunction

set laststatus=2
set statusline=
set statusline+=%2*\ %{toupper(mode())}                  " Current mode
set statusline+=%2*\ [%n]                                " buffernr
set statusline+=%4*\ %{GitInfo()}                        " Git Branch name
set statusline+=%5*\ ‹‹
set statusline+=%5*\ %<%F\ %{ReadOnly()}\ %m\ %w\        " File+path
set statusline+=%5*\ ››
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}             " Syntastic errors
set statusline+=%*
set statusline+=%9*\ %=                                  " Space
set statusline+=%4*\ %y\                                 " FileType
set statusline+=%4*\ %{(&fenc!=''?&fenc:&enc)}\[%{&ff}]\ " Encoding & Fileformat
set statusline+=%2*\ %-3(%{FileSize()}%)                 " File size
set statusline+=%2*\ %3p%%\ :\ %3c\                      " Rownumber/total (%)

hi User1 cterm=NONE ctermbg=Blue ctermfg=Black   guibg=Blue guifg=Black
hi User2 cterm=NONE ctermbg=Blue ctermfg=White   guibg=Blue guifg=White
hi User3 cterm=NONE ctermbg=Blue ctermfg=Magenta guibg=Blue guifg=Magenta
hi User4 cterm=NONE ctermbg=Blue ctermfg=Yellow  guibg=Blue guifg=Yellow
hi User5 cterm=NONE ctermbg=NONE ctermfg=Yellow  guibg=Blue guifg=Yellow
