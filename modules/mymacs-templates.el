;; yaml-mode
(use-package yaml-mode
  :mode "\\.ya?ml$")

;; json-mode
(use-package json-mode
  :mode "\\.json$"
  :config
  (evil-leader/set-key-for-mode 'json-mode
    "=" 'json-pretty-print-buffer))

(provide 'mymacs-templates)
