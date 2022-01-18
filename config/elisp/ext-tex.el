(use-package tex
  :ensure auctex
  :mode (("\\.tex\\'" . LaTeX-mode))
  :config
  (setq-default TeX-engine 'luatex))

(use-package cdlatex
  :hook ((latex-mode LaTeX-mode markdown-mode) . turn-on-cdlatex)
  :config
  (setq cdlatex-command-alist
      '(("sum" "Insert \\sum\\limits_{}^{}"
         "\\sum\\limits_{?}^{}" cdlatex-position-cursor nil nil t)
	("int" "Insert \\int\\limits_{}^{}"
         "\\int\\limits_{?}^{}" cdlatex-position-cursor nil nil t)
	("tt" "Insert \\text{}"
	 "\\text{?}" cdlatex-position-cursor nil nil t)
	("apr" "Insert \\approx{}"
	 "\\approx{}" cdlatex-position-cursor nil nil t)
	("alid"       "Insert an ALIGNED environment template"
	 "" cdlatex-environment ("aligned") t t)
        ("prd" "Insert \\prod_{}^{}"
         "\\prod_{?}^{}" cdlatex-position-cursor nil nil t))))

(use-package pdf-tools
  :mode  ("\\.pdf\\'" . pdf-view-mode)
  :config
  (pdf-tools-install :no-query))

(provide 'ext-tex)
