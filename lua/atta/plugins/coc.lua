local utils = require("atta.utils")
local map = utils.map
local cmd = vim.cmd

local M = {}

local function vimscript_functions()
  -- bail out of lua for this since I can't get it working properly
  cmd([[
    function! Dotfiles_CheckBackSpace() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\\s'
    endfunction
  ]])


  cmd([[
    function! Dotfiles_ShowDocumentation()
      if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
      elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
      else
        execute '!' . &keywordprg . \" \" . expand('<cword>')
      endif
    endfunction
  ]])
end

local function coc_keymap()
  -- Use tab for trigger completion with characters ahead and navigate.
  -- Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
  cmd("inoremap <silent><expr> <TAB> pumvisible() ? \"\\<C-n>\" : Dotfiles_CheckBackSpace() ? \"\\<TAB>\" : coc#refresh()")
  cmd("inoremap <expr><S-TAB> pumvisible() ? \"\\<C-p>\" : \"\\<C-h>\"")

  -- Use K to show documentation in preview window.
  map("n", "K", ":call Dotfiles_ShowDocumentation()<cr>", { silent = true})
  map("i", "<c-space>", "coc#refresh()", { silent = true, expr = true })

  map("n", "gd", "<plug>(coc-definition)", { silent = true })
  map("n", "gy", "<plug>(coc-type-definition)", { silent = true })
  map("n", "gi", "<plug>(coc-implementation)", { silent = true })
  map("n", "gr", "<plug>(coc-references)", { silent = true })

  map("n", "[g", "<plug>(coc-diagnostic-prev)", { silent = true })
  map("n", "]g", "<plug>(coc-diagnostic-next)", { silent = true })
end

function M.setup()
  vimscript_functions()
  coc_keymap()
end

return M
