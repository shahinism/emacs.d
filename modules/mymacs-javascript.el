(defun javascript-doc ()
  "Dfine Javascript docs for helm-dash."
  (interactive)
  (setq-local helm-dash-docsets '("JavaScript")))

;; js2-mode
(defun mymacs/js2-mode-hook ()
  (javascript-doc)
  (setq flycheck-checker 'javascript-standard))

(use-package js2-mode
  :mode "\\.js$"
  :interpreter "node"
  :config
  (setq js2-skip-preprocessor-directives t
        js2-highlight-external-variables nil
        js2-mode-show-parse-errors nil
        js2-mode-show-strict-warnings nil)

  (setq-default js2-basic-offset 2)

  (add-hook 'js2-mode-hook 'mymacs/js2-mode-hook))

;; xref-js2
(use-package xref-js2)

;; Tern
(use-package tern
  :init (add-hook 'js2-mode-hook #'tern-mode)
  :config
  (setq tern-command (append tern-command '("--no-port-file"))))

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
