(module dotfiles.module.plugins.coc-fzf
  {require {nvim aniseed.nvim}})

(when (nvim.fn.dein#tap "coc-fzf")
  (set nvim.g.coc_fzf_opts ["--layout=reverse"]))
