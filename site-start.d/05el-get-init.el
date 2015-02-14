;; el-get stuff
(add-to-list 'load-path (expand-file-name "el-get/el-get" dotfiles-dir))

(setq el-get-user-package-directory (expand-file-name "el-get-inits/" dotfiles-dir))

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))
