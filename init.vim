" vim: set ts=2 sw=2 tw=80 noet :
 
" Install vim-plugged if not installed
if filereadable(glob('~/.local/share/nvim/site/autoload/plug.vim')) == 0
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Use spacebar as leader and , as secondary-leader
" Required before loading plugins!
let g:mapleader="\<Space>"
let g:maplocalleader=','

filetype plugin indent on
syntax enable

call plug#begin(stdpath('data') . '/plugged')

Plug 'Olical/aniseed'
Plug 'Olical/conjure', {'tag': 'v4.8.0'}

" General/Utils
" -------------
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/glyph-palette.vim'
Plug 'preservim/nerdcommenter'
Plug 'machakann/vim-sandwich'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-repeat'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Lua nvim utils
" --------------
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'

" VCS
" ---
Plug 'tpope/vim-fugitive'

" File Drawer
" -----------
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'

" VCS Sign Info
" -------------
Plug 'mhinz/vim-signify'

" Status Line
" -----------
Plug 'itchyny/lightline.vim'

" Fuzzy Finder(s)
" ------------
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" Completions
" -----------
Plug 'neoclide/coc.nvim', {'tag': 'release'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-vetur', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-solargraph', {'do': 'yarn install --frozen-lockfile'}
Plug 'fannheyward/coc-rust-analyzer', {'do': 'yarn install --frozen-lockfile'}
Plug 'josa42/coc-lua', {'do': 'yarn install --frozen-lockfile'}
Plug 'jlesquembre/coc-conjure', {'do': 'yarn install --frozen-lockfile'}
Plug 'felippepuhle/coc-graphql', {'do': 'yarn install --frozen-lockfile'}
Plug 'josa42/coc-go', {'do': 'yarn install --frozen-lockfile'}
Plug 'iamcco/coc-tailwindcss',  {'do': 'yarn install --frozen-lockfile && yarn run build'}
Plug 'marlonfan/coc-phpls', {'do': 'yarn install --frozen-lockfile'}

" Languages
" ---------
Plug 'cespare/vim-toml'
Plug 'pangloss/vim-javascript'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'rust-lang/rust.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'bakpakin/fennel.vim'
Plug 'euclidianAce/BetterLua.vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'jparise/vim-graphql'
Plug 'martinda/Jenkinsfile-vim-syntax'

" Colors
" ------
Plug '~/OneDrive/Tools/DraculaPro/themes', {'as': 'dracula_pro', 'rtp': 'vim'}
Plug 'glepnir/zephyr-nvim', {'branch': 'main'}

call plug#end()

lua require('aniseed.env').init()
