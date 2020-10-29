(use-package rust-mode
  :bind (:map rust-mode-map
              ("C-c c" . rust-compile)
              ("C-c t" . rust-test))
  :config
  (setq rust-format-on-save t))

(setq lsp-rust-server 'rust-analyzer)

(provide 'lang-rust)
