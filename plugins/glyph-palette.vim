if dein#tap('glyph-palette.vim')
  augroup GlyphPaletteGroup
    autocmd! *
    autocmd FileType fern call glyph_palette#apply()
    autocmd FileType nerdtree,startify call glyph_palette#apply()
  augroup END 
endif
