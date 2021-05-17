(module dotfiles.module.plugins.lualine
  {require {nvim aniseed.nvim
            nu aniseed.nvim.util
            lualine lualine}})

(local fern {:sections {:lualine_a ["[[Fern]]"]}
             :filetypes [:fern]})

(lualine.setup {:options {:icons_enabled true
                          :theme :tokyonight
                          :component_separators [: :]
                          :section_separators [: :]
                          :disabled_filetypes {}}
                :sections {:lualine_a [:mode]
                           :lualine_b [:branch :diff]
                           :lualine_c [:filename]
                           :lualine_x [:encoding :fileformat :filetype]
                           :lualine_y [:progress]
                           :lualine_z [:location]}
                :inactive_sections {:lualine_a []
                                    :lualine_b []
                                    :lualine_c [:filename]
                                    :lualine_x [:location]
                                    :lualine_y []
                                    :lualine_z []}
                :tabline {}
                :extensions [fern :fugitive]})
