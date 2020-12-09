(module dotfiles.module.plugins.fern
  {require {core aniseed.core
            nvim aniseed.nvim
            util dotfiles.util}
   require-macros [dotfiles.macros]})

(defn- map-buffer [from to opt]
  (let [options (core.merge opt {})]
    (nvim.buf_set_keymap 0 :n from to options)))

(defn- fern-variables []
  (set nvim.g.fern#renderer "nerdfont")
  (set nvim.g.fern#disable_default_mappings 1))

(defn- fern-mapping []
  (nvim.set_keymap "" :<leader>e ":Fern . -drawer -reveal=% -toggle -width=35<cr><c-w>=" {:silent true}))

(defn- fern-augroups []
  (augroup :FernOpenHijack
           (autocmd :BufEnter :* :++nested ":lua require('dotfiles.module.plugins.fern')['hijack-directory']()"))
  (augroup :FernInit 
           (autocmd :FileType :fern ":lua require('dotfiles.module.plugins.fern')['fern-init']()")))

(defn fern-init []
  ; Bailing out of lua for this since for some reason I can't get the nvim.wo.* version of these
  ; to actually work properly for only the buffer, and these don't exists as nvim.bo.* versions.
  (nvim.command "setlocal nornu")
  (nvim.command "setlocal nonu")
  (map-buffer "<Plug>(fern-my-open-expand-collapse)"
              "fern#smart#leaf(\"\\<Plug>(fern-action-open:select)\", \"\\<Plug>(fern-action-expand)\", \"\\<Plug>(fern-action-collapse)\")"
              {:expr true})
  (map-buffer :<CR> "<Plug>(fern-my-open-expand-collapse)")
  (map-buffer :<2-LeftMouse> "<Plug>(fern-my-open-expand-collapse)")
  (map-buffer :n "<Plug>(fern-action-new-path)")
  (map-buffer :d "<Plug>(fern-action-remove)")
  (map-buffer :c "<Plug>(fern-action-copy)")
  (map-buffer :m "<Plug>(fern-action-move)")
  (map-buffer :M "<Plug>(fern-action-rename)")
  (map-buffer :h "<Plug>(fern-action-hidden-toggle)")
  (map-buffer :r "<Plug>(fern-action-reload)")
  (map-buffer :i "<Plug>(fern-action-mark:toggle)")
  (map-buffer :s "<Plug>(fern-action-open:split)")
  (map-buffer :v "<Plug>(fern-action-open:vsplit)")
  (map-buffer :x "<Plug>(fern-action-collapse)")
  (map-buffer :< "<Plug>(fern-action-leave)" {:nowait true})
  (map-buffer :> "<Plug>(fern-action-enter)" {:nowait true}))

(defn hijack-directory []
  (let [path (nvim.fn.expand "%:p")]
    (when (= 1 (nvim.fn.isdirectory path))
      (nvim.ex.bwipeout "%")
      (nvim.command (nvim.fn.printf "Fern %s" (nvim.fn.fnameescape path))))))

(fern-variables)
(fern-mapping)
(fern-augroups)
