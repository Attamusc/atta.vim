" Disable vim distribution plugins
let g:loaded_gzip = 1
let g:loaded_tar = 1
let g:loaded_tarPlugin = 1
let g:loaded_zip = 1
let g:loaded_zipPlugin = 1

let g:loaded_getscript = 1
let g:loaded_getscriptPlugin = 1
let g:loaded_vimball = 1
let g:loaded_vimballPlugin = 1

let g:loaded_matchit = 1
let g:loaded_matchparen = 1
let g:loaded_2html_plugin = 1
let g:loaded_logiPat = 1
let g:loaded_rrhelper = 1

let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1
let g:loaded_netrwSettings = 1
let g:loaded_netrwFileHandlers = 1

if has('vim_starting')
	" Use spacebar as leader and ; as secondary-leader
	" Required before loading plugins!
	let g:mapleader="\<Space>"
	let g:maplocalleader=';'

	" Release keymappings prefixes, evict entirely for use of plug-ins.
	nnoremap <Space>  <Nop>
	xnoremap <Space>  <Nop>
	nnoremap ,        <Nop>
	xnoremap ,        <Nop>
	nnoremap ;        <Nop>
	xnoremap ;        <Nop>
endif

" Set 8bit colors
set t_Co=256
if (has("termguicolors"))
  " https://github.com/vim/vim/issues/993#issuecomment-255651605
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

  set termguicolors
endif

" Default updatetime is 4s, which is very long
set updatetime=300

" Show numbers
set nu

" Visual bell when alerting instead of an audio bell
set visualbell

" Show executed commands in the command line
set showcmd

" Open vertical splits below and horizontal splits to the right of the current
" buffer
set splitbelow
set splitright

" seach both cscopes and the tags file
set cscopetag

" Made the command line 2 lines high
set cmdheight=2

" Show sign glyphs in the same column as numbers to reduce the pop when signs
" are added
set signcolumn=number

" Start scrolling up/down when we're 5 lines away for the edges of the buffer
set scrolloff=5

" Reduce key delays
set timeoutlen=1000
set ttimeoutlen=0

" When switching buffers, prefer ones that are alread open vs opening a new
" duplicate
set switchbuf=useopen

" Automatically indent inside of blocks per the language rules
set autoindent

" Maximum fold levels
set foldlevel=20

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬,trail:·

" Set a default tab width as use spaces as tabs
set ts=2 sts=2 sw=2 expandtab

" No swap file and no backup file
set noswapfile
set nobackup

" When searching, highlight matchs as you type
set showmatch
set incsearch
set hlsearch

" Highlight the background of the line the cursor is on
set cursorline

" Don't remember what these do but leaving them for now...
set hidden
set smartindent
set autoread
set exrc
set secure
set modelines=1
set synmaxcol=400
set formatoptions=qrn1
set laststatus=2
set backspace=indent,eol,start
set tags=./tags;/
set clipboard=unnamed
set lazyredraw
set autowrite
" }}}
