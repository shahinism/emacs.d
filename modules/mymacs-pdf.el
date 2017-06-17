;; pdf-tools
(use-package pdf-tools
  :defer t
  :mode "\\.pdf$"
  :init
  (pdf-tools-install))


(provide 'mymacs-pdf)
