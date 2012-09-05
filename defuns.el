;; For backing up in say, double quotes or brackets
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

(provide 'defuns)
