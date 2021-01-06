(module dotfiles.module.plugins.telescope
  {require {nvim aniseed.nvim
            util dotfiles.util
            telescope telescope
            actions telescope.actions}})

(defn- telescope-settings []
  (telescope.setup {:defaults {:prompt_position :top
                               :prompt_prefix " >"
                               :sorting_strategy :ascending
                               :layout_strategy :flex
                               :mappings {:i {:<esc> actions.close}}}}))

(defn- telescope-mappings []
  (util.noremap :n "<leader>ff" "<cmd>Telescope find_files<cr>")
  (util.noremap :n "<leader>fb" "<cmd>Telescope buffers<cr>")
  (util.noremap :n "<leader>fa" "<cmd>Telescope live_grep<cr>")
  (util.noremap :n "<leader>fgs" "<cmd>Telescope git_status<cr>")
  (util.noremap :n "<leader>fgc" "<cmd>Telescope git_commits<cr>"))

(telescope-settings)
(telescope-mappings)
