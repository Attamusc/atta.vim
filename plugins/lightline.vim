if dein#tap('lightline.vim')
  " Only hide the mode if lightline is loaded
  set noshowmode

  " set bufferline to show all the time
  set showtabline=2


  let g:lightline = {
    \ 'colorscheme': 'dracula_pro',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ], [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'tabline': {
    \   'left': [ [ 'buffers' ] ],
    \ },
    \ 'component': {
    \   'lineinfo': '%3l:%-2v%<',
    \ },
    \ 'component_function': {
    \   'mode': 'LightlineMode',
    \   'gitbranch': 'FugitiveHead',
    \ },
    \ 'component_expand': {
    \   'buffers': 'lightline#bufferline#buffers'
    \ },
    \ 'component_type': {
    \   'buffers': 'tabsel'
    \ },
    \ }

  function! LightlineMode()
    if &filetype ==# 'fern'
      return 'Fern'
    endif

    return lightline#mode()
  endfunction
endif
