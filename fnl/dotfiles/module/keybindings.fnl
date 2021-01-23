(module dotfiles.module.general
  {require {nvim aniseed.nvim
            nu aniseed.nvim.util
            util dotfiles.util}
   require-macros [dotfiles.macros]})

; Keybindings not related to a specific plugin or language
; Enforce good habits
(util.map "" :<left> :<nop>)
(util.map "" :<right> :<nop>)
(util.map "" :<up> :<nop>)
(util.map "" :<down> :<nop>)

; jj | escaping
(util.noremap :i :jj :<esc>)
(util.noremap :c :jj :<c-c>)

; Quit visual mode
; vnoremap v <Esc>
(util.noremap :v :v :<esc>)

; Move to the start of line
; nnoremap H ^
(util.noremap :n :H :^)

; Move to the end of line
; nnoremap L $
(util.noremap :n :L :$)

; Redo
; nnoremap U <C-r>
(util.noremap :n :U :<c-r>)

; Quick command mode
; nnoremap <CR> :
; (nu.fn-bridge
  ; :CommandOrClearSearch
  ; :dotfiles.module.general :on-cr)

; (defn on-cr []
  ; (if (= 0 nvim.v.hlsearch)
    ; (nvim.command ":")
    ; (nvim.command ":nohl\<cr>")))

; (nvim.set_keymap :n :<cr> ":call CommandOrClearSearch()<cr>" {:expr true})
; this is super annoying (attempt above) to get in fnl so forget it
; Clears hlsearch after doing a search, otherwise got into command mode
(nvim.command "nnoremap <expr> <CR> {-> v:hlsearch ? \":nohl\\<CR>\" : \":\"}()")

; In the quickfix window, <CR> is used to jump to the error under the
; cursor, so undefine the mapping there.
; autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
(autocmd :BufReadPost :quickfix "nnoremap <buffer> <CR> <CR>")

; Make core movements visual line based vs actual line based
; map j gj
; map k gk
(util.map "" :j :gj)
(util.map "" :k :gk)

; Easier up/down movement in insert mode
(util.map :i :<c-k> :<up>)
(util.map :i :<c-j> :<down>)

; Use tab and shift tab for indentation
; nnoremap <s-tab> <<
; nnoremap <tab> >>
(util.noremap :n :<s-tab> "<<")
(util.noremap :n :<tab> ">>")

; Reselect after (de)indent in visual mode
; vnoremap <s-tab> <gv
; vnoremap <tab> >gv
(util.noremap :v :<s-tab> "<gv")
(util.noremap :v :<tab> ">gv")

; Easier tab movements
; nnoremap <leader>tl :tabn<CR>
; nnoremap <leader>th :tabp<CR>
(util.noremap :n "<leader>tl" ":tabn<cr>")
(util.noremap :n "<leader>th" ":tabp<cr>")

; Easier multi-pane commands
; nnoremap <C-j> <C-w>j
; nnoremap <C-k> <C-w>k
; nnoremap <C-h> <C-w>h
; nnoremap <C-l> <C-w>l
(util.noremap :n "<C-j>" "<C-w>j")
(util.noremap :n "<C-k>" "<C-w>k")
(util.noremap :n "<C-h>" "<C-w>h")
(util.noremap :n "<C-l>" "<C-w>l")

; nnoremap <C-D-j> <C-w>J
; nnoremap <C-D-k> <C-w>K
; nnoremap <C-D-h> <C-w>H
; nnoremap <C-D-l> <C-w>L
(util.noremap :n "<C-D-j>" "<C-w>J")
(util.noremap :n "<C-D-k>" "<C-w>K")
(util.noremap :n "<C-D-h>" "<C-w>H")
(util.noremap :n "<C-D-l>" "<C-w>L")

; uppercase/lowercase a word
; nmap <leader>uc mQviwU`Q
; nmap <leader>lc mQviwu`Q
(util.map "" "<leader>uc" "mQviwU`Q")
(util.map "" "<leader>lc" "mQviwu`Q")

; Quick(ish) saving
; nnoremap <leader>s :w<CR>
(util.noremap :n "<leader>s" ":w<cr>")

; **VERY MAGIC EVERYWHERE**
; nnoremap / /\v
; cnoremap %s/ %s/\v
(util.noremap :n "/" "/\\v")
(util.noremap :c "%s/" "%s/\\v")

; reload configs
; nnoremap <leader>rc :source $MYVIMRC<CR>
(util.noremap :n "<leader>rc" ":source $MYVIMRC<CR>")
