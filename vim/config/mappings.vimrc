" Key Mappings

" Save when exit vim insert mode
imap jk <esc>:w<cr>$
imap kj <esc>:w<cr>$
imap <C-s> <esc>:w<cr>

" Move up and down by visible lines if current line is wrapped
nmap j gj
nmap k gk

" Tab shortcuts
nmap <leader>tx :tabnew<cr>:Ex<cr>
nmap <leader>tt :tabnew<cr>
nmap <leader>tf :tabfirst<cr>
nmap <leader>tn :tabnext<cr>
nmap <leader>tp :tabprev<cr>
nmap <leader>tc :q<cr>
nmap <tab> :tabnext<cr>
nmap <S-tab> :tabprev<cr>

" Splits shortcuts
nmap <leader>vs :vsplit<cr>
nmap <leader>ss :split<cr>

" Turn of arrow keys. force use h,j,k,l
nmap <Left> :echoe "Use h"<CR>
nmap <Right> :echoe "Use l"<CR>
nmap <Up> :echoe "Use k"<CR>
nmap <Down> :echoe "Use j"<CR>

" Quicker window movement
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Make 0 to move to the first word in the begining of the line
nmap 0 0w

" Buffers shortcut
nmap <leader>bn :bn<cr>
nmap <leader>bp :bp<cr>
