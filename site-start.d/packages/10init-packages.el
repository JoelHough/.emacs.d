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
      (:name projectile
             :depends helm
             :website "https://github.com/bbatsov/projectile"
             :description "Project Interaction Library for Emacs"
             :type github
             :pkgname "bbatsov/projectile"
             :prepare (progn
                        (autoload 'projectile-mode "projectile" "Minor mode to assist project management and navigation." t)
                        (autoload 'projectile-global-mode "projectile" nil t)
                        (autoload 'helm-projectile "helm-projectile" "Use projectile with Helm instead of ido." t))
             :autoloads nil)))

(setq my-packages '(ace-jump-mode
                    auto-complete
                    autopair
                    css-mode
                    edit-server
                    expand-region
                    geiser
                    haskell-mode
                    helm
                    highlight-parentheses
                    inf-ruby
                    lua-mode
                    magit
                    multi-term
                    org-mode
                    perspective
                    psvn
                    pymacs
                    python-mode
                    quack
                    rainbow-delimiters
                    rainbow-mode
                    rhtml-mode
                    rope
                    ropemacs
                    ropemode
                    ruby-compilation
                    ruby-mode
                    rvm
                    textmate
                    slime
                    sunrise-commander
                    smex
                    undo-tree
                    window-number
                    yaml-mode
                    yasnippet
                    zenburn-theme))
