(global-set-key "\C-x\C-m" 'smex)

(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)

(global-set-key (kbd "C-z") 'undo-tree-undo)
(global-set-key [remap backward-up-list] 'backward-up-sexp)

(provide 'extra-keybindings)
