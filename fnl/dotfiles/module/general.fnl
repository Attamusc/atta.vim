(module dotfiles.module.general
  {require {nvim aniseed.nvim}
   require-macros [dotfiles.macros]})

(defn- nnoremap [from to]
  (nvim.set_keymap :n from to {:noremap true}))

(defn- has [feature]
  (nvim.fn.has feature))

; Disable vim distribution plugins
(set nvim.g.loaded_gzip 1)
(set nvim.g.loaded_tar 1)
(set nvim.g.loaded_tarPlugin 1)
(set nvim.g.loaded_zip 1)
(set nvim.g.loaded_zipPlugin 1)

(set nvim.g.loaded_getscript 1)
(set nvim.g.loaded_getscriptPlugin 1)
(set nvim.g.loaded_vimball 1)
(set nvim.g.loaded_vimballPlugin 1)

(set nvim.g.loaded_matchit 1)
(set nvim.g.loaded_matchparen 1)
(set nvim.g.loaded_2html_plugin 1)
(set nvim.g.loaded_logiPat 1)
(set nvim.g.loaded_rrhelper 1)

(set nvim.g.loaded_netrw 1)
(set nvim.g.loaded_netrwPlugin 1)
(set nvim.g.loaded_netrwSettings 1)
(set nvim.g.loaded_netrwFileHandlers 1)

(set nvim.g.mapleader " ")
(set nvim.g.maplocalleader ",")

(when (has :vim_starting)
  ; Release keymappings prefixes, evict entirely for use of plug-ins.
  (nnoremap :<space> :<nop>)
  (nnoremap "," :<nop>)
  (nnoremap ";" :<nop>)

  (nnoremap :<space> :<nop>)
  (nnoremap "," :<nop>)
  (nnoremap ";" :<nop>))

; ; Set 8bit colors
(set nvim.o.t_Co :256)

(when (has :termguicolors)
  ; https://github.com/vim/vim/issues/993#issuecomment-255651605
  (set nvim.o.t_8f "\\<Esc>[38;2;%lu;%lu;%lum")
  (set nvim.o.t_8b "\\<Esc>[48;2;%lu;%lu;%lum")
  (set nvim.o.termguicolors true))

; Default updatetime is 4s, which is very long
(set nvim.o.updatetime 300)

; Show numbers
(set nvim.o.nu true)

; Show relative line numbers
(set nvim.o.rnu true)

; Visual bell when alerting instead of an audio bell
(set nvim.o.visualbell true)

; Show executed commands in the command line
(set nvim.o.showcmd true)

; Open vertical splits to the right and horizontal splits below the current
; buffer
(set nvim.o.splitbelow true)
(set nvim.o.splitright true)

; seach both cscopes and the tags file
(set nvim.o.cscopetag true)

; Make the command line 2 lines high
(set nvim.o.cmdheight 2)

; Show sign glyphs in the same column as numbers to reduce the pop when signs
; are added
(set nvim.o.signcolumn :yes)

; Start scrolling up/down when we're 5 lines away for the edges of the buffer
(set nvim.o.scrolloff 5)

; Reduce key delays
(set nvim.o.timeoutlen 1000)
(set nvim.o.ttimeoutlen 0)

; When switching buffers, prefer ones that are already open vs opening a new
; duplicate
(set nvim.o.switchbuf :useopen)

; Automatically indent inside of blocks per the language rules
(set nvim.o.autoindent true)

; Maximum fold levels
(set nvim.o.foldlevel 20)

; Use the same symbols as TextMate for tabstops and EOLs
(set nvim.o.listchars "tab:▸\\ ,eol:¬,trail:·")

; Set a default tab width as use spaces as tabs
(set nvim.o.ts 2)
(set nvim.o.sts 2)
(set nvim.o.sw 2)
(set nvim.o.expandtab true)

; No swap file and no backup file
(set nvim.o.swapfile false)
(set nvim.o.backup false)

; When searching, highlight matchs as you type
(set nvim.o.showmatch true)
(set nvim.o.incsearch true)
(set nvim.o.hlsearch true)

; Highlight the background of the line the cursor is on
(set nvim.o.cursorline true)

(set nvim.o.completeopt "menuone,noinsert,noselect")

; Don't remember what these do but leaving them for now...
(set nvim.o.hidden true)
(set nvim.o.smartindent true)
(set nvim.o.autoread true)
(set nvim.o.exrc true)
(set nvim.o.secure true)
(set nvim.o.modelines 1)
(set nvim.o.synmaxcol 400)
(set nvim.o.formatoptions :qrn1)
(set nvim.o.laststatus 2)
(set nvim.o.backspace "indent,eol,start")
(set nvim.o.tags "./tags;/")
(set nvim.o.clipboard :unnamed)
(set nvim.o.lazyredraw true)
(set nvim.o.autowrite true)

; Relative line numbers are nice to move around, but not so helpful in
; insert mode. This autocmd switches between them
; augroup numbertoggle
  ; autocmd!
  ; autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif
  ; autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif
; augroup END
(augroup :NumberToggle
  (do
    (autocmd "BufEnter,FocusGained,InsertLeave,WinEnter" :* "if &nu | set rnu | endif")
    (autocmd "BufLeave,FocusLost,InsertEnter,WinLeave" :* "if &nu | set nornu | endif")))

; Set colorscheme
(set nvim.o.background :dark)
(nvim.ex.colorscheme "dracula_pro_van_helsing")
