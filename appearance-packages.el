(setq appearance-sources
      '((:name highlight-parentheses
	       :after (progn
			(define-globalized-minor-mode global-highlight-parentheses-mode
			  highlight-parentheses-mode
			  (lambda ()
			    (highlight-parentheses-mode t)))
			(global-highlight-parentheses-mode t)))
        (:name rainbow-delimiters
	       :after (progn
			;; Global rainbow delimiters
			(require 'rainbow-delimiters)
			(defun turn-on-rainbow-delimiters-if-desired ()
			  (when (cond ((eq font-lock-global-modes t)
				       t)
				      ((eq (car-safe font-lock-global-modes) 'not)
				       (not (memq major-mode (cdr font-lock-global-modes))))
				      (t (memq major-mode font-lock-global-modes)))
			    (let (inhibit-quit)
			      (rainbow-delimiters-mode t))))

			(define-globalized-minor-mode global-rainbow-delimiters-mode
			  rainbow-delimiters-mode turn-on-rainbow-delimiters-if-desired
			  ;; What was this :extra-args thingy for?  --Stef
			  ;; :extra-args (dummy)
			  :initialize 'custom-initialize-delay
			  :init-value (not (or noninteractive emacs-basic-display))
			  :group 'rainbow-delimiters)
			;; end global rainbow delimiters
			(global-rainbow-delimiters-mode t)))
        (:name zenburn-theme
	       :after (progn 
                        (load-theme 'zenburn t)))))

(setq appearance-packages
      '())

(provide 'appearance-packages)
