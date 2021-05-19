(module dotfiles.module.plugins.nvim-treesitter
  {require {nvim aniseed.nvim
            ts-configs nvim-treesitter.configs
            util dotfiles.util}})

(defn- setup-treesitter []
  (ts-configs.setup {:ensure_installed :all
                     :highlight {:enable true}
                     :indent {:enable true}}))

(setup-treesitter)
