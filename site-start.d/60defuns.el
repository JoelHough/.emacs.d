(defun fc-eval-and-replace ()
  "Replace the preceding sexp with its value."
  (interactive)
  (backward-kill-sexp)
  (condition-case nil
      (princ (eval (read (current-kill 0)))
             (current-buffer))
    (error (message "Invalid expression")
           (insert (current-kill 0)))))

(defun ruby-model-property-docify (prop)
  "Generate horrible, verbose model parameter doc comments from sane sexp"
  (let* ((field-string (lambda (name val)
                         (cond ((string-equal name "=") (format "%-11s \"example\": %S" "#" val))
                               ((string-equal name ":") (format "%-11s \"type\": \"%s\"" "#" val))
                               (t (format "%-11s \"%s\": %S" "#" name val)))))
         (field-strings (lambda (fields)
                         (if (cadr fields)
                             (cons (funcall field-string (car fields) (cadr fields)) (funcall field-strings (cddr fields)))
                           (list (format "%-11s \"description\": \"%s\"" "#" (car fields)))))))
    (format "%-9s \"%s\": {
%s
%-9s }" "#" (car prop) (mapconcat 'identity (funcall field-strings (cdr prop)) ",\n") "#")))

(defun ruby-model-docify (id desc props)
  "Generate horrible, verbose model doc comments from sane sexps.
e.g. (ruby-model-docify 'MyModel \"A fancy model\" '((id = 2 : integer \"the id\") (name = \"bob\" $ref \"UserName\" \"the name\")))"
  (format "# @model %s
#     {
#       \"id\": \"%S\",
#       \"description\": \"%s\",
#       \"properties\": {
%s
#       }
#     }" id id desc (mapconcat 'ruby-model-property-docify props ",\n")))

(defun my-macro-query (arg)
  "Prompt for input using minibuffer during kbd macro execution.
    With prefix argument, allows you to select what prompt string to use.
    If the input is non-empty, it is inserted at point."
  (interactive "P")
  (let* ((query (lambda () (kbd-macro-query t)))
	 (prompt (if arg (read-from-minibuffer "PROMPT: ") "Input: "))
	 (input (unwind-protect
		    (progn
		      (add-hook 'minibuffer-setup-hook query)
		      (read-from-minibuffer prompt))
		  (remove-hook 'minibuffer-setup-hook query))))
    (unless (string= "" input) (insert input))))

(defun backward-up-sexp (arg)
  "Move backward to quote-like characters"
  (interactive "p")
  (let ((ppss (syntax-ppss)))
    (cond ((elt ppss 3)
           (goto-char (elt ppss 8))
           (backward-up-sexp (1- arg)))
          ((backward-up-list arg)))))

(defun notify-popup (title msg &optional icon sound)
  "Show a popup if we're on X, or echo it otherwise; TITLE is the title
of the message, MSG is the context. Optionally, you can provide an ICON and
a sound to be played"
  (interactive)
  (when sound (shell-command
               (concat "mplayer -really-quiet " (shell-quote-argument sound) " 2> /dev/null")))
  (if (eq window-system 'x)
      (shell-command (concat "notify-send "
                             (if icon (concat "-i " (shell-quote-argument icon) " "))
                             (shell-quote-argument title) " " (shell-quote-argument msg)))
    ;; text only version
    (message (concat title ": " msg))))

(defun jabber-notify-popup (from buf text proposed-alert)
  "(jabber.el hook) Notify of new Jabber chat messages via notify-popup"
  (when (or jabber-message-alert-same-buffer
            (not (memq (selected-window) (get-buffer-window-list buf))))
    (if (jabber-muc-sender-p from)
        (notify-popup (format "%s"
                              (jabber-jid-displayname (jabber-jid-user from)))
                      (format "%s: %s" (jabber-jid-resource from) text)))
    (notify-popup (format "%s" (jabber-jid-displayname from))
                  text
                  (file-truename (plist-get (cdr (get (jabber-jid-symbol (jabber-jid-symbol from)) 'avatar)) :file)))))

(defun socialize ()
  "Start up the chatting tools"
  (interactive)
  (require 'secrets "secrets.el.gpg")
  (jabber-connect-all))

(defun make-capture-frame ()
  "Create a new frame and run org-capture."
  (interactive)
  (let ((frame (make-frame '((name . "capture")
                             (width . 120)
                             (height . 15)
                             (visibility . nil)
                             (tool-bar-lines . 0)
                             (menu-bar-lines . 0)
                             (user-position . t)
                             (sticky . t)))))
    (make-frame-visible frame)
    (select-frame-set-input-focus frame)
    (setq word-wrap 1)
    (setq truncate-lines nil)
    (condition-case nil
      (flet 
          ((org-switch-to-buffer-other-window (&rest args) (apply 'switch-to-buffer args)))
        (org-capture))
      (error (delete-frame frame)))))

