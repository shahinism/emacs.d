;; yaml-mode
(use-package yaml-mode
  :mode "\\.ya?ml$")

;; json-mode
(use-package json-mode
  :mode "\\.json$"
  :config
  (evil-leader/set-key-for-mode 'json-mode
    "=" 'json-pretty-print-buffer))

;; json-snatcher
(use-package json-snatcher
  :after json-mode
  :config
  (evil-leader/set-key-for-mode 'json-mode
    "gp" 'jsons-print-path))

(provide 'mymacs-templates)
