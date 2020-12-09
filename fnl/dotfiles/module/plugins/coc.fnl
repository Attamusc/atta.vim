(module dotfiles.module.plugins.coc
  {require {nvim aniseed.nvim
            core aniseed.core
            nu aniseed.nvim.util}})

; bail out of lua for this since I can't get it working properly
(nvim.command "
  function! Dotfiles_CheckBackSpace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\\s'
  endfunction")


(nvim.command "
  function! Dotfiles_ShowDocumentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
      call CocActionAsync('doHover')
    else
      execute '!' . &keywordprg . \" \" . expand('<cword>')
    endif
  endfunction")

(defn- coc-keymap []
  ; Use tab for trigger completion with characters ahead and navigate.
  ; Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
  (nvim.command "inoremap <silent><expr> <TAB> pumvisible() ? \"\\<C-n>\" : Dotfiles_CheckBackSpace() ? \"\\<TAB>\" : coc#refresh()")
  (nvim.command "inoremap <expr><S-TAB> pumvisible() ? \"\\<C-p>\" : \"\\<C-h>\"")

  ; Use K to show documentation in preview window.
  (nvim.set_keymap :n :K ":call Dotfiles_ShowDocumentation()<cr>" {:silent true})
  (nvim.set_keymap :i :<c-space> "coc#refresh()" {:silent true
                                                  :expr true})

  (nvim.set_keymap :n :gd "<plug>(coc-definition)" {:silent true})
  (nvim.set_keymap :n :gy "<plug>(coc-type-definition)" {:silent true})
  (nvim.set_keymap :n :gi "<plug>(coc-implementation)" {:silent true})
  (nvim.set_keymap :n :gr "<plug>(coc-references)" {:silent true})

  (nvim.set_keymap :n "[g" "<plug>(coc-diagnostic-prev)" {:silent true})
  (nvim.set_keymap :n "]g" "<plug>(coc-diagnostic-next)" {:silent true}))

(coc-keymap)
