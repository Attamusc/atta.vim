" Keybindings not related to a specific plugin or language
"
" Enforce good habits
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

" jj | escaping
inoremap jj <Esc>
cnoremap jj <C-c>

" Quit visual mode
vnoremap v <Esc>

" Move to the start of line
nnoremap H ^

" Move to the end of line
nnoremap L $

" Redo
nnoremap U <C-r>

" Quick command mode
nnoremap <CR> :

" In the quickfix window, <CR> is used to jump to the error under the
" cursor, so undefine the mapping there.
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

" Make core movements visual line based vs actual line based
map j gj
map k gk

" Use tab and shift tab for indentation
nnoremap <s-tab> <<
nnoremap <tab> >>

" Reselect after (de)indent in visual mode
vnoremap <s-tab> <gv
vnoremap <tab> >gv

" Easier tab movements
nnoremap <leader>tl :tabn<CR>
nnoremap <leader>th :tabp<CR>

" Easier multi-pane commands
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

nnoremap <C-D-j> <C-w>J
nnoremap <C-D-k> <C-w>K
nnoremap <C-D-h> <C-w>H
nnoremap <C-D-l> <C-w>L

" uppercase/lowercase a word
nmap <leader>uc mQviwU`Q
nmap <leader>lc mQviwu`Q

" Quick(ish) saving
nnoremap <leader>s :w<CR>

" **VERY MAGIC EVERYWHERE**
nnoremap / /\v
cnoremap %s/ %s/\v

" reload configs
nnoremap <leader>rc :source $MYVIMRC<CR>
