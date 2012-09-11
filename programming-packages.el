(setq programming-sources
      '((:name slime
	       :after (progn
			(require 'slime)))
        (:name python-mode
	       :after (progn
			(define-key python-mode-map (kbd "C-c d") 'py-execute-def)))
        (:name jinja2-mode
               :website "https://github.com/paradoxxxzero/jinja2-mode"
               :description "Jinja2 mode"
               :type github
               :pkgname "paradoxxxzero/jinja2-mode")))
(setq programming-packages
      '(lua-mode
        pymacs
        rope
        ropemode
        ropemacs
        python-mode
        haskell-mode
        quack
        geiser))

(provide 'programming-packages)
