;; Silence the infernal beeping
(setq visible-bell 1)

;; Disengage ludicrous-speed scrolling plus some other scroll tweaks
(setq scroll-margin 2
      scroll-conservatively 10
      scroll-preserve-screen-position nil
      auto-window-vscroll nil
      mouse-wheel-progressive-speed nil
      mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil)))

(global-set-key (kbd "C-x C-z") 'ff-find-other-file)

;; Keep backups in one place, and keep several versions
(setq backup-by-copying t
      backup-directory-alist `(("." . ,(expand-file-name (concat dotfiles-dir "backups"))))
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)

;; Put autosave files (ie #foo#) in one place, *not*
;; scattered all over the file system!
(defvar autosave-dir (concat dotfiles-dir "autosaves/"))
(make-directory autosave-dir t)
(setq auto-save-file-name-transforms `(("\\(?:[^/]*/\\)*\\(.*\\)", (concat autosave-dir "\\1") t)))

(setq bookmark-file-default (expand-file-name "bookmarks" dotfiles-dir)
      bookmark-save-flag 1)

(setq abbrev-file-name (expand-file-name "abbrev-defs" dotfiles-dir)
      save-abbrevs t)
(quietly-read-abbrev-file)

;; Saner RE syntax
(require 're-builder)
(setq reb-re-syntax 'string)

(global-hl-line-mode t)

(setq line-number-mode t)
(setq column-number-mode t)

(blink-cursor-mode 0)

(setq inhibit-splash-screen t)

;; No scrollbars or toolbar, but I kinda like the menu bar
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode 1))

;; es and o take too long to type
(fset 'yes-or-no-p 'y-or-n-p)

;; Tabs are evil
(setq-default indent-tabs-mode nil)

;; 8 is too much
(setq-default tab-width 2)

;; delete trailing whitespace on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; autoindent on enter
(define-key global-map (kbd "RET") 'newline-and-indent)

;; Use code-pagew so I can see characters like µ
(require 'code-pages)

;; I like using upcase-region
(put 'upcase-region 'disabled nil)

;; srsly, who uses ispell?
(setq ispell-program-name "aspell")
