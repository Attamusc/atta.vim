(module dotfiles.module.plugin.conjure
  {require {nvim aniseed.nvim}})

(set nvim.g.conjure#client#fennel#aniseed#aniseed_module_prefix "aniseed.")
(set nvim.g.conjure#eval#result_register "*")
(set nvim.g.conjure#log#botright true)
