;; Org-mode

(use-package org
  :config
  (setq org-directory "~/org-files"
        org-default-notes-file (concat org-directory "/notes.org")
        org-agenda-files (if (file-exists-p (concat org-directory "/agenda/")) (list (concat org-directory "/agenda/"))))
  (setq org-startup-indented t)
  (setq org-enforce-todo-dependencies t) ; Enforce dependencies
  (setq org-enforce-todo-checkbox-dependencies t) ; Enforce checkbox dependency
  (setq org-priority-highest 1)
  (setq org-priority-lowest 10)
  (setq org-priority-default 3)
  (setq org-log-done 'time) ; Log closing time
  (setq TeX-auto-untabify 't) ; Convert tabs properly into PDF
  (setq org-latex-toc-command "\\tableofcontents \\clearpage") ; Force page break after TOC
  :hook (org-mode . org-cdlatex-mode)
        (org-mode . visual-line-mode)
  :bind
  ("C-c l" . org-store-link)
  ("C-c a" . org-agenda))

(use-package org-bullets
  :config
  (setq org-hide-leading-stars t)
  (add-hook 'org-mode-hook
            (lambda ()
              (org-bullets-mode t))))

(provide 'ext-org)
