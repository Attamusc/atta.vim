(module dotfiles.module.plugins.telescope
  {require {nvim aniseed.nvim
            util dotfiles.util
            telescope telescope
            sorters telescope.sorters
            previewers telescope.previewers
            actions telescope.actions}})

(defn- telescope-settings []
  (telescope.setup {:defaults {:file_sorter sorters.get_fzy_sorter
                               :prompt_position :top
                               :prompt_prefix " >"
                               :color_devicons true
                               :sorting_strategy :ascending
                               :layout_strategy :flex
                               :mappings {:i {:<esc> actions.close}}
                               :file_previewer previewers.vim_buffer_cat.new
                               :grep_previewer previewers.vim_buffer_vimgrep.new
                               :qflist_previewer previewers.vim_buffer_qflist.new}
                    :extensions {:fzy_native {:override_generic_sorter false
                                              :override_file_sorter true}}})
  (telescope.load_extension "fzy_native"))

(defn- telescope-mappings []
  (util.noremap :n "<leader>ff" "<cmd>lua require('telescope.builtin').find_files()<cr>")
  (util.noremap :n "<leader>fb" "<cmd>lua require('telescope.builtin').buffers()<cr>")
  (util.noremap :n "<leader>fsa" "<cmd>lua require('telescope.builtin').live_grep()<cr>")
  (util.noremap :n "<leader>fss" "<cmd>lua require('telescope.builtin').grep_string()<cr>")
  (util.noremap :n "<leader>fgs" "<cmd>lua require('telescope.builtin').git_status()<cr>")
  (util.noremap :n "<leader>fgc" "<cmd>lua require('telescope.builtin').git_commits()<cr>"))

(telescope-settings)
(telescope-mappings)
