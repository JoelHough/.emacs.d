(setq my-packages (append
                   my-packages
                   (mapcar '(lambda (source) (plist-get source :name)) el-get-sources)))

(el-get 'sync my-packages)
(el-get 'wait)
