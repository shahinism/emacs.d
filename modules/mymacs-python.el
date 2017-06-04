;; python
(defun python-mode-defaults ()
  "Default configuration for python mode"
  (subword-mode +1)
  (anaconda-mode 1)
  (eldoc-mode 1)
  (add-hook 'python-mode-hook 'anaconda-eldoc-mode))

(use-package anaconda-mode
  :config
  (add-hook 'python-mode-hook 'python-mode-defaults))

(use-package company-anaconda
  :after anaconda-mode)

(provide 'mymacs-python)
