if dein#tap('fzf.vim')
  let $FZF_DEFAULT_OPTS = '--layout=reverse'

  let g:fzf_command_prefix = 'Fzf'
  let g:fzf_layout = { 'window': { 
      \ 'width': 0.8, 
      \ 'height': 0.6, 
      \ 'yoffset': 0.2, 
      \ 'highlight': 'Normal' } }
  let g:fzf_preview_window = 'down:50%'
  let g:fzf_action = {
        \ 'ctrl-t': 'tab split',
        \ 'ctrl-h': 'split',
        \ 'ctrl-v': 'vsplit' }

  function! OpenFloatingWin()
    let height = &lines - 3
    let width = float2nr(&columns - (&columns * 2 / 10))
    let col = float2nr((&columns - width) / 2)

    let opts = {
          \ 'relative': 'editor',
          \ 'row': height * 0.3,
          \ 'col': col + 30,
          \ 'width': width * 2 / 3,
          \ 'height': height / 2
          \ }

    let buf = nvim_create_buf(v:false, v:true)
    let win = nvim_open_win(buf, v:true, opts)

    call setwinvar(win, '&winhl', 'Normal:Pmenu')

    setlocal
          \ buftype=nofile
          \ nobuflisted
          \ bufhidden=hide
          \ nonumber
          \ norelativenumber
          \ signcolumn=no
  endfunction

  nnoremap <leader>ff :FzfFiles<CR>
  nnoremap <leader>fb :FzfBuffers<CR>
  nnoremap <leader>fa :FzfRg<CR>
endif
