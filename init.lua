local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options

-- Utils
function _G.dump(...)
    local objects = vim.tbl_map(vim.inspect, {...})
    print(unpack(objects))
    return ...
end

local function t(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end


-- Package Manager
local execute = vim.api.nvim_command
local fmt = string.format

local function ensure_packer()
  local pack_path = fn.stdpath("data") .. "/site/pack"
  local install_path = fmt("%s/packer/start/packer.nvim", pack_path)

  if fn.empty(fn.glob(install_path)) > 0 then
    execute(fmt("!git clone https://github.com/wbthomason/packer.nvim %s", install_path))
    execute([[packadd packer.nvim]])
  end
end

-- Packer is our plugin manager.
ensure_packer()

-- Plugins
local packer = require("packer")

packer.startup(function(use)
  -- Manage packer with packer
  use 'wbthomason/packer.nvim'

 -- General/Utils
  use { 'antoinemadec/FixCursorHold.nvim' }
  use { 'lambdalisue/nerdfont.vim' }
  use { 'lambdalisue/glyph-palette.vim' }
  use { 'preservim/nerdcommenter' }
  use { 'machakann/vim-sandwich' }
  use { 'jiangmiao/auto-pairs' }
  use { 'tpope/vim-repeat' }
  use { 'guns/vim-sexp' }
  use { 'tpope/vim-sexp-mappings-for-regular-people' }
  use { 'kyazdani42/nvim-web-devicons' }
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

 -- Lua nvim utils
  use { 'nvim-lua/popup.nvim' }
  use { 'nvim-lua/plenary.nvim' }
 -- VCS
  use { 'tpope/vim-fugitive' }
 -- File Drawer
  use { 'lambdalisue/fern.vim' }
  use { 'lambdalisue/fern-renderer-nerdfont.vim' }
  use { 'lambdalisue/fern-hijack.vim' }
  -- 
 -- VCS Sign Info
  use { 'mhinz/vim-signify' }
 
 -- Status Line
  use { 'hoob3rt/lualine.nvim' }
 
 -- Fuzzy Finder(s)
  use { 'nvim-telescope/telescope.nvim' }
  use { 'nvim-telescope/telescope-fzy-native.nvim' }
 
 -- Diagnostics
  use { 'folke/trouble.nvim', branch = 'main' }
  use { 'folke/todo-comments.nvim', branch = 'main' }
 
 -- Completions
  use { 'neoclide/coc.nvim', tag = 'release' }
  use { 'neoclide/coc-tsserver', run = 'yarn install --frozen-lockfile' }
  use { 'neoclide/coc-eslint', run = 'yarn install --frozen-lockfile' }
  use { 'neoclide/coc-prettier', run = 'yarn install --frozen-lockfile' }
  use { 'neoclide/coc-json', run = 'yarn install --frozen-lockfile' }
  use { 'neoclide/coc-vetur', run = 'yarn install --frozen-lockfile' }
  use { 'neoclide/coc-solargraph', run = 'yarn install --frozen-lockfile' }
  use { 'fannheyward/coc-rust-analyzer', run = 'yarn install --frozen-lockfile' }
  use { 'josa42/coc-lua', run = 'yarn install --frozen-lockfile' }
  use { 'jlesquembre/coc-conjure', run = 'yarn install --frozen-lockfile' }
  use { 'felippepuhle/coc-graphql', run = 'yarn install --frozen-lockfile' }
  use { 'josa42/coc-go', run = 'yarn install --frozen-lockfile' }
  use { 'iamcco/coc-tailwindcss',  run = 'yarn install --frozen-lockfile && yarn run build' }
  use { 'marlonfan/coc-phpls', run = 'yarn install --frozen-lockfile' }
 
 -- Languages
  use { 'cespare/vim-toml' }
  use { 'pangloss/vim-javascript' }
  use { 'HerringtonDarkholme/yats.vim' }
  use { 'rust-lang/rust.vim' }
  use { 'vim-ruby/vim-ruby' }
  use { 'maxmellon/vim-jsx-pretty' }
  use { 'bakpakin/fennel.vim' }
  use { 'euclidianAce/BetterLua.vim' }
  use { 'mustache/vim-mustache-handlebars' }
  use { 'jparise/vim-graphql' }
  use { 'martinda/Jenkinsfile-vim-syntax' }
  use { 'habamax/vim-godot' }
  use { 'StanAngeloff/php.vim' }
  use { '2072/PHP-Indenting-for-VIm' }
 
 -- Colors
  use { '~/OneDrive/Tools/DraculaPro/themes', as = "dracula_pro", rtp = "vim" }
  use { 'glepnir/zephyr-nvim', branch = 'main' }
  use { 'tiagovla/tokyodark.nvim' }
  use { 'folke/tokyonight.nvim', branch = 'main' }
end)

-- General Settings
local function mapleader()
  -- Use spacebar as leader and , as secondary-leader
  -- Required before loading plugins!
 g.mapleader = " "
 g.maplocalleader = ","
end

mapleader()

local function disable_default_plugins()
  -- Disable vim distribution plugins
  g.loaded_gzip = 1
  g.loaded_tar = 1
  g.loaded_tarPlugin = 1
  g.loaded_zip = 1
  g.loaded_zipPlugin = 1
  
  g.loaded_getscript = 1
  g.loaded_getscriptPlugin = 1
  g.loaded_vimball = 1
  g.loaded_vimballPlugin = 1
  
  g.loaded_matchit = 1
  g.loaded_matchparen = 1
  g.loaded_2html_plugin = 1
  g.loaded_logiPat = 1
  g.loaded_rrhelper = 1
  
  g.loaded_netrw = 1
  g.loaded_netrwPlugin = 1
  g.loaded_netrwSettings = 1
  g.loaded_netrwFileHandlers = 1
end

disable_default_plugins()

local nvim_map = vim.api.nvim_set_keymap

local function map(mode, from, to, opt)
  local options = {}

  if opt then
    vim.tbl_extend('force', options, opt)
  end

  nvim_map(mode, from, to, options)
end

local function noremap(mode, from, to, opt)
  local options = { noremap = true }

  if opt then
    vim.tbl_extend('force', options, opt)
  end

  nvim_map(mode, from, to, options)
end

if fn.has("vim_starting") then
  -- Release keymappings prefixes, evict entirely for use of plug-ins.
  map("n", " ", "<nop>")
  map("n", ",", "<nop>")
  map("n", ";", "<nop>")
end


-- Set 8bit colors
--opt.t_Co = 256

if fn.has("termguicolors") then
  -- opt.t_8f = "\\<Esc>[38;2;%lu;%lu;%lum"
  -- opt.t_8b = "\\<Esc>[48;2;%lu;%lu;%lum"
  opt.termguicolors = true
end

-- Default updatetime is 4s, which is very long
opt.updatetime = 300

-- Show numbers
opt.nu = true

-- Show relative line numbers
opt.rnu = true

-- Visual bell when alerting instead of an audio bell
opt.visualbell = true

-- Show executed commands in the command line
opt.showcmd = true

-- Open vertical splits to the right and horizontal splits below the current buffer
opt.splitbelow = true
opt.splitright = true

-- seach both cscopes and the tags file
opt.cscopetag = true

-- Make the command line 2 lines high
opt.cmdheight = 2

-- Show sign glyphs in the same column as numbers to reduce the pop when signs
-- are added
opt.signcolumn = "yes"

-- Start scrolling up/down when we're 5 lines away for the edges of the buffer
opt.scrolloff = 5

-- Reduce key delays
opt.timeoutlen = 1000
opt.ttimeoutlen = 0

-- When switching buffers, prefer ones that are already open vs opening a new duplicate
opt.switchbuf = "useopen"

-- Automatically indent inside of blocks per the language rules
opt.autoindent = true

-- Maximum fold levels
opt.foldlevel = 20

-- Use tree-sitter for folding
opt.foldmethod = "expr"
opt.foldexpr = fn["nvim_treesitter#foldexpr"]()

-- Use the same symbols as TextMate for tabstops and EOLs
opt.listchars = "tab:▸\\ ,eol:¬,trail:·"

-- Set a default tab width as use spaces as tabs
opt.ts = 2
opt.sts = 2
opt.sw = 2
opt.expandtab = true

-- No swap file and no backup file
opt.swapfile = false
opt.backup = false

-- When searching, highlight matchs as you type
opt.showmatch = true
opt.incsearch = true
opt.hlsearch = true

-- Highlight the background of the line the cursor is on
opt.cursorline = true

opt.completeopt = "menuone,noinsert,noselect"

-- Don't remember what these do but leaving them for now...
opt.hidden = true
opt.smartindent = true
opt.autoread = true
opt.exrc = true
opt.secure = true
opt.modelines = 1
opt.synmaxcol = 400
opt.formatoptions = "qrn1"
opt.laststatus = 2
opt.backspace = "indent,eol,start"
opt.tags = "./tags;/"
opt.clipboard = "unnamed"
opt.lazyredraw = true
opt.autowrite = true
 
 -- Relative line numbers are nice to move around, but not so helpful in
 -- insert mode. This autocmd switches between them
cmd([[
augroup NumberToggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif
augroup END
]])
 
 -- Set colorscheme
opt.background = "dark"
-- (nvim.ex.colorscheme "dracula_pro_van_helsing")
-- cmd([[colorscheme tokyodark]])
--
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

-- Plugin Settings

-- **nvim-treesitter**
local treesitter_configs = require("nvim-treesitter.configs")

treesitter_configs.setup({
  ensure_installed = "all",
  ignore_install = { "haskell" },
  highlight = {
    enable = true
  },
  indent = {
    enable = true
  }
})

-- **lualine**
local lualine = require('lualine')

local fern = {
  sections = {
    lualine_a = {"[[Fern]]"},
  },
  filetypes = {"fern"},
}

lualine.setup({
  options = {
    icons_enabled = true,
    theme = "tokyonight",
    component_separators = {"", ""},
    section_separators = {"", ""},
    disabled_filetypes = {},
  },
  sections = {
    lualine_a = {"mode"},
    lualine_b = {"branch", "diff"},
    lualine_c = {"filename"},
    lualine_x ={"encoding", "fileformat", "filetype"},
    lualine_y = {"progress"},
    lualine_z = {"location"},
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {"filename"},
    lualine_x = {"location"},
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {fern, "fugitive"}
})

-- **Fern**
-- (defn- map-buffer [from to opt]
--   (let [options (core.merge opt {})]
--     (nvim.buf_set_keymap 0 :n from to options)))
local function map_buffer(from, to, opt)
  local options = {}

  if opt then
    vim.tbl_extend('force', options, opt)
  end

  vim.api.nvim_buf_set_keymap(0, "n", from, to, options)
end

local function fern_variables()
  g["fern#renderer"] = "nerdfont"
  g["fern#disable_default_mappings"] = 1
end

local function fern_mappings()
  nvim_map("", "<leader>e", ":Fern . -drawer -reveal=% -toggle -width=35<cr><c-w>=", { silent = true })
end

local function fern_augroups()
  cmd([[
augroup FernInit
  autocmd!
  autocmd FileType fern :lua fern_init()
augroup END
  ]])
end

local function fern_smart_leaf()
  local open = t("<Plug>(fern-action-open:select)")
  local expand = t("<Plug>(fern-action-expand)")
  local collapse = t("<Plug>(fern-action-collapse)")

  return fn.printf("fern#smart#leaf(%s, %s, %s)", open, expand, collapse)
end

function _G.fern_init()
   -- Bailing out of lua for this since for some reason I can't get the nvim.wo.* version of these
   -- to actually work properly for only the buffer, and these don't exists as nvim.bo.* versions.
   cmd("setlocal nornu")
   cmd("setlocal nonu")

  -- Can't get this lua version to work, so bail out to vimscript to register the command
   -- map_buffer("<Plug>(fern-my-open-expand-collapse)", fern_smart_leaf(), { expr = true })
  cmd([[nmap <buffer><expr> <Plug>(fern-my-open-expand-collapse) fern#smart#leaf("\<Plug>(fern-action-open:select)", "\<Plug>(fern-action-expand)", "\<Plug>(fern-action-collapse)")]])

   map_buffer("<CR>", "<Plug>(fern-my-open-expand-collapse)", { nowait = true })
   map_buffer("<2-LeftMouse>", "<Plug>(fern-my-open-expand-collapse)", { nowait = true })
   map_buffer("n", "<Plug>(fern-action-new-path)")
   map_buffer("d", "<Plug>(fern-action-remove)")
   map_buffer("c", "<Plug>(fern-action-copy)")
   map_buffer("m", "<Plug>(fern-action-move)")
   map_buffer("M", "<Plug>(fern-action-rename)")
   map_buffer("h", "<Plug>(fern-action-hidden-toggle)")
   map_buffer("r", "<Plug>(fern-action-reload)")
   map_buffer("i", "<Plug>(fern-action-mark:toggle)")
   map_buffer("s", "<Plug>(fern-action-open:split)")
   map_buffer("v", "<Plug>(fern-action-open:vsplit)")
   map_buffer("x", "<Plug>(fern-action-collapse)")
   map_buffer("<", "<Plug>(fern-action-leave)", { nowait = true })
   map_buffer(">", "<Plug>(fern-action-enter)", { nowait = true })
end

fern_variables()
fern_mappings()
fern_augroups()

-- **auto-pairs**
-- Maybe don't need this config anyway?
--
-- **coc**
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

coc_keymap()

-- **glyph-palette**
cmd([[
augroup GlyphPaletteGroup
  autocmd!
  autocmd FileType fern call glyph_palette#apply()
  autocmd FileType nerdtree,startify call glyph_palette#apply()
augroup END
]])

-- **nerdcommenter**
g.NERDSpaceDelims = 1
g.NERDToggleCheckAllLines = 1

map("", "<leader>cc", "<plug>NERDCommenterToggle")

-- **sexp**
g.sexp_filetypes = "clojure,scheme,lisp,timl,fennel,janet"

-- **telescope**
local telescope = require("telescope")
local sorters = require("telescope.sorters")
local previewers = require("telescope.previewers")
local actions = require("telescope.actions")

local function telescope_settings()
  telescope.setup({
    defaults = {
      file_sorter = sorters.get_fzy_sorter,
      prompt_prefix = " >",
      color_devicons = true,
      sorting_strategy = "ascending",
      layout_strategy = "flex",
      layout_config = {
        vertical = {
          mirror = true,
        },
        horizontal = {
          mirror = false,
        },
      },
      mappings = {
        i = {
          ["<esc>"] = actions.close,
        },
      },
      file_previewer = previewers.vim_buffer_cat.new,
      grep_previewer = previewers.vim_buffer_vimgrep.new,
      qflist_previewer = previewers.vim_buffer_qflist.new
    },
    extensions = {
      fzy_native = {
        override_generic_sorter = false,
        override_file_sorter = true,
      },
    },
  })

  telescope.load_extension("fzy_native")
end

local function telescope_mappings()
  noremap("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>")
  noremap("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>")
  noremap("n", "<leader>fsa", "<cmd>lua require('telescope.builtin').live_grep()<cr>")
  noremap("n", "<leader>fss", "<cmd>lua require('telescope.builtin').grep_string()<cr>")
  noremap("n", "<leader>fgs", "<cmd>lua require('telescope.builtin').git_status()<cr>")
  noremap("n", "<leader>fgc", "<cmd>lua require('telescope.builtin').git_commits()<cr>")
end

telescope_settings()
telescope_mappings()

-- **todo-comments**
local todo_comments = require("todo-comments")

todo_comments.setup()

-- **trouble**
local trouble = require("trouble")

trouble.setup()

-- **Tokyonight**
g.tokyonight_style = "night"
cmd([[colorscheme tokyonight]])
