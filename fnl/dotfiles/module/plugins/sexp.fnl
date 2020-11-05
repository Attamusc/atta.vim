(module dotfiles.module.plugin.sexp
  {require {nvim aniseed.nvim}})

(when (nvim.fn.dein#tap "vim-sexp")
  (set nvim.g.sexp_filetypes "clojure,scheme,lisp,timl,fennel,janet"))
