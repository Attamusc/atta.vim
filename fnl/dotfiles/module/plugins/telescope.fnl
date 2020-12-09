(module dotfiles.module.plugins.telescope
  {require {nvim aniseed.nvim
            telescope telescope
            actions telescope.actions}})

(defn- telescope-settings []
  (telescope.setup {:defaults {:prompt_position :top
                               :prompt_prefix " >"
                               :sorting_strategy :ascending
                               :layout_strategy :flex
                               :mappings {:i {:<esc> actions.close
                                              :<c-j> actions.move_selection_next
                                              :<c-k> actions.move_selection_prev
                                              :<c-p> actions.preview_scrolling_up
                                              :<c-n> actions.preview_scrolling_down}}}}))

(telescope-settings)
