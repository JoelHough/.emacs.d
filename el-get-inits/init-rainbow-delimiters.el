(require (quote rainbow-delimiters))

(defun turn-on-rainbow-delimiters-if-desired nil (when (cond (... t) (... ...) (t ...)) (let (inhibit-quit) (rainbow-delimiters-mode t))))

(define-globalized-minor-mode global-rainbow-delimiters-mode rainbow-delimiters-mode turn-on-rainbow-delimiters-if-desired :initialize (quote custom-initialize-delay) :init-value (not (or noninteractive emacs-basic-display)) :group (quote rainbow-delimiters))

(global-rainbow-delimiters-mode t)
