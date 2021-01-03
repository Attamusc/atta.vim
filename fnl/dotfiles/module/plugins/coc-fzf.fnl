(module dotfiles.module.plugins.coc-fzf
  {require {nvim aniseed.nvim}})

(defn- coc-fzf-variables []
  (set nvim.g.coc_fzf_opts ["--layout=reverse"]))

(defn- coc-fzf-keymap []
  (nvim.set_keymap :n "<leader>cx" ":CocFzfList diagnostics<cr>" {:silent true}))

(coc-fzf-variables)
(coc-fzf-keymap)
