
;; active Babel languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '((gnuplot . t)))
;; add additional languages with '((language . t)))

(setq org-latex-to-pdf-process
      '("xelatex -interaction nonstopmode %f"
        "xelatex -interaction nonstopmode %f"))

;; org-latex customization
(require 'org-latex)
(add-to-list 'org-export-latex-classes
             '("koma-article"
               "\\documentclass{scrartcl}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
(add-to-list 'org-export-latex-classes
             '("koma-report"
               "\\documentclass{scrreprt}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
(setq org-export-latex-default-packages-alist
      '(("" "fontspec" t)
        ("" "xunicode" t)
        ("" "url" t)
        ("" "rotating" t)
        ("" "graphicx" t)
        ("american" "babel" t)
        ("babel" "csquotes" t)
        ("" "soul" t)
        ("xetex,setpagesize=false" "hyperref" nil)))

(add-hook 'org-mode-hook
          (lambda ()
            (turn-on-font-lock)
            (setq word-wrap 1)
            (setq truncate-lines nil)
            (flyspell-mode 1)))

;; notetaking and capture stuff
(setq org-default-notes-file (expand-file-name "notes.org" org-directory))

(defadvice org-capture-finalize (after delete-capture-frame activate)
  "Advise capture-finalize to close the frame if it is the capture frame"
  (if (equal "capture" (frame-parameter nil 'name))
      (delete-frame)))

(defadvice org-capture-destroy (after delete-capture-frame activate)
  "Advise capture-destroy to close the frame if it is the capture frame"
  (if (equal "capture" (frame-parameter nil 'name))
      (delete-frame)))

(setq org-capture-templates
      `(
        ("n" "Notes" entry (file
                            ,(expand-file-name "notes.org" org-directory))
         "* %^{Description} %^g %?\nAdded: %U")
        ("j" "Journal" entry (file+datetree
                              ,(expand-file-name "journal.org" org-directory))
         "** %^{Title} %U\n%?\n")
        ("t" "Tracker" entry (file
                              ,(expand-file-name "tracker.org" org-directory))
         "* %^{Note} %^g %?\nAdded: %U")))

(provide 'org-settings)
