(setq init-files (mapcar (lambda (c) 
          (cons (format "init-%s.el" (plist-get c :name)) 
                (mapconcat 'identity 
                           (mapcar (lambda (a) 
                                     (format "%s\n" a)) 
                                   (cdr (plist-get c :after)))
                           "\n")))
        el-get-sources))
(mapc (lambda (f)
        (setq buf (find-file (car f)))
        (mark-whole-buffer)
        (erase-buffer)
        (insert (cdr f))
        (save-buffer)
        (kill-buffer))
      init-files)
