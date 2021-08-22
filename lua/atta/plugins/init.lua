local fn = vim.fn
local execute = vim.api.nvim_command
local fmt = string.format

local M = {}

-- Packer is our plugin manager.
local function ensure_packer()
  local pack_path = fn.stdpath("data") .. "/site/pack"
  local install_path = fmt("%s/packer/start/packer.nvim", pack_path)

  if fn.empty(fn.glob(install_path)) > 0 then
    execute(fmt("!git clone https://github.com/wbthomason/packer.nvim %s", install_path))
    execute([[packadd packer.nvim]])
  end
end

local function install_packages()
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

    -- Indent lines
    use "lukas-reineke/indent-blankline.nvim"

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
    use { 'OmniSharp/omnisharp-vim' }

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
end

local function load_plugin_configs()
  require("atta.plugins.coc").setup()
  require("atta.plugins.fern").setup()
  require("atta.plugins.glyph_palette").setup()
  require("atta.plugins.indent-blankline").setup()
  require("atta.plugins.lualine").setup()
  require("atta.plugins.nerdcommenter").setup()
  require("atta.plugins.nvim-treesitter").setup()
  require("atta.plugins.sexp").setup()
  require("atta.plugins.telescope").setup()
  require("atta.plugins.todo_comments").setup()
  require("atta.plugins.tokyonight").setup()
  require("atta.plugins.trouble").setup()
end

function M.setup_packer()
  ensure_packer()
  install_packages()
end

function M.setup_plugins()
  load_plugin_configs()
end

return M
