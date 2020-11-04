" vim: set ts=2 sw=2 tw=80 noet :

" Use spacebar as leader and ; as secondary-leader
" Required before loading plugins!
let g:mapleader="\<Space>"
let g:maplocalleader=';'

if !has('nvim')
	set nocompatible
endif

let $VIM_PATH = fnamemodify(resolve(expand('<sfile>:p')), ':h:h')

filetype off

call utils#source_file($VIM_PATH, 'core/plugins.vim')

filetype plugin indent on
syntax enable

lua require('aniseed.env').init()

call plugins#source_plugin_configs()
