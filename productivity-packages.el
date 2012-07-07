(setq productivity-sources
      '((:name org-mode
	       :after (progn
			;; active Babel languages
			(org-babel-do-load-languages
			 'org-babel-load-languages
			 '((gnuplot . t)))
			;; add additional languages with '((language . t)))
			(setq org-latex-to-pdf-process
			      '("xelatex -interaction nonstopmode %f"
				"xelatex -interaction nonstopmode %f"))
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
				("xetex,setpagesize=false" "hyperref" nil)
				))))))

(setq productivity-packages
      '())

(provide 'productivity-packages)
