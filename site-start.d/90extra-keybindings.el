(global-set-key "\C-ce" 'fc-eval-and-replace)

(global-set-key "\C-x\C-m" 'smex)

(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)

(global-set-key (kbd "C-z") 'undo-tree-undo)
(global-set-key [remap backward-up-list] 'backward-up-sexp)

(global-set-key "\C-xQ" 'my-macro-query)

(global-set-key "\C-c\C-g" 'magit-status)

(global-set-key "\C-x\C-a" 'ag-project-regexp)
