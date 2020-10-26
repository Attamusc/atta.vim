(module dotfiles.util
  {require {nvim aniseed.nvim}})

(def config-path (nvim.fn.stdpath "config"))

(defn expand [path]
  (nvim.fn.expand path))

(defn glob [path]
  (nvim.fn.glob path true true true))

(defn exists? [path]
  (= (nvim.fn.filereadable path) 1))

(defn lua-file [path]
  (nvim.ex.luafile path))

(defn noremap [mode from to]
  "Sets a mapping with {:noremap true}."
  (nvim.set_keymap mode from to {:noremap true}))

(defn map [mode from to]
  "Sets a mapping for all modes"
  (nvim.set_keymap mode from to {}))

