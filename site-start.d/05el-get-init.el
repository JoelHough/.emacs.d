;; el-get stuff
(add-to-list 'load-path (expand-file-name "el-get/el-get" dotfiles-dir))

(unless (require 'el-get nil t)
  (url-retrieve
   "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
   (lambda (s)
     (let (el-get-master-branch)
       (goto-char (point-max))
       (eval-print-last-sexp)))))
