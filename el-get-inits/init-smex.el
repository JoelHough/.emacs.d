(global-set-key [(meta x)] (lambda nil (interactive) (or (boundp ...) (smex-initialize)) (global-set-key [...] (quote smex)) (smex)))

(global-set-key [(shift meta x)] (lambda nil (interactive) (or (boundp ...) (smex-initialize)) (global-set-key [...] (quote smex-major-mode-commands)) (smex-major-mode-commands)))
