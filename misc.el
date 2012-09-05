;; Make auto-complete work with geiser
(require 'geiser)
(require 'auto-complete)
(ac-define-source geiser
  '((candidates . (lambda () (append (geiser-completion--complete ac-prefix nil) (geiser-completion--complete ac-prefix t))))))
(add-hook 'scheme-mode-hook (lambda () (setq ac-sources (append ac-sources '(ac-source-geiser)))))

(add-hook 'jabber-alert-message-hooks 'jabber-notify-popup)

(global-auto-complete-mode)

(provide 'misc)
