if dein#tap('vim-airline')
  let g:airline_powerline_fonts = 1

  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#show_buffers = 0
  let g:airline#extensions#tabline#tab_min_count = 2

  let g:airline#extensions#tmuxline#enabled = 1

  let g:airline_theme='dracula_pro'
endif
