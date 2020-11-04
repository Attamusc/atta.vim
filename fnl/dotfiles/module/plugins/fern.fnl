(module dotfiles.module.plugins.fern
  {require {nvim aniseed.nvim
            util dotfiles.util}
   require-macros [dotfiles.macros]})

(defn- fern-variables []
  (set nvim.g.fern#renderer "nerdfont")
  (set nvim.g.fern#disable_default_mappings 1)
  (set nvim.g.fern#renderer#default#leading "  ")
  (set nvim.g.fern#renderer#default#leaf_symbol "- ")
  (set nvim.g.fern#renderer#default#collapsed_symbol "▶ ")
  (set nvim.g.fern#renderer#default#expanded_symbol "▼ "))

(when (nvim.fn.dein#tap "fern.vim")
  (fern-variables))

; if dein#tap("fern.vim")
  ; " Custom settings and mappings.
  ; let g:fern#renderer = "nerdfont"
  ; let g:fern#disable_default_mappings = 1
  ; let g:fern#renderer#default#leading = "  "
  ; let g:fern#renderer#default#leaf_symbol = "- "
  ; let g:fern#renderer#default#collapsed_symbol = "▶ "
  ; let g:fern#renderer#default#expanded_symbol = "▼ "

  ; noremap <silent> <Leader>e :Fern . -drawer -reveal=% -toggle -width=35<CR><C-w>=

  ; function! s:hijack_directory() abort
    ; let path = expand('%:p')
    ; if !isdirectory(path)
      ; return
    ; endif
    ; bwipeout %
    ; execute printf('Fern %s', fnameescape(path))
  ; endfunction

  ; function! FernInit() abort
    ; setlocal nornu
    ; setlocal nonu

    ; nmap <buffer><expr>
          ; \ <Plug>(fern-my-open-expand-collapse)
          ; \ fern#smart#leaf(
          ; \   "\<Plug>(fern-action-open:select)",
          ; \   "\<Plug>(fern-action-expand)",
          ; \   "\<Plug>(fern-action-collapse)",
          ; \ )
    ; nmap <buffer> <CR> <Plug>(fern-my-open-expand-collapse)
    ; nmap <buffer> <2-LeftMouse> <Plug>(fern-my-open-expand-collapse)
    ; nmap <buffer> n <Plug>(fern-action-new-path)
    ; nmap <buffer> d <Plug>(fern-action-remove)
    ; nmap <buffer> c <Plug>(fern-action-copy)
    ; nmap <buffer> m <Plug>(fern-action-move)
    ; nmap <buffer> M <Plug>(fern-action-rename)
    ; nmap <buffer> h <Plug>(fern-action-hidden-toggle)
    ; nmap <buffer> r <Plug>(fern-action-reload)
    ; nmap <buffer> i <Plug>(fern-action-mark:toggle)
    ; nmap <buffer> s <Plug>(fern-action-open:split)
    ; nmap <buffer> v <Plug>(fern-action-open:vsplit)
    ; nmap <buffer> x <Plug>(fern-action-collapse)
    ; nmap <buffer><nowait> < <Plug>(fern-action-leave)
    ; nmap <buffer><nowait> > <Plug>(fern-action-enter)
  ; endfunction

  ; augroup FernOpenHijack
    ; autocmd!
    ; autocmd BufEnter * ++nested call s:hijack_directory()
  ; augroup END

  ; augroup FernGroup
    ; autocmd!
    ; autocmd FileType fern call FernInit()
  ; augroup END
  ; " }}}
; endif
