" vim: set ts=2 sw=2 tw=80 noet :

if !has('nvim')
	set nocompatible
endif

filetype off

let $VIM_PATH = fnamemodify(resolve(expand('<sfile>:p')), ':h:h')

call utils#source_file($VIM_PATH, 'core/plugins.vim')

filetype plugin indent on
syntax enable

call utils#source_file($VIM_PATH, 'core/general.vim')
call utils#source_file($VIM_PATH, 'core/colors.vim')
call utils#source_file($VIM_PATH, 'core/keybindings.vim')

call plugins#source_plugin_configs()

