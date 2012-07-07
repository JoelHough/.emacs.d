(setq general-sources
      '((:name smex
	       :after (progn
			(global-set-key [(meta x)] (lambda ()
						     (interactive)
						     (or (boundp 'smex-cache)
							 (smex-initialize))
						     (global-set-key [(meta x)] 'smex)
						     (smex)))
			(global-set-key [(shift meta x)] (lambda ()
							   (interactive)
							   (or (boundp 'smex-cache)
							       (smex-initialize))
							   (global-set-key [(shift meta x)] 'smex-major-mode-commands)
							   (smex-major-mode-commands)))))
        (:name autopair
	       :after (progn
			(autopair-global-mode t)))
        (:name multi-term
	       :after (progn
			(global-set-key (kbd "C-c t") 'multi-term-next)
			(global-set-key (kbd "C-c T") 'multi-term)))
	(:name yasnippet
	       :after (progn
			(yas/global-mode t)))
        (:name ace-jump-mode
               :after (progn
                        (global-set-key (kbd "C-c SPC") 'ace-jump-mode)))
        (:name expand-region
               :after (progn
                        (global-set-key (kbd "C-=") 'er/expand-region)))
        (:name helm
               :after (progn
                        (global-set-key (kbd "C-c h") 'helm-mini)))))

(setq general-packages
      '(el-get
        magit
        auto-complete
        remember
        psvn
        undo-tree
        rainbow-mode
        perspective))

(provide 'general-packages)
