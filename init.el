;; Set path to .emacs.d
(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))

(add-to-list 'load-path dotfiles-dir)

(require 'ui-tweaks)

;; el-get stuff
(add-to-list 'load-path (expand-file-name "el-get/el-get" dotfiles-dir))

(unless (require 'el-get nil t)
  (url-retrieve
   "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
   (lambda (s)
     (end-of-buffer)
     (eval-print-last-sexp))))

(require 'appearance-packages)
(require 'general-packages)
(require 'programming-packages)
(require 'productivity-packages)

(setq el-get-sources
      (append
       appearance-sources
       general-sources
       programming-sources
       productivity-sources))

(setq my-packages
      (append
       appearance-packages
       general-packages
       programming-packages
       productivity-packages
       (mapcar '(lambda (source) (plist-get source :name)) el-get-sources)))

(el-get 'sync my-packages)
(el-get 'wait)
;; end of el-get stuff

(require 'org-settings)
(require 'defuns)
(require 'mode-mappings)
(require 'extra-keybindings)
(require 'user-settings)
(require 'misc)
