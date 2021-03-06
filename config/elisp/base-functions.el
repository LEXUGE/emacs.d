;; Add your custom functions here

;; (defun something
;;    (do-something))

(defun enable-trailing-whitespace ()
  "Show trailing spaces and delete on saving."
  (setq show-trailing-whitespace t)
  (when (derived-mode-p 'prog-mode)
    (delete-trailing-whitespace)))

(defun my-backup-enable-p (name)
  "Filter certain file backups"
  (when (normal-backup-enable-predicate name)
    (let ((backup t))
      (mapc (lambda (re)
              (setq backup (and backup (not (string-match re name)))))
            my-backup-ignore-regexps)
      backup)))

(provide 'base-functions)
