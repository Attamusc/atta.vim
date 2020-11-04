let g:dein#auto_recache=1
let g:dein#install_max_processes=12
let g:dein#install_progress_type='title'
let g:dein#enable_notification=1

function! s:init_dein() abort
  let l:plugin_dir = expand($HOME . '/.local/share/dein')

  if has('vim_starting')
    if &runtimepath !~# '/dein.vim'
      let s:dein_dir = l:plugin_dir . '/repos/github.com/Shougo/dein.vim'

      " Clone dein if first-time setup
      if !isdirectory(s:dein_dir)
        execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir

        if v:shell_error
          call s:error('dein installation has failed! is git installed?')
          finish
        endif
      endif

      " Add dein to runtime path
      execute 'set runtimepath+=' . l:plugin_dir . '/repos/github.com/Shougo/dein.vim'
    endif
  endif

  if !dein#load_state(l:plugin_dir)
    return
  endif

  let l:plugin_toml = expand($VIM_PATH . '/core/plugins.toml')

  call dein#begin(l:plugin_dir, [l:plugin_toml])
  call dein#load_toml(l:plugin_toml, { 'lazy': 0 })
  call dein#end()
  call dein#save_state()

  if dein#check_install()
    call dein#install()
  endif
endfunction

function! plugins#source_plugin_configs() abort
	let s:plugin_configs = map(
		\ split(globpath($VIM_PATH . '/plugins', '*.vim'), '\n'),
		\ "substitute(v:val, '^" . $VIM_PATH . "/', '', '')")

	for cfg in s:plugin_configs
		call utils#source_file($VIM_PATH, cfg)
	endfor
endfunction


function! plugins#remove_unused() abort
  let l:unused_plugins = dein#check_clean()

  if !empty(l:unused_plugins)
    for plugin_path in l:unused_plugins
      let l:plugin_name = join(split(plugin_path, '/')[-2:-1], '/')
      echo "Removing unused plugin: " . l:plugin_name
      call delete(plugin_path, 'rf')
    endfor

    call dein#recache_runtimepath()
  else
    echo "No unused plugins"
  endif
endfunction

call s:init_dein()
