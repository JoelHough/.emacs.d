(setq programming-sources
      '((:name slime
	       :after (progn
			(require 'slime)))
        (:name python-mode
	       :after (progn
			(define-key python-mode-map (kbd "C-c d") 'py-execute-def)))))
(setq programming-packages
      '(lua-mode
        pymacs
        rope
        ropemode
        ropemacs
        python-mode
        quack
        geiser))

(provide 'programming-packages)
