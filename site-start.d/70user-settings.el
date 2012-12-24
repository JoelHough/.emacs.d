;; GTalk with jabber
(setq jabber-account-list
      '(("joel@joelhough.com" 
         (:network-server . "talk.google.com")
         (:connection-type . ssl))))

;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" dotfiles-dir))
(load custom-file)
