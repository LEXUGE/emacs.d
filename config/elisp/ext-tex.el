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
	("prod" "Insert \\prod\\limits_{}^{}"
         "\\prod\\limits_{?}^{}" cdlatex-position-cursor nil nil t)
	("int" "Insert \\int\\limits_{}^{}"
         "\\int\\limits_{?}^{}" cdlatex-position-cursor nil nil t)
	("tt" "Insert \\text{}"
	 "\\text{?}" cdlatex-position-cursor nil nil t)
	("bf" "Insert \\mathbf{}"
	 "\\mathbf{?}" cdlatex-position-cursor nil nil t)
	("bb" "Insert \\mathbb{}"
	 "\\mathbb{?}" cdlatex-position-cursor nil nil t)
	("apr" "Insert \\approx{}"
	 "\\approx{}" cdlatex-position-cursor nil nil t)
	("alid"       "Insert an ALIGNED environment template"
	 "" cdlatex-environment ("aligned") t t)
	("eqn"       "Insert an EQUATION environment template"
	 "" cdlatex-environment ("equation") t t))))

(use-package pdf-tools
  :mode  ("\\.pdf\\'" . pdf-view-mode)
  :config
  (pdf-tools-install :no-query))

(provide 'ext-tex)
