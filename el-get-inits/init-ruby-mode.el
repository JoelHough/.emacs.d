(add-hook 'ruby-mode-hook
          '(lambda ()
             (outline-minor-mode)
             (setq outline-regexp " *\\(def \\|class\\|module\\)")))
