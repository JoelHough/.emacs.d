;; Set path to .emacs.d
(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))

(add-to-list 'load-path dotfiles-dir)

(package-initialize t)

(autoload 'my-site-start (expand-file-name "my-site-start.el" dotfiles-dir) nil t)
(my-site-start (expand-file-name "site-start.d/" dotfiles-dir))
