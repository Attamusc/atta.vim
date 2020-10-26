(module init
  {require {core aniseed.core
            nvim aniseed.nvim
            util dotfiles.util}})

;; Load all modules in no particular order.
;;
;; **Note:** Use the lua path as the glob since that's where the compiled version
;; of all these files will end up
(->> (util.glob (.. util.config-path "/lua/dotfiles/module/*.lua"))
     (core.run! (fn [path]
                  (require (string.gsub path ".*/(.-)/(.-)/(.-)%.lua" "%1.%2.%3")))))
