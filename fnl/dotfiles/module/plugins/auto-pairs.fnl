(module dotfiles.module.plugins.auto-pairs
  {require {nvim aniseed.nvim}})

(defn init []
  (let [auto-pairs nvim.g.AutoPairs]
    (tset auto-pairs "'" nil)
    (tset auto-pairs "`" nil)
    (set nvim.b.AutoPairs auto-pairs)))

(nvim.ex.autocmd
  :FileType
  "clojure,fennel,scheme"
  "lua require('dotfiles.module.plugins.auto-pairs').init()")
