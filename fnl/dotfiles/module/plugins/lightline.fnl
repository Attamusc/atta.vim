(module dotfiles.module.plugins.lightline
  {require {nvim aniseed.nvim
            nu aniseed.nvim.util}})

(defn- bridge [from to]
  (nu.fn-bridge from :dotfiles.module.plugins.lightline to {:return true}))

(defn filename []
  (if (= vim.bo.filetype "fern")
    "Fern"
    (nvim.fn.expand "%t")))

(bridge :LightlineFilename :filename)

(set nvim.o.showmode false)
(set nvim.o.showtabline 1)
(set nvim.g.lightline
      {:colorscheme :dracula_pro
      :active {:left [[:mode :paste]
                      [:gitbranch :readonly :filename :modified]]}
      :inactive {:left [[:filename]]
                  :right []}
      :component: {:lineinfo "%3l:%-2v%<"}
      :component_function {:filename :LightlineFilename
                            :gitbranch :FugitiveHead}})
