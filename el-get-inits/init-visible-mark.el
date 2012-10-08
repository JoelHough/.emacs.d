(require 'visible-mark)
(setq visible-mark-max 2)
(defface my-visible-mark-face-1
  `((t (:background "#3b5bab" :foreground "white")))
  "Face for the mark."
  :group 'visible-mark)
(defface my-visible-mark-face-2
  `((t (:background "#2b6b3b" :foreground "white")))
  "Face for the mark."
  :group 'visible-mark)
(setq visible-mark-faces `(my-visible-mark-face-1 my-visible-mark-face-2))
(global-visible-mark-mode +1)
