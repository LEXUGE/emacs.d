(use-package rust-mode
  :bind (:map rust-mode-map
              ("C-c c" . rust-compile)
              ("C-c t" . rust-test))
  :config
  (setq rust-format-on-save t))

(use-package flycheck-rust
  :config
  (with-eval-after-load 'rust-mode
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)))

(provide 'lang-rust)
