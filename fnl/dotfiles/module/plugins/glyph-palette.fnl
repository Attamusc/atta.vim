(module dotfiles.module.plugins.glyph-palette
  {require {nvim aniseed.nvim}
   require-macros [dotfiles.macros]})

(augroup :GlyphPaletteGroup
  (autocmd :FileType "fern" "call glyph_palette#apply()")
  (autocmd :FileType "nerdtree,startify" "call glyph_palette#apply()"))
