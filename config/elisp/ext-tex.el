(use-package tex
  :defer t
  :ensure auctex
  :mode (("\\.tex\\'" . LaTeX-mode)))

(use-package cdlatex
  :hook ((latex-mode LaTeX-mode markdown-mode) . turn-on-cdlatex)
  :config
  (setq cdlatex-command-alist
      '(("sum" "Insert \\sum\\limits_{}^{}"
         "\\sum\\limits_{?}^{}" cdlatex-position-cursor nil nil t)
	("tt" "Insert \\text{}"
	 "\\text{?}" cdlatex-position-cursor nil nil t)
	("apr" "Insert \\approx{}"
	 "\\approx{}" cdlatex-position-cursor nil nil t)
	("alid"       "Insert an ALIGNED environment template"
	 "" cdlatex-environment ("aligned") t t)
        ("prd" "Insert \\prod_{}^{}"
         "\\prod_{?}^{}" cdlatex-position-cursor nil nil t))))

(use-package latex-preview-pane
  :hook ((latex-mode LaTeX-mode) . latex-preview-pane-mode)
  )

(use-package pdf-tools)

(provide 'ext-tex)
