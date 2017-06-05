;; js2-mode
(use-package js2-mode
  :mode "\\.js$"
  :interpreter "node"
  :config
  (setq js2-skip-preprocessor-directives t
        js2-highlight-external-variables nil
        js2-mode-show-parse-errors nil))

;; xref-js2
(use-package xref-js2)

;; Tern
(use-package tern
  :init (add-hook 'js2-mode-hook #'tern-mode))

(use-package company-tern
  :after
  tern
  company
  :config
  (add-to-list 'company-backends 'company-tern))

;; rjsx
(use-package rjsx-mode
  :mode "\\.jsx$"
  :mode "components/.+\\.js$")

;; coffee
(use-package coffee-mode
  :mode "\\.coffee$"
  :init (setq coffee-indent-like-python-mode t))

(provide 'mymacs-javascript)
