local utils = require("atta.utils")
local map, noremap = utils.map, utils.noremap
local cmd = vim.cmd

local M = {}

local function keymaps()
-- General Keybindings
-- Keybindings not related to a specific plugin or language
  -- Enforce good habits
  map("","<left>","<nop>")
  map("","<right>","<nop>")
  map("","<up>","<nop>")
  map("","<down>","<nop>")

  -- jj | escaping
  noremap("i","jj","<esc>")
  noremap("c","jj","<c-c>")

-- Quit visual mode
  -- vnoremap v <Esc>
  noremap("v","v","<esc>")

-- Move to the start of line
  -- nnoremap H ^
  noremap("n","H","^")

-- Move to the end of line
  -- nnoremap L $
  noremap("n","L","$")

-- Redo
  -- nnoremap U <C-r>
  noremap("n","U","<c-r>")

-- Quick command mode
  -- Clears hlsearch after doing a search, otherwise got into command mode
  cmd([[nnoremap <expr> <CR> {-> v:hlsearch ? ":nohl<CR>" : ":"}()]])

-- In the quickfix window, <CR> is used to jump to the error under the
  -- cursor, so undefine the mapping there.
  cmd([[autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>]])

-- Make core movements visual line based vs actual line based
-- map j gj
  -- map k gk
  map("","j","gj")
  map("","k","gk")

  -- Easier up/down movement in insert mode
  map("i","<c-k>","<up>")
  map("i","<c-j>","<down>")

-- Use tab and shift tab for indentation
-- nnoremap <s-tab> <<
  -- nnoremap <tab> >>
  noremap("n","<s-tab>", "<<")
  noremap("n","<tab>", ">>")

-- Reselect after (de)indent in visual mode
-- vnoremap <s-tab> <gv
  -- vnoremap <tab> >gv
  noremap("v","<s-tab>", "<gv")
  noremap("v","<tab>", ">gv")

-- Easier tab movements
-- nnoremap <leader>tl"tabn<CR>"
  -- nnoremap <leader>th"tabp<CR>"
  noremap("n", "<leader>tl", ":tabn<cr>")
  noremap("n", "<leader>th", ":tabp<cr>")

-- Easier multi-pane commands
-- nnoremap <C-j> <C-w>j
-- nnoremap <C-k> <C-w>k
-- nnoremap <C-h> <C-w>h
  -- nnoremap <C-l> <C-w>l
  noremap("n", "<C-j>", "<C-w>j")
  noremap("n", "<C-k>", "<C-w>k")
  noremap("n", "<C-h>", "<C-w>h")
  noremap("n", "<C-l>", "<C-w>l")

-- nnoremap <C-D-j> <C-w>J
-- nnoremap <C-D-k> <C-w>K
-- nnoremap <C-D-h> <C-w>H
  -- nnoremap <C-D-l> <C-w>L
  noremap("n", "<C-D-j>", "<C-w>J")
  noremap("n", "<C-D-k>", "<C-w>K")
  noremap("n", "<C-D-h>", "<C-w>H")
  noremap("n", "<C-D-l>", "<C-w>L")

-- uppercase/lowercase a word
-- nmap <leader>uc mQviwU`Q
  -- nmap <leader>lc mQviwu`Q
  map("", "<leader>uc", "mQviwU`Q")
  map("", "<leader>lc", "mQviwu`Q")

-- Quick(ish) saving
  -- nnoremap <leader>s"w<CR>"
noremap("n", "<leader>s", ":w<cr>")
  -- nnoremap <leader>S"wall<CR>"
  noremap("n", "<leader>S", ":wall<cr>")

-- **VERY MAGIC EVERYWHERE**
-- nnoremap / /\v
  -- cnoremap %s/ %s/\v
  noremap("n", "/", "/\\v")
  noremap("c", "%s/", "%s/\\v")

-- reload configs
  -- nnoremap <leader>rc"source" $MYVIMRC<CR>
  noremap("n", "<leader>rc", ":source $MYVIMRC<CR>")
end

function M.setup()
  keymaps()
end

return M
