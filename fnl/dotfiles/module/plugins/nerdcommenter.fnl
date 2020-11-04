(module dotfiles.module.plugins.nerdcommenter
  {require {nvim aniseed.nvim
            util dotfiles.util}})

(when (nvim.fn.dein#tap "nerdcommenter")
  (set nvim.g.NERDSpaceDelims 1)
  (set nvim.g.NERDToggleCheckAllLines 1)

  (util.map "" "<leader>cc" "<plug>NERDCommenterToggle"))
