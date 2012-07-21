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
                        (require 'ace-jump-mode)
                        (global-set-key (kbd "C-q") 'ace-jump-mode)
                        (setq ace-jump-mode-move-keys (string-to-list "neioarstluy;pfwqjhgdm,./zxcvkb"))))
        (:name expand-region
               :after (progn
                        (global-set-key (kbd "C-=") 'er/expand-region)))
        (:name helm
               :after (progn
                        (global-set-key (kbd "C-c h") 'helm-mini)))
        (:name ack-and-a-half
               :website "https://github.com/jhelwig/ack-and-a-half"
               :description "ack.el + full-ack.el = ack-and-a-half.el (Yet another emacs front-end to ack)"
               :type github
               :pkgname "jhelwig/ack-and-a-half") 
        (:name projectile
               :depends helm
               :website "https://github.com/bbatsov/projectile"
               :description "Project Interaction Library for Emacs"
               :type github
               :pkgname "bbatsov/projectile"
               :prepare (progn
                          (autoload 'projectile-mode "projectile" "Minor mode to assist project management and navigation." t)
                          (autoload 'projectile-global-mode "projectile" nil t)
                          (autoload 'helm-projectile "helm-projectile" "Use projectile with Helm instead of ido." t))
               :autoloads nil
               :after (progn
                        (projectile-global-mode)
                        (global-set-key (kbd "C-c p h") 'helm-projectile)))
        (:name undo-tree
               :after (progn
                        (global-undo-tree-mode t)))))

(setq general-packages
      '(magit
        auto-complete
        psvn
        rainbow-mode
        perspective))

(provide 'general-packages)
