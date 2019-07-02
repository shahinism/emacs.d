;; LSP-mode
; https://github.com/emacs-lsp/lsp-mode

; https://github.com/emacs-lsp/lsp-ui/issues/226
(setq lsp-prefer-flymake nil)

(use-package lsp-mode
  :hook (js2-mode . lsp-deferred)
  :commands lsp)

;; optionally
(use-package lsp-ui :commands lsp-ui-mode)
(use-package company-lsp :commands company-lsp)
(use-package helm-lsp :commands helm-lsp-workspace-symbol)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)

(provide 'mymacs-lsp)