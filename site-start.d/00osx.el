(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell 
      (replace-regexp-in-string "[[:space:]\n]*$" "" 
        (shell-command-to-string "$SHELL -l -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

(when (equal system-type 'darwin) 
  (setq mac-command-modifier 'control)
  (setq mac-option-modifier 'meta)
  (setq mac-control-modifier 'super)
  (set-exec-path-from-shell-PATH)
  (global-set-key (kbd "C-`") 'other-frame)
  (add-to-list 'exec-path "/usr/local/git/bin"))
