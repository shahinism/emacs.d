(use-package rust-mode
  :mode "\\.rs$"
  :init
  (add-hook 'rust-mode-hook #'flycheck-mode))

(use-package flycheck-rust
  :after rust-mode)

(use-package racer
  :after rust-mode
  :init
  (add-hook 'rust-mode-hook #'racer-mode)
  (add-hook 'rust-mode-hook #'eldoc-mode)
  (add-hook 'rust-mode-hook #'flycheck-rust-setup)
  (add-hook 'racer-mode-hook #'company-mode))

(provide 'mymacs-rust)
