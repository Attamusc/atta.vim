(module dotfiles.module.plugins.fzf
  {require {nvim aniseed.nvim
            util dotfiles.util}})

(defn- fzf-variables []
  (set nvim.env.FZF_DEFAULT_OPTS "--layout=reverse")
  (set nvim.g.fzf_command_prefix "Fzf")
  (set nvim.g.fzf_layout {:window {:width 0.8
                                   :height 0.6
                                   :yoffset 0.2
                                   :highlight :Normal}})
  (set nvim.g.fzf_preview_window "down:50%")
  (set nvim.g.fzf_action {:ctrl-t "tab split"
                          :ctrl-h "split"
                          :ctrl-v "vsplit"}))

(defn- fzf-mappings []
  (util.noremap :n "<leader>ff" ":FzfFiles<cr>")
  (util.noremap :n "<leader>fb" ":FzfBuffers<cr>")
  (util.noremap :n "<leader>fa" ":FzfRg<cr>"))

(fzf-variables)
(fzf-mappings)
