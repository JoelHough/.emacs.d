(setq el-get-sources
      '((:name ack-and-a-half
              :website "https://github.com/jhelwig/ack-and-a-half"
              :description "ack.el + full-ack.el = ack-and-a-half.el (Yet another emacs front-end to ack)"
              :type github
              :pkgname "jhelwig/ack-and-a-half")
      (:name jinja2-mode
             :website "https://github.com/paradoxxxzero/jinja2-mode"
             :description "Jinja2 mode"
             :type github
             :pkgname "paradoxxxzero/jinja2-mode")
;      (:name projectile
;             :depends helm
;             :website "https://github.com/bbatsov/projectile"
;             :description "Project Interaction Library for Emacs"
;             :type github
;             :pkgname "bbatsov/projectile"
;             :prepare (progn
;                        (autoload 'projectile-mode "projectile" "Minor mode to assist project management and navigation." t)
;                        (autoload 'projectile-global-mode "projectile" nil t)
;                        (autoload 'helm-projectile "helm-projectile" "Use projectile with Helm instead of ido." t))
;             :autoloads nil)))
))

(setq my-packages '(zenburn-theme
                    ace-jump-mode
                    anything-rcodetools
                    auto-complete
                    autopair
                    coffee-mode
                    css-mode
                    dash
                    ;edit-server
                    ;evil
                    expand-region
                    grep-ed
                    ;haskell-mode
                    helm
                    highlight-parentheses
                    inf-ruby
                    lua-mode
                    magit
                    multi-term
                    org-mode
                    perspective
                    powerline
                    psvn
                    ;pymacs
                    ;python-mode
                    ;quack
                    rainbow-delimiters
                    rainbow-mode
                    rcodetools
                    rhtml-mode
                    rinari
                    ;rope
                    ;ropemacs
                    ;ropemode
                    ruby-compilation
                    ruby-mode
                    smex
                    ;slime
                    sunrise-commander
                    textmate
                    undo-tree
                    visible-mark
                    window-number
                    yaml-mode
                    yasnippet))
